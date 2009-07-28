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

ppmEntry r g b = (show r) ++ " " ++ (show g) ++ " " ++ (show b)

blackOnWhite 0 = "0 0 0"
blackOnWhite _ = "256 256 256"

whiteOnBlack 0 = "256 256 256"
whiteOnBlack _ = "0 0 0"

grayScale n = ppmEntry val val val
  where val = div (n * 256) 512
  
randomColors n = 
  genericIndex colors  n
  where
    colors = "0 0 0" : zipWith3 ppmEntry reds greens blues
    
reds :: [Integer]
reds = randomRs (0, 256) (mkStdGen 8)
greens :: [Integer]
greens = randomRs (0, 256) (mkStdGen 88)
blues :: [Integer]
blues = randomRs (0, 256) (mkStdGen 888)
