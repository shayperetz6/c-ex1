
#include "myMath.h"
#define Exp 2.7182
double Exponent (int x)
{
    return Power(Exp,x);
    
} 
double Power (double x,int y)
{
    double sum=1;
    if (x==0)
    {
        return 0;
    }
    if (y>0)
    {
     for (int i=0;i<y;i++)
        {
          sum*=x;
        }
        return sum;
    }
    if (y<0)
    {
        y=y*-1;
        for (int i=0;i<y;i++)
        {
          sum*=x;
        }
        return 1/sum;

    }
	return sum;
}