a :: Integer
a = 1

b :: Integer
b = 2

c :: Integer
c = 3

-- Sum two integers
add :: Integer -> Integer -> Integer
add x y = x + y

-- Calculate the result based on two functions and constants
calculateResult :: (Integer -> Integer -> Integer) -> (Integer -> Integer -> Integer) -> Integer
calculateResult func1 func2 = func1 a b + func2 b c

-- Result using 'add' function
result :: Integer
result = calculateResult add add

main :: IO ()
main = do
  putStrLn $ "Result: " ++ show result
