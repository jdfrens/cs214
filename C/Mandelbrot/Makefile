all: mandelbrot.gif

mandelbrot.ppm: ppmandel
	ppmandel -2.0 -1.2 1.2 1.2 > mandelbrot.ppm

mandelbrot.gif: mandelbrot.ppm
	convert mandelbrot.ppm mandelbrot.gif
