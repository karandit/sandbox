module Pr001 (pr_001) where

pr_001 :: Int
pr_001 = sum [x | x<- [1..9999], x `mod` 3 == 0 || x `mod` 5 == 0]
