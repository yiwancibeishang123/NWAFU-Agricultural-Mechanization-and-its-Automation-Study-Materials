#include <reg51.h>

sbit led=P1^0;
#define uchar unsigned char
uchar i;

void main()
{
   TMOD=0x14;

   led=1;
   IT1=1;
   EA=1;
   EX1=1;
   i=0;

   while(1)
   {
   if (i==10)
     {
	 led=0;
	 EX1=0;
	 EA=0;
	 }
   }
}

void t0int() interrupt 2
{
  i++;
}
