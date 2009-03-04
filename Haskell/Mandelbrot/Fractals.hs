{- 
  For CS 214, Spring 2009
  Version: February 20
  Creative Commons Attribution-Share Alike 3.0 United States License
-}

module Fractals (fractalWidth, fractalHeight, ppmPlot, mandelbrot, julia) where
  
  import List
  import Complex

  fractalWidth :: Integer
  fractalWidth = 512
  fractalHeight :: Integer
  fractalHeight = 384

  max_size :: Float
  max_size = 4.0
  max_iters :: Integer
  max_iters = 512

  ppmPlot :: ((Float, Float) -> String) -> Float -> Float -> Float -> Float -> [String]
  ppmPlot f x0 y0 x1 y1 = 
    let
      delta_x = (x1 - x0) / (fromInteger fractalWidth - 1.0)
      delta_y = (y1 - y0) / (fromInteger fractalHeight - 1.0)
      ys = [y0, y0 + delta_y..y1]
      xs = [x0, x0 + delta_x..x1]
      points = [ (x,y) | y <- reverse ys, x <- xs ]
    in
      map f points
    
  mandelbrot (x,y) = plotPoint zero max_iters
    where
      zero = 0 :+ 0
      c    = x :+ y
      plotPoint z iters
        | iters == 0      = "0 0 0"
        | hasEscaped z    = "15 15 15"
        | otherwise       = plotPoint (z * z + c) (iters-1)
      hasEscaped z = magnitude (z * z) > max_size

  julia (cx, cy) (x,y) = plotPoint z max_iters
    where
      c  = cx :+ cy
      z  = x :+ y
      plotPoint z iters
        | iters == 0      = "0 0 0"
        | hasEscaped z    = "15 15 15"
        | otherwise       = plotPoint (z * z + c) (iters-1)
      hasEscaped z = magnitude (z * z) > max_size
