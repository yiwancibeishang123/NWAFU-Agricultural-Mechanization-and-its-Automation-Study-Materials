#include <reg51.h>
#include <intrins.h>

unsigned char a;
//sbit led=P1^0;

void main() 
{
	a=0x7F;
    EA=1;
    IT0=1;
    EX0=1;
    while(1);
}

void External_Interrupt0(void) interrupt 0 
{
    a=_crol_(a,1);
    P1=a;
}