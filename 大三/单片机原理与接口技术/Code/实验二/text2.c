#include <reg51.h>
#include <intrins.h>

#define led P1
#define uchar unsigned char

uchar a;
unsigned int x;

void delayxs(unsigned int x)
{
  unsigned int i,j,k;
  for(k=x;k>0;k--)
    for(i=1000;i>0;i--)
	  for(j=100;j>0;j--);
}

void main()
{
  led=0xFE;
  for(a=1;a<9;a++)
  {
    delayxs(1);
    led=_crol_(led,1);
  }  
}