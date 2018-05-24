{-# LANGUAGE ForeignFunctionInterface #-}

module Dep where

foreign import ccall safe "LZ4_compressBound" c_LZ4_compressBound :: Int -> Int
