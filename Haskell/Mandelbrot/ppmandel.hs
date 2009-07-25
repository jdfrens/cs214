{- 
  For CS 214, Spring 2009
  Version: February 20
  Creative Commons Attribution-Share Alike 3.0 United States License
-}

module Main where

import System
import System.Console.GetOpt
import Options
import PPM
import Fractals

main :: IO ()
main = do
  args <- getArgs
  let (actions, nonOptions, errors) = getOpt RequireOrder options args
  opts <- foldl (>>=) (return startOptions) actions
  let size = Dimension (optWidth opts) (optHeight opts)
  mapM_ putStrLn $ ppmPrefix size
  mapM_ putStrLn . generate size (optColor opts) $ map coordinateParse nonOptions
    
generate size color [x0, y0, x1, y1] = 
  plot (mandelbrot color) size (Point x0 y0) (Point x1 y1)
generate size color [cx, cy, x0, y0, x1, y1] = 
  plot julia' size (Point x0 y0) (Point x1 y1)
	  where julia' = (julia blackOnWhite (Point cx cy))
generate _ _ args = error $ show args ++ " not valid coordinates"
