module Options
where

import System.Console.GetOpt
import PPM
                                                                          

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

coordinateParse string = read $ replace string
  where
    replace ('~':chs) = '-':chs
    replace xs        = xs

