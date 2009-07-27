{- 
  For CS 214, Spring 2009
  Version: February 16
  Creative Commons Attribution-Share Alike 3.0 United States License
-}

module PPM (ppmPrefix, blackOnWhite, whiteOnBlack, grayScale, randomColors)
where
  
import System.Random
import Data.List

import Fractals
  
ppmPrefix (Dimension width height) = ["P3", show width, show height, "256"]

blackOnWhite 0 = "0 0 0"
blackOnWhite _ = "256 256 256"

whiteOnBlack 0 = "256 256 256"
whiteOnBlack _ = "0 0 0"

grayScale n = val ++ " " ++ val ++ " " ++ val
  where val = show $ div (n * 256) 512
  
red :: [Integer]
red = randomRs (0, 256) (mkStdGen 8)
green :: [Integer]
green = randomRs (0, 256) (mkStdGen 88)
blue :: [Integer]
blue = randomRs (0, 256) (mkStdGen 888)
randomColors n = 
  genericIndex colors  n
  where
    colors = "0 0 0" : zipWith3 color red green blue
    color r g b = (show r) ++ " " ++ (show g) ++ " " ++ (show b)