import Data.List
--Question 1.1 Start--
digits :: Integer -> [Integer]
digits = map (read . return) . show
--Question 1.1 Finished--

--Question 1.2 Start--
processPar n
  = let
    y = digits n
    n = y!!0 * 10
    z = y!!2 * 10
    e = n + y!!1
    j = z + y!!3
  in
    j `mod` e

isPar :: Integer -> Bool
isPar x = if x /= 0
  then True
else False
--Question 1.2 Finished--

--Question 1.3 Start--
differenceCheck :: (Eq a) => [a] -> Bool
differenceCheck []     = True
differenceCheck (x:xs) = x `notElem` xs && differenceCheck xs

isParty :: (Integer, Integer) -> Bool
isParty (x, y) = differenceCheck ls
  where
    ls = digits x ++ digits y
--Question 1.3 END--