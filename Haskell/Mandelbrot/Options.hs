module Options
where

import System.Console.GetOpt
import Complex

import PPM
import Fractals
                                                                          

data Options = Options  { optSize     :: Dimension Integer
                        , optColor    :: Integer -> String
                        }
startOptions = Options  { optSize   = Dimension 512 384
                        , optColor  = blackOnWhite
                        }

options :: (Monad m) => [OptDescr (Options -> m Options)]
options =
  [ Option "w" ["width"] (ReqArg widthFunc "WIDTH") "width of image"
  , Option "h" ["height"] (ReqArg heightFunc "HEIGHT") "height of image"
  , Option "c" ["color"] (ReqArg colorFunc "COLOR") "color map"
  ]
  where
    widthFunc arg opt =
      case (optSize opt) of
        Dimension _ height -> 
          return opt { optSize = Dimension (read arg) height }
    heightFunc arg opt =
      case (optSize opt) of
        Dimension width _ -> 
          return opt { optSize = Dimension width (read arg) }
    colorFunc color opt =
      case color of
        "bw"     -> return opt { optColor = blackOnWhite }
        "wb"     -> return opt { optColor = whiteOnBlack }
        "gray"   -> return opt { optColor = grayScale }
        "random" -> return opt { optColor = randomColors }

parseCoordinates args = makePoints $ map floatParse args
  where
    makePoints []         = []
    makePoints (x:y:args) = x :+ y : makePoints args
    floatParse ('~':digits) = read $ '-':digits
    floatParse string = read string
