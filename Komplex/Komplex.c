#include <stdlib.h>
#include <math.h>

typedef struct {
  double real;
  double imag;
} Komplex;

Komplex* createKomplex(double real, double imag) {
  Komplex* k = (Komplex*) malloc(sizeof(Komplex));
  k->real = real;
  k->imag = imag;
  return k;
}

double magnitude(Komplex* komplex) {
  return sqrt(komplex->real * komplex->real + komplex->imag * komplex->imag);
}
