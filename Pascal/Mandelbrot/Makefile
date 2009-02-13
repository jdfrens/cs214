all: mandelbrot.ppm

mandelbrot.ppm: ppmandel
	ppmandel > mandelbrot.ppm

ppmandel: ppmandel.p
	gpc -o ppmandel ppmandel.p
