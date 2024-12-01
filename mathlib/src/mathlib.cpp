#include "mathlib.h"

double pow(double x, double power){
    if(power == 0) return 1;
    if(power < 0 ) return 1/pow(x,-power);
    return x*pow(x,power-1);
}

