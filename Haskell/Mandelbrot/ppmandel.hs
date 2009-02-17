{- 
  For CS 214, Spring 2009
  Version: February 16
  Creative Commons Attribution-Share Alike 3.0 United States License
-}

import System

mandelWidth :: Integer
mandelWidth = 512
mandelHeight :: Integer
mandelHeight = 384

max_size = 4.0
max_iters = 512

main :: IO ()
main = do
  args <- getArgs
  let
    [x0, y0, x1, y1] = params args
    in
      mapM_ putStrLn (ppmPrefix ++ (ppmMandelbrot x0 y0 x1 y1))
      
params :: [String] -> [Float]
params args = map read args

ppmPrefix :: [String]
ppmPrefix = ["P3", show mandelWidth, show mandelHeight, "15"]

ppmMandelbrot :: Float -> Float -> Float -> Float -> [String]
ppmMandelbrot x0 y0 x1 y1 = 
  let
    delta_x = (x1 - x0) / (fromInteger mandelWidth - 1.0)
    delta_y = (y1 - y0) / (fromInteger mandelHeight - 1.0)
    ys = coords y0 delta_y mandelHeight
    xs = coords x0 delta_x mandelWidth
    points = [ (x,y) | x <- xs, y <- ys ]
  in
    map plotPoint points

coords :: Float -> Float -> Integer -> [Float]
coords z delta_z n =
  let
    deltas = [fromInteger i * delta_z | i <- [1..n]]
  in
    [ z + delta | delta <- deltas]

plotPoint p = plotPoint' p (0.0, 0.0) (0.0, 0.0) max_iters
plotPoint'   _     _      _         0  = "0 0 0"
plotPoint' (x,y) (a,b) (aa, bb) iters
  | aa + bb >= max_size   = "15 15 15"
  | otherwise             = 
    let
      aa' = a * a
      bb' = b * b
      b' = 2 * b * a + y
      a' = aa - bb + x
    in plotPoint' (x,y) (a',b') (aa',bb') (iters+1)