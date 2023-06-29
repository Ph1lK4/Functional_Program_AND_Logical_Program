import Data.List
digits :: Integer -> [Integer]
digits = map (read . return) . show
--Question 2.1 Start--


number :: [Integer] -> Integer
number = foldl sumUp 0
   where sumUp i x = 10*i +x

--Question 2.1 Finished --

--Question 2.2 Start--
splits :: [a] -> [([a],[a])]
splits [x]=[]
splits (x:xs) = ([x], xs) : map func (splits xs)
    where func (a, b) = (x:a,b)
--Question 2.2 Finished--

--Question 2.2 Start--
possibles :: [([Integer],[Integer])]
possibles = pairing z
  where
  z = permutations[1,2,3,4,5,6,7,8,9]

pairing::[[Integer]]->[([Integer],[Integer])]
pairing [x] = splits x
pairing (x:xs) = splits x ++ pairing xs
--Question 2.2 Finished--
--Question 2.3 Start--
makePalindrome :: ([Integer],[Integer]) -> Integer
makePalindrome ([],[]) = 0
makePalindrome ([x],[]) =0
makePalindrome ([],[x]) = 0
makePalindrome (x,y) = number x * number y

palindromeCheck :: ([Integer],[Integer]) -> Bool
palindromeCheck x =
  if show(makePalindrome (x)) == reverse(show(makePalindrome (x)))
  then True
else False

checkHead4 :: ([Integer],[Integer]) -> Bool
checkHead4 x =
  if digits(makePalindrome(x))!!0 == 4
  then True
else False

compareNum :: ([Integer],[Integer]) -> Integer
compareNum (x,y) =
  if number x > number y
  then number y
else number x

checkTail3 :: ([Integer],[Integer]) -> Bool
checkTail3 x =
  if compareNum x `mod` 10 == 3
  then True
else False

isAcceptable :: ([Integer],[Integer]) -> Bool
isAcceptable x =
  if checkTail3 x && checkHead4 x && palindromeCheck x == True
  then True
else False

acceptables :: [([Integer],[Integer])]
acceptables = filter isAcceptable possibles
--Question 2.3 Finished--
