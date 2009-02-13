   program MainPPMMandelbrot;

   procedure Plot;
   const
      MAX_SIZE	= 4.0;
      MAX_ITERS	= 128;
      WIDTH	= 512;
      HEIGHT	= 384;
   var		
      x0, x1, y0, y1 : Real;

      procedure Prefix();
      begin
	 WriteLn("P3");
	 WriteLn(WIDTH, " ", HEIGHT);
	 WriteLn("15");
      end;
   
      procedure plotPoint(x, y : Real);
      var
	 a, b, aa, bb : Real;
	 iters	      : Integer;
      begin
	 iters := 0;    
	 a := 0.0;
	 b := 0.0;
	 aa := 0.0;
	 bb := 0.0;
	 while (aa + bb < MAX_SIZE) AND (iters <= MAX_ITERS) do
	 begin
	    aa := a * a;
	    bb := b * b;
	    b := b * a;
	    b := 2 * b + y;
	    a := aa - bb + x;
	    iters := iters + 1;
	 end;
	 if (iters > MAX_ITERS) then
	    WriteLn("0 0 0\n")
	 else
	    WriteLn("15 15 15\n");
      end;

      procedure Mandelbrot(x0, y0, x1, y1 : Real);
      var
	 delta_x, delta_y, x, y	: Real;
	 h, w			: Integer;
      begin			
	 delta_x := (x1 - x0) / (WIDTH - 1.0);
	 delta_y := (y1 - y0) / (HEIGHT - 1.0);
	 y := y1;
	 for h := 0 to (HEIGHT-1) do
	 begin
	    x := x0;
	    for w := 0 to (WIDTH-1) do
	    begin
	       PlotPoint(x, y);
	       x := x + delta_x;
	    end;
	    y := y - delta_y;
	 end;
      end;
   begin
      x0 := -2.0;
      y0 := -1.2;
      x1 := 1.2;
      y1 := 1.2;
      Prefix();
      Mandelbrot(x0, y0, x1, y1);
   end;

   begin
      Plot
   end.
