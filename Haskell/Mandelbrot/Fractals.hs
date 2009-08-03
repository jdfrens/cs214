{- 
  For GRHUG
  Version: July 2009
  Creative Commons Attribution-Share Alike 3.0 United States License
-}

module Fractals
  (Dimension(..), SetMembership(..),
  max_iters,
  plot,
  mandelbrot, julia, burningShip) where
  
import List
import Complex

data Dimension a = Dimension a a
  deriving (Show, Eq)
  
data SetMembership a b = Inside | Outside a b
  deriving (Show, Eq)

max_size = 4.0
max_iters = 256

plot f (Dimension width height) (x0 :+ y0) (x1 :+ y1) = 
  let
    delta_x = (x1 - x0) / (fromInteger (width - 1))
    delta_y = (y1 - y0) / (fromInteger (height - 1))
    ys = [y0, y0 + delta_y..y1]
    xs = [x0, x0 + delta_x..x1]
  in
    map f [ x :+ y | y <- ys, x <- xs ]

-----------------------------------------------------------
-- initial conditions and iterators for fractals
-----------------------------------------------------------
mandelbrot c = plotPoint z_squared_plus_c c (0 :+ 0)
julia c z0 = plotPoint z_squared_plus_c c z0
-- http://en.wikipedia.org/wiki/Burning_Ship_fractal
burningShip c = plotPoint burningship_iterator c (0 :+ 0)

-----------------------------------------------------------
-- iterators
-----------------------------------------------------------
z_squared_plus_c z c = z * z + c
burningship_iterator z c = (mapAbs z)^2 + c
  where
    mapAbs (a :+ b) = (abs a) :+ (negate (abs b))

-----------------------------------------------------------
-- iteration
-----------------------------------------------------------
plotPoint iterator c z0 = loop z0 0
  where
    loop z iter
      | iter > max_iters = Inside
      | hasEscaped z     = Outside z iter
      | otherwise        = loop (iterator z c) (iter+1)
    hasEscaped z = magnitude (z * z) > max_size
