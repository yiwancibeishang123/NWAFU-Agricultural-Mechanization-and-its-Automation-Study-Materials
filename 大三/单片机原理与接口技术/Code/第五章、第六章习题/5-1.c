#include <absacc.h>
#include <reg51.h>
void main()
{
  char data i=0;
  while(i<=0x30)
  {
  DBYTE[0x40+i]=0x10;
  i++;
  }
}
