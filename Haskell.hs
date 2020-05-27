;2.Определите функцию, заменяющую в исходном списке все вхождения заданного значения другим.

s lst from to = map 
    (\x -> if x == from
    then to else x) lst

main = do
print $ s [6,3,4,3] 3 7
