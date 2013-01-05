module AllTests (main) where

import Test.HUnit
import Pr001
import Pr008

main = runTestTT $ test [ 
	pr_001  ~?= 23331668
	, pr_008  ~?= 40824
 ]

