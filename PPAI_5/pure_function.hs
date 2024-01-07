calculatePower :: Integer -> Integer -> Double
calculatePower _ 0 = 1.0
calculatePower base exp
    | exp > 0 = fromIntegral base * calculatePower base (exp - 1)
    | exp < 0 = 1.0 / calculatePower base (abs exp)
    | otherwise = error "Exponent must be non-negative"

pureCalculatePower :: Integer -> Integer -> Double
pureCalculatePower base exp = calculatePower base exp

main :: IO ()
main = do
    putStrLn "Calculating power:"
    putStrLn "Enter the base:"
    base <- readLn :: IO Integer
    putStrLn "Enter the exponent:"
    exp <- readLn :: IO Integer
    let result = pureCalculatePower base exp
    putStrLn $ "Result: " ++ show result
