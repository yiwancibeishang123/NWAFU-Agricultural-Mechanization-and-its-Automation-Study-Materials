#include <reg51.h>
#include <absacc.h>

#define uchar unsigned char
#define uint unsigned int

unsigned char idata table1[]="Welcome to Northwest A&F University!$";
unsigned char idata table2[]="Welcome to College of Mechanical and Electronic Engineering!$";
sbit led=P1^0;

void main()
{
  uint i=0;
  led=1;
  while(table1[i]!='$')
  {
    XBYTE[i]=table1[i];
	i++;
  }
  i=0;
  while(table2[i]!='$')
  {
    XBYTE[i+0x50]=table2[i];
	i++;
  }

  led=0;
  while(1);
}