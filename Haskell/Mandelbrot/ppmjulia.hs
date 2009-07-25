{- 
  For CS 214, Spring 2009
  Version: February 20
  Creative Commons Attribution-Share Alike 3.0 United States License
-}

module Main where

import System (getArgs)
import PPM
import Fractals

size = Dimension 512 384

main :: IO ()
main = do
  args <- getArgs
  mapM_ putStrLn $ ppmPrefix size
  mapM_ putStrLn . generate $ map read args

generate [cx, cy, x0, y0, x1, y1] = plot julia' size (Point x0 y0) (Point x1 y1)
	      	      	      	      where julia' = (julia blackOnWhite (Point cx cy))
