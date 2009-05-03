#include <stdlib.h>
#include <math.h>
#include <stdio.h>

typedef struct {
  double real;
  double imag;
} KomplexRI;

typedef struct {
  double phi;
  double r;
} KomplexPR;

KomplexRI* createKomplexRI(double real, double imag) {
  KomplexRI* k = (KomplexRI*) malloc(sizeof(KomplexRI));
  k->real = real;
  k->imag = imag;
  return k;
}

KomplexPR* createKomplexPR(double phi, double r) {
  KomplexPR* k = (KomplexPR*) malloc(sizeof(KomplexPR));
  k->phi = phi;
  k->r = r;
  return k;
}

double magnitudeRI(KomplexRI* komplex) {
  return sqrt(komplex->real * komplex->real + komplex->imag * komplex->imag);
}

double magnitudePR(KomplexPR* komplex) {
  return komplex->r;
}

int main() {
  printf("%f\n", magnitudeRI(createKomplexRI(0.0, 0.0)));
  printf("%f\n", magnitudeRI(createKomplexRI(5.0, 2.0)));

  printf("%f\n", magnitudePR(createKomplexPR(0.0, 0.0)));
  printf("%f\n", magnitudePR(createKomplexPR(0.75 * 3.14159, 1.5)));
  
  return 0;
}
