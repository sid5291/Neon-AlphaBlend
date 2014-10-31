/*
 * main.c
 *
 *  Created on: Oct 8, 2014
 *      Author: Siddhartha
 */
#include <stdio.h>
#include <sys/time.h>
#include <arm_neon.h>

//#define DEBUG

int backImage[512 * 512];
int foreImage[512 * 512];
int newImage[512 * 512];

void alphaBlend_c(uint8_t *fgimage, uint8_t *bgimage, uint8_t *dstImage) // Highly Optimized Assembly code For Alpha Blend
{
 asm volatile
     (
	  "movs      r3,#0\n\t"
      "movs      r4,%0\n\t"
      "movs      r5,%1\n\t"
      "movs      r6,%2\n\t"
	  ".loop:\n\t"
      "pld       [r4,#0x800] \n\t"
      "pld       [r5,#0x800]\n\t"
      "pld       [r5,#0x00]\n\t"
	  "adds      r3,r3,#64\n\t"
	  "vld4.8    {d20-d23},[r4]!\n\t"
      "cmp       r3,#1048576\n\t"
	  "pld       [r4,#0x820] \n\t"
      "pld       [r5,#0x820]\n\t"
      "vmvn      d29,d23\n\t"
      "vmull.u8  q1,d22,d23\n\t"
	  "vld4.8    {d24-d27},[r5]!\n\t"
	  "vmull.u8  q3,d21,d23\n\t"
	  "vmull.u8  q5,d20,d23\n\t"
	  "vmull.u8  q2,d26,d29\n\t"
	  "vmull.u8  q4,d25,d29\n\t"
	  "vmull.u8  q6,d24,d29\n\t"
	  "vadd.u16  q1,q1,q2\n\t"
	  "vadd.u16  q3,q3,q4\n\t"
	  "vadd.u16  q5,q5,q6\n\t"
	  "vshr.u16  q1,q1,#8\n\t"
	  "vshr.u16  q3,q3,#8\n\t"
	  "vshr.u16  q5,q5,#8\n\t"
	  "vmovn.u16 d22,q1\n\t"
	  "vmovn.u16 d21,q3\n\t"
	  "vmovn.u16 d20,q5\n\t"
	  "vmov.u8   d23,#0xff\n\t"
	  "vst4.8   {d20-d23},[r6]!\n\t" //<=== 1

      "pld       [r4,#0x0]\n\t"
      "pld       [r5,#0x0]\n\t"
	  "pld       [r4,#0x800] \n\t"
	  "pld       [r5,#0x800]\n\t"
	  "vld4.8    {d20-d23},[r4]!\n\t"
	  "pld       [r4,#0x820] \n\t"
	  "pld       [r5,#0x820]\n\t"
	  "vmvn      d29,d23\n\t"
	  "vmull.u8  q1,d22,d23\n\t"
	  "vld4.8    {d24-d27},[r5]!\n\t"
	  "vmull.u8  q3,d21,d23\n\t"
	  "vmull.u8  q5,d20,d23\n\t"
	  "vmull.u8  q2,d26,d29\n\t"
	  "vmull.u8  q4,d25,d29\n\t"
	  "vmull.u8  q6,d24,d29\n\t"
	  "vadd.u16  q1,q1,q2\n\t"
	  "vadd.u16  q3,q3,q4\n\t"\
	  "vadd.u16  q5,q5,q6\n\t"
	  "vshr.u16  q1,q1,#8\n\t"
	  "vshr.u16  q3,q3,#8\n\t"
	  "vshr.u16  q5,q5,#8\n\t"
	  "vmovn.u16 d22,q1\n\t"
	  "vmovn.u16 d21,q3\n\t"
	  "vmovn.u16 d20,q5\n\t"
	  "vmov.u8   d23,#0xff\n\t"
	  "pld       [r4,#0x840]\n\t"
	  "pld       [r5,#0x840]\n\t"
	  "vst4.8   {d20-d23},[r6]!\n\t" //<=== 2
	  "bne      .loop\n\t"
	  :
	  : "r" (fgimage), "r" (bgimage), "r" (dstImage)
	  : "r3", "r4","r5","r6","memory"
	  );

}

void enable_runfast()
{
  static const unsigned int x = 0x04086060;
  static const unsigned int y = 0x03000000;
  int r;
  asm volatile (
                "fmrx %0, fpscr\n\t"//r0 = FPSCR
                "and  %0, %0, %1\n\t"//r0 = r0 & 0x04086060
                "orr  %0, %0, %2\n\t"//r0 = r0 | 0x03000000
                "fmxr fpscr, %0\n\t"//FPSCR = r0
                : "=r"(r)
                : "r"(x), "r"(y)
                );
}

void print_vec(uint8x8_t v)
{
	uint8_t temp[8];
	vst1_u8(&temp[0],v);
	printf("%#x\n",(0xff & temp[0]));
	printf("%#x\n",(0xff & temp[1]));
	printf("%#x\n",(0xff & temp[2]));
	printf("%#x\n",(0xff & temp[3]));
	printf("%#x\n",(0xff & temp[4]));
	printf("%#x\n",(0xff & temp[5]));
	printf("%#x\n",(0xff & temp[6]));
	printf("%#x\n",(0xff & temp[7]));
}


int main(int argc, char**argv)
{
   FILE *fgFile, *bgFile, *outFile;
   int result,x,y,i,time;
   static int sum =0;
   static int max = 0;
   static int min= 999999;
   float avg ;
   struct timeval oldTv, newTv;

   if(argc != 4){
      fprintf(stderr, "Usage:%s foreground background outFile\n",argv[0]);
      return 1;
   }
   fgFile = fopen(argv[1], "rb");
   bgFile = fopen(argv[2], "rb");
   outFile = fopen(argv[3], "wb");
   enable_runfast();
   if(fgFile && bgFile && outFile){
     result = fread(backImage, 512*sizeof(int), 512, bgFile);
     if(result != 512){
       fprintf(stderr, "Error with backImage\n");
       return 3;
     }
     result = fread(foreImage, 512*sizeof(int), 512, fgFile);
     if(result != 512){
       fprintf(stderr, "Error with foreImage\n");
       return 4;
     }

     for(i =0;i<100;i++)
     {
    	 gettimeofday(&oldTv, NULL);
     	 alphaBlend_c(&foreImage[0], &backImage[0], &newImage[0]);
     	 gettimeofday(&newTv, NULL);
     	 time = (int)(newTv.tv_usec - oldTv.tv_usec);
     	 if (time < 0)
     	 {
     		 i--;
     		 continue;
     	 }
     	 sum = sum + time;
     	 if(time < min)
     		 min = time;
     	 if (time > max)
     		 max = time;
     }
     avg = (float)sum /(float)i;
     fprintf(stdout, "Routine took avg of %f microseconds\n", avg,sum);
     fprintf(stdout, "Routine took max of %d microseconds\n", max);
     fprintf(stdout, "Routine took min of %d microseconds\n", min);

     #ifdef DEBUG
     for(y = 0; y < 512; y++)
     {
        for(x = 0; x < 512; x++)
        	printf("%x\n",newImage[(y*512)+x]);
     }
     #endif
     fwrite(newImage, 512*sizeof(int),512,outFile);
     fclose(fgFile);
     fclose(bgFile);
     fclose(outFile);
     return 0;
   }
   fprintf(stderr, "Problem opening a file\n");
   return 2;
}
/*
#define A(x) (((x) & 0xff000000) >> 24)
#define R(x) (((x) & 0x00ff0000) >> 16)
#define G(x) (((x) & 0x0000ff00) >> 8)
#define B(x) ((x) & 0x000000ff)
*/

/*
void alphaBlend_c(uint8_t *fgimage, uint8_t *bgimage, uint8_t *dstImage)
{
  int x, y,i = 0;

     uint8x8_t temp = vdup_n_u8(255);
     for(x = 0; x < (2048*512); x+=32)
     {   //i++;

    	 uint8x8x4_t fg_pixel = vld4_u8(&fgimage[x]);
    	 uint8x8x4_t bg_pixel = vld4_u8(&bgimage[x]);

    	 fg_pixel.val[2] = vmovn_u16(vshrq_n_u16(vaddq_u16(vmull_u8(fg_pixel.val[2],fg_pixel.val[3]),vmull_u8(bg_pixel.val[2],vmvn_u8(fg_pixel.val[3]))),8));
    	 fg_pixel.val[1] = vmovn_u16(vshrq_n_u16(vaddq_u16(vmull_u8(fg_pixel.val[1],fg_pixel.val[3]),vmull_u8(bg_pixel.val[1],vmvn_u8(fg_pixel.val[3]))),8));
    	 fg_pixel.val[0] = vmovn_u16(vshrq_n_u16(vaddq_u16(vmull_u8(fg_pixel.val[0],fg_pixel.val[3]),vmull_u8(bg_pixel.val[0],vmvn_u8(fg_pixel.val[3]))),8));
    	 fg_pixel.val[3] = temp;
    	 //print_vec(result.val[3]);
    	 vst4_u8(&dstImage[x],fg_pixel);
    	 __builtin_prefetch((&fgimage[x+2048]),0,0);
    	 __builtin_prefetch((&bgimage[x+2048]),0,0);
    	 //__builtin_prefetch((&dstImage[x+2048]),1,0);
         x+=32;
    	 fg_pixel = vld4_u8(&fgimage[x]);
		 bg_pixel = vld4_u8(&bgimage[x]);

		 fg_pixel.val[2] = vmovn_u16(vshrq_n_u16(vaddq_u16(vmull_u8(fg_pixel.val[2],fg_pixel.val[3]),vmull_u8(bg_pixel.val[2],vmvn_u8(fg_pixel.val[3]))),8));
		 fg_pixel.val[1] = vmovn_u16(vshrq_n_u16(vaddq_u16(vmull_u8(fg_pixel.val[1],fg_pixel.val[3]),vmull_u8(bg_pixel.val[1],vmvn_u8(fg_pixel.val[3]))),8));
		 fg_pixel.val[0] = vmovn_u16(vshrq_n_u16(vaddq_u16(vmull_u8(fg_pixel.val[0],fg_pixel.val[3]),vmull_u8(bg_pixel.val[0],vmvn_u8(fg_pixel.val[3]))),8));
		 fg_pixel.val[3] = temp;
		 vst4_u8(&dstImage[x],fg_pixel);
     }
}*/

