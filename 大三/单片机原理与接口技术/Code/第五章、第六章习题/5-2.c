#include <reg51.h>
#include <absacc.h>
void main()
{
  char xdata i=0;
  while(i<=0x100)
  {
  XBYTE[0x5000+i]=0x41;
  i++;
  }
}