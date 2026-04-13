#include <reg51.h>

unsigned char a=0;
sbit led=P1^0;

void main()
{
  TMOD=0x15;
  TH0=(65536-5000)/256;
  TL0=(65536-5000)%256;
  TH1=(65536-46083)/256;
  TL1=(65536-46083)%256;

  EA=1;
  ET0=1;
  ET1=1;
  PT0=1;
  TR0=1; 

  while(1)
  {
    if(a==8)
	{
	  led=1;
	  a=0;
	  TR0=0;
	  TR1=0;
	}
  }
}

void t0int(void) interrupt 1
{
  TR1=1;
  led=0;
  TH0=(65536-5000)/256;
  TL0=(65536-5000)%256;  
}

void t1int(void) interrupt 3
{
  a++;
  TH1=(65536-46083)/256;
  TL1=(65536-46083)%256;
}