#include <reg51.h>
#include <absacc.h>

#define uchar unsigned char
#define uint unsigned int

void delayxms(uint x)
{
  uint i,j;
  for(i=x;i>0;i--)
    for(j=115;j>0;j--);
}

void main()
{
  uchar a;
  while(1)
  {
  for(a=0;a<255;a++)
  {
    XBYTE[0xbfff]=a;
	delayxms(1);
  }
  for(a=255;a>0;a--)
  {
    XBYTE[0xbfff]=a;
	delayxms(1);
  }
  }
}