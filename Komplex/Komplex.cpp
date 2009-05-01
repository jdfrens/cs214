#include <cmath>

class Komplex {
public:
  Komplex(double real, double imag) {
    myReal = real;
    myImag = imag;
  }
  
  double magnitude() {
    return sqrt(myReal * myReal + myImag * myImag);
  }
  
private:
  double myReal;
  double myImag;
};
