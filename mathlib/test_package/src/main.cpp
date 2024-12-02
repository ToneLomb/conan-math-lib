#include <mathlib/mathlib.h>
#include <iostream>

int main(){

    try{

        std::cout << "1 + 2 = " << add(1,2) << std::endl;
        std::cout << "1.5 + 2.5 = " << add(1.5,2.5) << std::endl;

        std::cout << "10 - 2 = " << substract(10,2) << std::endl;
        std::cout << "10.5 - 3.5 = " << substract(10.5,3.5) << std::endl;

        std::cout << "2 * 4 = " << multiply(2,4) << std::endl;
        std::cout << "2.5 * 4.0 = " << multiply(2.5,4.0) << std::endl;

        std::cout << "10 / 5 = " << divide(10,5) << std::endl;
        std::cout << "12.5 / 2.5 = " << divide(12.5,2.5) << std::endl;

        std::cout << " 2 ^ 3 = " << pow(2,3) << std::endl;
        std::cout << " 2 ^ -3 = " << pow(2,-3) << std::endl;

        std::cout << "Divide by 0 : " << std::endl;
        divide(10,0);

    }
    catch (std::invalid_argument& e){
        std::cout << e.what() << std::endl;
    }
}