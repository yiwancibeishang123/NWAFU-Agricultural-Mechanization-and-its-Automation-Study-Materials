#include <reg51.h>
#include <absacc.h>
#define uchar unsigned char
void main()
{
signed char data *pd;
uchar data a,b;
uchar data i=0;
pd=0x30;
DBYTE[0x30]=-1;
DBYTE[0x31]=1;
DBYTE[0x32]=1;
DBYTE[0x33]=0;
DBYTE[0x34]=1;
DBYTE[0x35]=1;
DBYTE[0x36]=1;
DBYTE[0x37]=-1;
DBYTE[0x38]=1;
DBYTE[0x39]=0;
DBYTE[0x3A]=1;
DBYTE[0x3B]=0;
DBYTE[0x3C]=1;
DBYTE[0x3D]=-1;
DBYTE[0x3E]=1;
DBYTE[0x3F]=1;
DBYTE[0x40]=-1;
DBYTE[0x41]=1;
DBYTE[0x42]=1;
DBYTE[0x43]=1;
while(i<20)
  {
   if(*pd<0)
   {
	 a++;
    }
   else
   {
     b++;
    }
   i++;
   pd++;
  }
  DBYTE[0x10]=a;
  DBYTE[0x11]=b;
}