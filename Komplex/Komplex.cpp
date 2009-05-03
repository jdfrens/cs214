#include <cmath>
#include <iostream>
#include <string>
#include <sstream>

using namespace std;

class Komplex {
public:
  virtual double magnitude() = 0;
  virtual string toString() = 0;
};

class KomplexRI : public Komplex {
public:
  KomplexRI(double real, double imag) {
    myReal = real;
    myImag = imag;
  }
  
  virtual double magnitude() {
    return sqrt(myReal * myReal + myImag * myImag);
  }
  
  virtual string toString() {
    ostringstream ss;
    ss << myReal << "+" << myImag << "i";
    return ss.str();
  }
  
private:
  double myReal;
  double myImag;
};

class KomplexPR : public Komplex {
public:
  KomplexPR(double phi, double r) {
    myPhi = phi;
    myR = r;
  }
  
  virtual double magnitude() {
    return myR;
  }
  
  virtual string toString() {
    ostringstream ss;
    ss << myR << " cis " << myPhi; // r cis phi == r (cos phi + i sin phi)
    return ss.str();
  }

private:
  double myPhi;
  double myR;
};

void reportMagnitude(Komplex* komplex) {
  cout << "|" << komplex->toString() << "| = " 
    << komplex->magnitude() << endl;
}

int main() {
  reportMagnitude(new KomplexRI(0.0, 0.0));
  reportMagnitude(new KomplexRI(5.0, 2.0));
  
  reportMagnitude(new KomplexPR(0.0, 0.0));
  reportMagnitude(new KomplexPR(0.75 * 3.14159, 1.5));
  
  return 0;
}
