{- 
  For CS 214, Spring 2009
  Version: February 16
  Creative Commons Attribution-Share Alike 3.0 United States License
-}

module Main where

import System (getArgs)
import qualified PPM
import Mandelbrot

main :: IO ()
main = do
  args <- getArgs
  mapM_ putStrLn $ PPM.ppmPrefix mandelWidth mandelHeight
  mapM_ putStrLn . ppmMandelbrot $ map read args
