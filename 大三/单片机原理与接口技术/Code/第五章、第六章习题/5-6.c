#include <reg51.h>
#include <absacc.h>
#define uchar unsigned char
void main()
{
  uchar data *pd1,*pd2;
  uchar data a;
  uchar data i=0;
  DBYTE[0x41]=3;
  DBYTE[0x42]=0;
  DBYTE[0x43]=2;
  DBYTE[0x44]=3;
  DBYTE[0x52]=1;
  DBYTE[0x53]=2;
  DBYTE[0x54]=3;
  pd1=0x42;
  pd2=0x52;
  a=DBYTE[0x41];

  while(i<a)
  {
    if(*pd1==*pd2)
	{
	  pd1++;
	  pd2++;
	}
	else
	{
	  DBYTE[0x40]=-1;
	  break;
	}
	i++;
  }
  if(*pd1==*pd2)
  {
  DBYTE[0x40]=0;
  }
}
