#include <reg51.h>
#include <intrins.h>

#define led P1

void delays(unsigned int x)
{
  unsigned int i,j,k;
  for(k=x;k>0;k--)
    for(i=1000;i>0;i--)
      for(j=115;j>0;j--);

}

void main()
{
  unsigned char a;
  led=0xAA;
  for(a=8;a>0;a--)
  {
    delays(1);
    led=~led;
  }  
}