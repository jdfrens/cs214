#include <stdio.h>

#include "mandelbrot.h"

static double MAX_SIZE = 4.0;
static int MAX_ITERS = 128;

static void plotPoint(double x, double y) {
  double a, b, aa, bb;
  int iters = 0;
  a = b = aa = bb = 0.0;
  while (aa + bb < MAX_SIZE) {
    if (iters > MAX_ITERS) {
      printf("0 0 0\n");
      return;
    }
    aa = a * a;
    bb = b * b;
    b *= a;
    b += b + y;
    a = aa - bb + x;
    iters++;
  }
  printf ("15 15 15\n");
}

void ppmMandelbrot(double x0, double y0, double x1, double y1) {
  double delta_x = (x1 - x0) / (WIDTH - 1);
  double delta_y = (y1 - y0) / (HEIGHT - 1);
  int h, w;
  double y = y1;
  for (h = 0; h < HEIGHT; h++) {
    double x = x0;
    for (w = 0; w < WIDTH; w++) {
      plotPoint(x, y);
      x += delta_x;
    }
    y -= delta_y;
  }
}

void ppmPrefix() {
  printf("P3\n");
  printf("%d %d\n", WIDTH, HEIGHT);
  printf("15\n");
}
