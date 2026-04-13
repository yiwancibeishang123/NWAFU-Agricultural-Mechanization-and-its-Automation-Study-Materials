#include <reg51.h>
#include <absacc.h>
#include <intrins.h>

#define uchar unsigned char
#define uint unsigned int

#define portA XBYTE[0x7FFC]
#define portB XBYTE[0x7FFD]
#define portCTR XBYTE[0x7FFF]

uchar code table[]={0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80};

void delayms(uint i)
{
  uint j,k;
  for(j=i;j>0;j--)
    for(k=115;k>0;k--);
}

void main()
{
  uchar n,b=0x01;
  portCTR=0x80;
  portB=0x00;
  delayms(10);
  while(1)
  {
    for(n=0;n<8;n++)
	{
	portA=0xFF;
	portB=b;
	_nop_();_nop_();_nop_();
	portA=table[n];
	delayms(5);
	b=_crol_(b,1);
	}
  }
}