{- 
  For CS 214, Spring 2009
  Version: February 16
  Creative Commons Attribution-Share Alike 3.0 United States License
-}

module PPM where
  
import Fractals
  
ppmPrefix (Dimension width height) = ["P3", show width, show height, "15"]

blackOnWhite 0 = "0 0 0"
blackOnWhite x = "15 15 15"

whiteOnBlack 0 = "15 15 15"
whiteOnBlack x = "0 0 0"
