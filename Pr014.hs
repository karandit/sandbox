--import Debug.Trace (trace)
import qualified Data.Map as Map
--debug = flip trace

{--collatz n 
	| n == 1 = [1] --`debug` "collatz 1"
	| even n = n:collatz (n `div` 2) --`debug` ("collatz "++ show n)
	| odd n	 = n:collatz (3*n +1) --`debug` ("collatz "++ show n)
--}
collatz a cache 
	| a == 1 = (1, cache) --`debug` "collatz 1"
	| even a = let (res, cache') = coll2 (a `div` 2) cache in (1 + res, cache')  --`debug` ("collatz "++ show a)
	| odd a	 = let (res, cache') = coll2 (3*a +1) cache in (1 + res, cache') --`debug` ("collatz "++ show a)

coll2 n cache = if Map.member n cache 
		then let Just v = Map.lookup n cache in (v, cache) 
		else let (res, cache') = collatz n cache in (res, Map.insert n res cache')

pr014a = putStrLn $ show r1 ++ " " ++ show r2
	where 	r1@(_, cache) = coll2 10 Map.empty
		r2@(_, _) = coll2 13 cache	

pr014b n = fst $ foldl (\(sol, cache) n -> let (res,cache') = coll2 n cache in ((n,res):sol, cache') ) ([], Map.empty) [1..n]

pr014c n = fst $ foldl (\(acc@(_,maxi), cache) n -> let (res,cache') = coll2 n cache in (if res > maxi then (n,res) else acc, cache') ) ((0,0), Map.empty) [1..n]
{--
memo_collatz :: Integer -> Integer
memo_collatz =
	let coll n 
		| n == 1 = 1 `debug` "memo_collatz 1"
		| even n = 1 + memo_collatz (n `div` 2) `debug` ("memo_collatz "++ show n)
		| odd n	 = 1 + memo_collatz (3*n +1) `debug` ("memo_collatz "++ show n)
	in (map coll [0..] !!)
--}
--pr014 = map (\n -> (n, collatz n)) [1..999999]

main = do
  let startNum = 1000000
  print (run2 startNum 0 0)

run2 n max index
  | n==1 = index
  | (sizeListInlined n 1) > max = run2 (n-1) (sizeListInlined n 1) n
  | otherwise = run2 (n-1) max index

sizeListInlined :: Integer -> Integer -> Integer
sizeListInlined n count
  | n==1 = count
  | n `mod` 2==0 = sizeListInlined (n `div` 2) count+1
  | otherwise = sizeListInlined ((3*n)+1) count+1

