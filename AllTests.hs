module AllTests (main) where

import Test.HUnit
import Pr001
import Pr008
import Pr011

main = runTestTT $ test [ 
	pr_001  ~?= 23331668
	, pr_008  ~?= 40824
	, pr_011  ~?= 70600674
 ]

