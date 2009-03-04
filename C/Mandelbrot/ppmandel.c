// For CS 214, Spring 2009
// Version: February 6
// Creative Commons Attribution-Share Alike 3.0 United States License

#include <math.h>
#include <stdlib.h>
#include <stdio.h>

#include "mandelbrot.h"

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
