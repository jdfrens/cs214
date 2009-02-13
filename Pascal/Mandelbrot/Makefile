all: mandelbrot.gif

mandelbrot.gif: mandelbrot.ppm
	convert mandelbrot.ppm mandelbrot.gif

mandelbrot.ppm: ppmandel
	ppmandel > mandelbrot.ppm

ppmandel: ppmandel.p
	gpc -o ppmandel ppmandel.p
