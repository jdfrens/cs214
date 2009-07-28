{- 
  For CS 214, Spring 2009
  Version: April 17
  Creative Commons Attribution-Share Alike 3.0 United States License
-}

module Fractals (Dimension(..), plot, mandelbrot, julia) where
  
import List
import Complex

data Dimension a = Dimension a a
  deriving (Show, Eq)

max_size = 4.0
max_iters = 512

plot f color (Dimension width height) (x0 :+ y0) (x1 :+ y1) = 
  let
    delta_x = (x1 - x0) / (fromInteger width - 1.0)
    delta_y = (y1 - y0) / (fromInteger height - 1.0)
    ys = [y0, y0 + delta_y..y1]
    xs = [x0, x0 + delta_x..x1]
    fWithColor z = f z color
  in
    map fWithColor [ x :+ y | y <- reverse ys, x <- xs ]
  
mandelbrot c = plotPoint c (0 :+ 0)
    
julia c z0 = plotPoint c z0

plotPoint c z0 color = loop z0 max_iters
  where
    loop z iter
      | iter == 0    = color iter
      | hasEscaped z = color iter
      | otherwise    = loop (z * z + c) (iter-1)
    hasEscaped z = magnitude (z * z) > max_size
