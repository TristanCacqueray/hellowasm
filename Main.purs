module Main where

import Prelude
import Data.Function.Uncurried (Fn2, Fn3, runFn2, runFn3)
import Effect (Effect)
import Effect.Console (log)

foreign import data WASM :: Type

foreign import withWasm :: Fn2 String (WASM -> Effect Unit) (Effect Unit)

foreign import addInt :: Fn3 WASM Int Int Int

foreign import version :: WASM -> String

withWasm' :: String -> (WASM -> Effect Unit) -> Effect Unit
withWasm' = runFn2 withWasm

addInt' :: WASM -> Int -> Int -> Int
addInt' = runFn3 addInt

main :: Effect Unit
main = withWasm' "main.wasm" go

go :: WASM -> Effect Unit
go wasm = do
  log $ "addInt: " <> show (addInt' wasm 40 2)
  log $ "version: " <> version wasm
