#include <reg51.h>
#include <absacc.h>

void main()
{
 unsigned char data a;
 unsigned char b,c,d;
 DBYTE[0x40]=0xBD;

 a=DBYTE[0x40];
 b=a/100;
 c=(a-b*100)/10;
 d=a-b*100-c*10;

 DBYTE[0x30]=b;
 DBYTE[0x31]=c;
 DBYTE[0x32]=d;

}