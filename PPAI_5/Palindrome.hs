import Data.Char (toLower, isSpace)

isPalindrome :: String -> Bool
isPalindrome str =
    let normalizedStr = filter (not . isSpace) (map toLower str)  -- Normalize: remove spaces and convert to lowercase
    in normalizedStr == reverse normalizedStr

main :: IO ()
main = do
    putStrLn "Enter a string to check if it's a palindrome:"
    input <- getLine
    putStrLn $ if isPalindrome input
                    then "It's a palindrome!"
                    else "It's not a palindrome."
