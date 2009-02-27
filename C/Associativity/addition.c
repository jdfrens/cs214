#include <stdlib.h>
#include <stdio.h>

static int NUM_OF_VALUES = 100;
static double START = 0.000001;
static double ADJUST = 2.0;
static REPS = 500;

int main() {
  double xs[NUM_OF_VALUES];
  int i, iter;
  
  printf("Initializing...\n");
  double x = START;
  for (i = 0; i < NUM_OF_VALUES; i++) {
    xs[i] = x;
    x *= ADJUST;
  }
  
  printf("Summing up...\n");
  double sumUp = 0.0;
  for (i = 0; i < NUM_OF_VALUES; i++) {
    for (iter = 0; iter < REPS; iter++) {
      sumUp += xs[i];
    }
  }
  
  printf("Summing down...\n");
  double sumDown = 0.0;
  for (i = NUM_OF_VALUES - 1; i >= 0; i--) {
    for (iter = 0; iter < REPS; iter++) {
      sumDown += xs[i];
    }
  }
  
  printf("up:   %f\n", sumUp);
  printf("down: %f\n", sumDown);
  printf("diff: %f\n", sumUp - sumDown);

  return 0;
}

