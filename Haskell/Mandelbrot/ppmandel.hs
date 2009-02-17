{- 
  For CS 214, Spring 2009
  Version: February 16
  Creative Commons Attribution-Share Alike 3.0 United States License
-}

import List
import System

mandelWidth :: Integer
mandelWidth = 512
mandelHeight :: Integer
mandelHeight = 384

max_size :: Float
max_size = 4.0
max_iters :: Integer
max_iters = 512

main :: IO ()
main = do
  args <- getArgs
  mapM_ putStrLn ppmPrefix
  mapM_ putStrLn $ ppmMandelbrot $ map read args

ppmPrefix :: [String]
ppmPrefix = ["P3", show mandelWidth, show mandelHeight, "15"]

ppmMandelbrot :: [Float] -> [String]
ppmMandelbrot [x0, y0, x1, y1] = 
  let
    delta_x = (x1 - x0) / (fromInteger mandelWidth - 1.0)
    delta_y = (y1 - y0) / (fromInteger mandelHeight - 1.0)
    ys = [y0, y0 + delta_y..y1]
    xs = [x0, x0 + delta_x..x1]
    points = [ (x,y) | y <- reverse ys, x <- xs ]
  in
    map plotPoint points

coords :: Float -> Float -> Integer -> [Float]
coords z delta_z n = [ z + delta | delta <- deltas ]
  where deltas = [fromInteger i * delta_z | i <- [1..n]]

plotPoint (x,y) = plotPoint' 0.0 0.0 0.0 0.0 max_iters
  where
    plotPoint' _ _ _  _      0  = "0 0 0"
    plotPoint' a b aa bb iters
      | aa + bb >= max_size   = "15 15 15"
      | otherwise             = 
        let
          aa' = a * a
          bb' = b * b
          b' = 2 * b * a + y
          a' = aa - bb + x
        in plotPoint' a' b' aa' bb' (iters-1)
