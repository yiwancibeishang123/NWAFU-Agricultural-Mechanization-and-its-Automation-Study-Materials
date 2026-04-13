#include <reg51.h>
#define uchar unsigned char
#define uint unsigned int

sbit LABA=P3^0;
uchar temp,key;

uchar code table[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,
                    0x80,0x90,0x88,0x83,0xc6,0xa1,0x86,0x8e};

void delayms(uint x)
{
  uint i,j;
  for (i=x;i>0;i--)
    for(j=115;j>0;j--);
}

void laba()
{
  uint b,r;
  for (b=0;b<50;b++)
  {
    LABA=0;
	for(r=50;r>0;r--);
	LABA=1;
	for(r=50;r>0;r--);
  }  
}

void scan()
{
  P1=0xf0;
  temp=P1;
  temp=temp&0xf0;
  if(temp!=0xf0)
  {
    delayms(10);
  }
  P1=0xfe;
  temp=P1;
  temp=temp&0xf0;
  if(temp!=0xf0)
  {
    switch(temp)
	{
	  case 0xe0:key=0; break;
	  case 0xd0:key=1; break;
	  case 0xb0:key=2; break;
	  case 0x70:key=3; break;
	}
	while(temp!=0xf0)
	{
	  temp=P1;
	  temp=temp&0xf0;
	}
	laba();
  }


  P1=0xfd;
  temp=P1;
  temp=temp&0xf0;
  if(temp!=0xf0)
  {
    switch(temp)
	{
	  case 0xe0:key=4; break;
	  case 0xd0:key=5; break;
	  case 0xb0:key=6; break;
	  case 0x70:key=7; break;
	}
	while(temp!=0xf0)
	{
	  temp=P1;
	  temp=temp&0xf0;
	}
	laba();
  }


  P1=0xfb;
  temp=P1;
  temp=temp&0xf0;
  if(temp!=0xf0)
  {
    switch(temp)
	{
	  case 0xe0:key=8; break;
	  case 0xd0:key=9; break;
	  case 0xb0:key=10; break;
	  case 0x70:key=11; break;
	}
	while(temp!=0xf0)
	{
	  temp=P1;
	  temp=temp&0xf0;
	}
	laba();
  }

  P1=0xf7;
  temp=P1;
  temp=temp&0xf0;
  if(temp!=0xf0)
  {
    switch(temp)
	{
	  case 0xe0:key=12; break;
	  case 0xd0:key=13; break;
	  case 0xb0:key=14; break;
	  case 0x70:key=15; break;
	}
	while(temp!=0xf0)
	{
	  temp=P1;
	  temp=temp&0xf0;
	}
	laba();
  }
}

void main()
{
  P0=0xbf;
  while(1)
  {
    scan();
	if(key<16)
	{
	  P0=table[key];
	}
  }
}