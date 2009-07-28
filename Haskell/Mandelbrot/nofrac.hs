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
  let coordinates = parseCoordinates nonOptions    
  mapM_ putStrLn $ ppmPrefix (optSize opts)
  mapM_ putStrLn $ generate (optSize opts) (optColor opts) coordinates
    
-- two coordinates means mandelbrot
generate size color [upperLeft, lowerRight] = 
  plot mandelbrot color size upperLeft lowerRight
-- three coordinates means julia
generate size color [c, upperLeft, lowerRight] = 
  plot (julia c) color size upperLeft lowerRight
generate _ _ args = error $ show args ++ " not valid coordinates"
