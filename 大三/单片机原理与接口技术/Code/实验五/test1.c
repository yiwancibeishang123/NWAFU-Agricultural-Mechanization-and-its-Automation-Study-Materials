#include <reg51.h>
#include <absacc.h>

sbit sounder=P1^0;
main()
{
  TMOD=1;
  TH0=62018/32;
  TL0=62018%32;

  EA=1;
  ET0=1;
  TR0=1;
  while(1);
}
void t0int() interrupt 1
{
  sounder=~sounder;
  TH0=62018/32;
  TL0=62018%32;
}
