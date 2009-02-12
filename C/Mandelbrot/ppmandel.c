// For CS 214, Spring 2009
// Version: February 6
// Creative Commons Attribution-Share Alike 3.0 United States License

#include <math.h>
#include <stdlib.h>
#include <stdio.h>

void plotPoint(double, double);
void ppmPrefix();
void ppmMandelbrot(double, double, double, double);

#define WIDTH 512
#define HEIGHT 384

static double MAX_SIZE = 4.0;
static int MAX_ITERS = 128;

/**
 * Generates a PPM image of a Mandelbrot set.
 * usage:
 *   ppmandel x0 y0 x1 y1 > mandelbrot.ppm
 * where x0,y0 is the lower left corner of the image, and x1,y1 is the
 * upper right.
 */
int main(int argc, char** argv) {
  double x0 = atof(argv[1]);
  double y0 = atof(argv[2]);
  double x1 = atof(argv[3]);
  double y1 = atof(argv[4]);
  ppmPrefix();
  ppmMandelbrot(x0, y0, x1, y1);
  return 0;
}

void ppmMandelbrot(double x0, double y0, double x1, double y1) {
  double delta_x = (x1 - x0) / (WIDTH - 1);
  double delta_y = (y1 - y0) / (HEIGHT - 1);
  double x, y;
  int h, w;
  y = y1;
  for (h = 0; h < HEIGHT; h++) {
    x = x0;
    for (w = 0; w < WIDTH; w++) {
      plotPoint(x, y);
      x += delta_x;
    }
    y -= delta_y;
  }
}

void plotPoint(double x, double y) {
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

void ppmPrefix() {
  printf("P3\n");
  printf("%d %d\n", WIDTH, HEIGHT);
  printf("15\n");
}
