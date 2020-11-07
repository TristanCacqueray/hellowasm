module Main where

import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import Effect.Console (log)
import Prelude

foreign import addInt :: Fn2 Int Int Int

foreign import version :: String

addInt' :: Int -> Int -> Int
addInt' = runFn2 addInt

main :: Effect Unit
main = do
  log $ "addInt: " <> show (addInt' 40 2)
  log $ "version: " <> version
