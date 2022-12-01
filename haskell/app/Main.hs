{-# LANGUAGE OverloadedStrings #-}

import Formatting
import Formatting.Clock
import System.Clock
import System.Environment
import Text.Printf

main :: IO ()
main = do
  [args] <- getArgs
  let num = read args :: Int
  start <- getTime Monotonic
  count <- calculate num
  end <- getTime Monotonic
  let time = format timeSpecs start end
  putStrLn (printf "Number of generated k-mers: %d - took %s" count time)

calculate :: Int -> IO Int
calculate len = generate len (concat (replicate len "A")) (concat (replicate len "T")) 1

generate :: Int -> String -> String -> Int -> IO Int
generate len start stop count = do
  -- putStrLn start
  if start == stop
    then return count
    else generate len (next len 0 start 'T') stop (count + 1)

next :: Int -> Int -> String -> Char -> String
next n i start 'T' =
  let c = start !! i
      new = convert c
      str = take i start ++ [new] ++ drop (i + 1) start
   in next n (i + 1) str c
next n i start c = start

convert :: Char -> Char
convert c = case c of
  'A' -> 'C'
  'C' -> 'G'
  'G' -> 'T'
  'T' -> 'A'
