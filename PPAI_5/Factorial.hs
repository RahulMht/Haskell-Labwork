factorial :: Integer -> Integer
factorial n
    | n < 0 = error "Factorial is not defined for negative integers"
    | n == 0 = 1
    | otherwise = n * factorial (n - 1)

calculateAndDisplayFactorial :: IO ()
calculateAndDisplayFactorial = do
    putStrLn "Enter a non-negative integer:"
    input <- getLine
    case reads input :: [(Integer, String)] of
        [(num, "")] -> do
            let fact = factorial num
            putStrLn $ "Factorial of " ++ show num ++ " is: " ++ show fact
        _ -> putStrLn "Invalid input. Please enter a non-negative integer."

main :: IO ()
main = do
    calculateAndDisplayFactorial
