{- 
  For CS 214, Spring 2009
  Version: February 20
  Creative Commons Attribution-Share Alike 3.0 United States License
-}

module Main where

import System
import System.Console.GetOpt
import Control.Monad

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
  mapM_ putStrLn . generate size (optColor opts) $ parseCoordinates nonOptions    
    
generate size color [upperLeft, lowerRight] = 
  plot mandelbrot' size upperLeft lowerRight
    where mandelbrot' = mandelbrot color
generate size color [c, upperLeft, lowerRight] = 
  plot julia' size upperLeft lowerRight
	  where julia' = julia color c
generate _ _ args = error $ show args ++ " not valid coordinates"
