{- 
  For CS 214, Spring 2009
  Version: February 20
  Creative Commons Attribution-Share Alike 3.0 United States License
-}

module Main where

import System (getArgs)
import qualified PPM
import Fractals

main :: IO ()
main = do
  args <- getArgs
  mapM_ putStrLn $ PPM.ppmPrefix fractalWidth fractalHeight
  mapM_ putStrLn . generate $ map read args

generate [x0, y0, x1, y1] = ppmPlot mandelbrot x0 y0 x1 y1
