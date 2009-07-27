module Options
where

import System.Console.GetOpt
import PPM

import Fractals
                                                                          

data Options = Options  { optWidth    :: Integer
                        , optHeight   :: Integer
                        , optColor    :: Integer -> String
                        }
startOptions = Options  { optWidth  = 512
                        , optHeight = 384
                        , optColor  = blackOnWhite
                        }

options :: (Monad m) => [OptDescr (Options -> m Options)]
options =
  [ Option "w" ["width"] (ReqArg widthFunc "WIDTH") "width of image"
  , Option "h" ["height"] (ReqArg heightFunc "HEIGHT") "height of image"
  , Option "c" ["color"] (ReqArg colorFunc "COLOR") "color map"
  ]
  where
    widthFunc arg opt = return opt { optWidth = read arg }
    heightFunc arg opt = return opt { optHeight = read arg }
    colorFunc "bw" opt = return opt { optColor = blackOnWhite }
    colorFunc "wb" opt = return opt { optColor = whiteOnBlack }
    colorFunc "gray" opt = return opt { optColor = grayScale }
    colorFunc "random" opt = return opt { optColor = randomColors }

parseCoordinates args = makePoints $ map floatParse args
  where
    makePoints []         = []
    makePoints (x:y:args) = makePoint x y : makePoints args
    makePoint x y = Point x y
    floatParse string = read $ replace string
    replace ('~':chs) = '-':chs
    replace chs       = chs
