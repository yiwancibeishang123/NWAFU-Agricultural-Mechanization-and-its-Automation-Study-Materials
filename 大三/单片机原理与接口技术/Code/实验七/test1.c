#include <reg51.h>
#define uint unsigned int
sbit led=P1^4;
sbit but=P1^0;

void delayms(uint i)
{
  uint j,k;
  for (j=i;j>0;j--)
    for (k=115;k>0;k--);
}

void main()
{
  while(1)
  {
    if(but==0)
	{
	  delayms(10);
	  if(but==0)
	  {
	    led=0;
		while(!but);
		led=1;
	  }
	}
  }
}