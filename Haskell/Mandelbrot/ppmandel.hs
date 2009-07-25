{- 
  For CS 214, Spring 2009
  Version: February 20
  Creative Commons Attribution-Share Alike 3.0 United States License
-}

module Main where

import System
import System.Console.GetOpt
import Data.Maybe ( fromMaybe )
import PPM
import Fractals

main :: IO ()
main = do
  args <- getArgs
  let (actions, nonOptions, errors) = getOpt RequireOrder options args
  opts <- foldl (>>=) (return startOptions) actions
  let size = Dimension (optWidth opts) (optHeight opts)
  mapM_ putStrLn $ ppmPrefix size
  mapM_ putStrLn . generate size $ map coordinateParse nonOptions
    
coordinateParse string = read $ replace string
  where
    replace ('~':chs) = '-':chs
    replace xs        = xs
  
generate size [x0, y0, x1, y1] = 
  plot (mandelbrot whiteAndBlack) size (Point x0 y0) (Point x1 y1)
generate _ args =
  error $ show args ++ " not valid coordinates"


data Options = Options  { optWidth    :: Integer
                        , optHeight   :: Integer
                        }
                deriving (Show)
startOptions = Options  { optWidth  = 512
                        , optHeight = 384
                        }
                                                                          
data Flag = Width String | Height String
   deriving Show

options =
   [ Option "w" ["width"]
       (ReqArg
           (\arg opt -> return opt { optWidth = read arg })
           "WIDTH")
       "width of image",
      Option "h" ["height"]
        (ReqArg
          (\arg opt -> return opt { optHeight = read arg })
          "HEIGHT")
        "height of image"
    ]

-- options =
--  [ 
--    Option ['w'] ["width"]   (OptArg width "WIDTH")    "width of image",
--    Option ['h'] ["height"]  (OptArg height "HEIGHT")  "height of image"
--  ]
--  where
--    width = Width . fromMaybe "512"
--    height = Height . fromMaybe "384"
-- 
-- compilerOptions :: [String] -> IO ([Flag], [String])
-- compilerOptions argv = 
--    case getOpt Permute options argv of
--       (o,n,[]  ) -> return (o,n)
--       (_,_,errs) -> ioError (userError (concat errs ++ usageInfo header options))
--   where header = "Usage: nofrac [OPTION...] files..."
