#include <reg51.h>
#include <absacc.h>

#define uchar unsigned char
uchar xdata i=0;

void main()
{

  while(i<0x20)
  {
    XBYTE[0x2000+i]=0x10;
	i++;
  }

}