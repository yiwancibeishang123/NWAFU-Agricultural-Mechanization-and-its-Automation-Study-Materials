#include <stdio.h>
int main()
{
    int a,b,c,d;
    scanf("%d",&a);
    b=0;
    c=0;
    d=0;
    for (b=a/5;d!=a-6;d--)
    {
        d=(a-5*b-c)/2;
        while (d>0)
        {
            if (a==b*5+c*2+d)
                printf("fen5:%d, fen2:%d, fen1:%d, total:%d\n",b,c,d,b+c+d);
        }
    }
    return 0;
}