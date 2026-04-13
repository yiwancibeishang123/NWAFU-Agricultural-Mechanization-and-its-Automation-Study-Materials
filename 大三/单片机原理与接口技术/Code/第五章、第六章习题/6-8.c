#include <reg51.h>

sbit op=P1^0;
unsigned char a=0;

void main() 
{
    TMOD=0;
    TH1=(8192-50)/32; 
    TL1=(8192-50)%32;
    EA=1;
    ET1=1;
    TR1=1;
    while (1) 
    {
        if (a<=15) 
		{op=1;} 
		else if (a<=20) 
		{op=0;} 
		else 
		{a=0;}
    }
}

void timer1(void) interrupt 3 
{
    a++;
    TH1=(8192-50)/32;
    TL1=(8192-50)%32;
}