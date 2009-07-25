{- 
  For CS 214, Spring 2009
  Version: April 17
  Creative Commons Attribution-Share Alike 3.0 United States License
-}

module Fractals (Dimension(..), Point(..), plot, mandelbrot, julia) where
  
import List
import Complex

data Dimension a = Dimension a a
  deriving (Show, Eq)
data Point a = Point a a
  deriving (Show, Eq)

max_size = 4.0
max_iters = 512

plot f (Dimension width height) (Point x0 y0) (Point x1 y1) = 
  let
    delta_x = (x1 - x0) / (fromInteger width - 1.0)
    delta_y = (y1 - y0) / (fromInteger height - 1.0)
    ys = [y0, y0 + delta_y..y1]
    xs = [x0, x0 + delta_x..x1]
    points = [ (Point x y) | y <- reverse ys, x <- xs ]
  in
    map f points
  
mandelbrot color (Point x y) = plotPoint zero max_iters
  where
    zero = 0 :+ 0
    c    = x :+ y
    plotPoint z iters
      | iters == 0      = color iters
      | hasEscaped z    = color iters
      | otherwise       = plotPoint (z * z + c) (iters-1)
    hasEscaped z = magnitude (z * z) > max_size

julia color (Point cx cy) (Point x y) = plotPoint z max_iters
  where
    c  = cx :+ cy
    z  = x :+ y
    plotPoint z iters
      | iters == 0      = "0 0 0"
      | hasEscaped z    = "15 15 15"
      | otherwise       = plotPoint (z * z + c) (iters-1)
    hasEscaped z = magnitude (z * z) > max_size
