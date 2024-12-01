#ifndef __MATHLIB_H__
#define __MATHLIB_H__

#include <stdexcept>

template <typename T>
T add(T a, T b){
    return a + b;
}

template <typename T>
T multiply(T a, T b){
    return a * b;
}

template <typename T>
T substract(T a, T b){
   return a - b; 
}

template <typename T>
T divide(T a, T b){
    if(b == 0){
        throw std::invalid_argument("Cannot divide by 0 !");
    }
    return a/b;
}

double pow(double x, double power);

#endif