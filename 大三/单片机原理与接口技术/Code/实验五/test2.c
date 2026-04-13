#include <reg51.h>
#include <absacc.h>

#define uchar unsigned char
uchar i;
sbit led=P1^0;
main()
{
  TMOD=6;
  TH0=246;
  TL0=246;
  i=0;
  led=1;
  EA=1;
  ET0=1;
  TR0=1;
  while(1)
  {
    if(i==3)
	{
	  TR0=0;
	  led=0;

	}
  }
}
void t0int() interrupt 1
{
  i++;
}