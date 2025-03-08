-- Ejercicio 1a)

esCero :: Int -> Bool
esCero x = x == 0

-- esCero 0
-- True
-- esCero 1
-- False

--Ejercicio 1b)

esPositivo :: Int -> Bool
esPositivo x = x >= 0

-- esPositivo 1
-- True
-- esPositivo 0
-- True
-- esPositivo (-1)
-- False

--Ejercicio 1c)

esVocal :: Char -> Bool
esVocal x = x == 'a' || x == 'e' || x == 'i' || x == 'o' || x == 'u'

-- esVocal 'a' 
-- True
-- esVocal 'z'
-- False

--Ejercicio 1d)

valorAbsoluto :: Int -> Int
valorAbsoluto x | x >= 0 = x
                | x < 0 = x*(-1)

-- valorAbsoluto 1
-- 1
-- valorAbsoluto (-6)
-- 6

--Ejercicio 2a)

paraTodo :: [Bool] -> Bool
paraTodo [] = True
paraTodo (x:xs) = x == True && paraTodo xs

-- paraTodo [True,True,True]
-- True
-- paraTodo [True,True,False]
-- False

--Ejercicio 2b)

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- sumatoria [1,2,3]
-- 6
-- sumatoria [1,2]
-- 3

--Ejercicio 2c)

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

-- productoria [1,2,3]
-- 6
-- productoria [1,2,0]
-- 0

--Ejercicio 2d)

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

-- factorial 2
-- 2
-- factorial 0
-- 1

--Ejercicio 2e)

promedio :: [Int] -> Int
promedio [] = 0
promedio (x:xs) = (x + sumatoria xs) `div` (length xs + 1)

-- promedio [8,7,10]
-- 8
-- promedio [8,10]
-- 9

--Ejercicio 3)

pertenece ::  Int -> [Int] -> Bool
pertenece n [ ] = False
pertenece n (x:xs) = n==x || (pertenece n xs)

-- pertenece 1 [1,2,6]
-- True
-- pertenece 1 [3,2,6]
-- False

--Ejercicio 4a)

paraTodo' :: [a] -> (a -> Bool) -> Bool
paraTodo' [] t = True
paraTodo' (x:xs) t = t (x) && paraTodo' xs t

-- paraTodo' [0,0,0] esCero
-- True
-- paraTodo' [0,1,0] esCero
-- False

--Ejercicio 4b)

existe' :: [a] -> (a -> Bool) -> Bool
existe' [] t = False
existe' (x:xs) t = t (x) || existe' xs t

-- existe' [0,1,2,3] esCero
-- True
-- existe' [1,2,3] esCero
-- False

--Ejercicio 4c)

sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] t = 0
sumatoria' (x:xs) t = t(x) + sumatoria' xs t

-- sumatoria' [1,2,3] factorial
-- 9
-- sumatoria' [1,4,3] factorial
-- 31

--Ejercicio 4d)

productoria' :: [a] -> (a -> Int) -> Int
productoria' [] t = 1
productoria' (x:xs) t = t(x) * productoria' xs t

-- productoria' [1,2,3] factorial
-- 12
-- productoria' [1,2,3,4] factorial
-- 288

--Ejercicio 5)

paraTodo'' :: [Bool] -> Bool
paraTodo'' xs = paraTodo' xs id

-- paraTodo'' [True,True]
-- True
-- paraTodo'' [True,False]
-- False

--Ejercicio 6a)

todosPares' :: [Int] -> Bool
todosPares' xs = paraTodo' xs even

-- todosPares' [2,4,6]
-- True
-- todosPares' [1,2,3,4]
-- False

--Ejercicio 6b)

esMultiplo :: Int -> Int -> Bool
esMultiplo a b = mod b a == 0

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo y xs = existe' xs (esMultiplo y)

-- hayMultiplo 2 [2,3,7]
-- True
-- hayMultiplo 2 [1,3,7]
-- False

--Ejercicio 6c)

cuadrado :: Int -> Int
cuadrado x = x * x 

sumaCuadrados :: Int -> Int 
sumaCuadrados x = sumatoria' [0..x] cuadrado
       
-- sumaCuadrados 4
-- 30
-- sumaCuadrados 2
-- 5

--Ejercicio 6d)

divisor :: Int -> Int -> Bool
divisor x 0 = False
divisor x y = mod x y == 0
-- y es divisor de x

existeDivisor :: Int -> [Int] -> Bool 
existeDivisor x xs = (existe' xs (divisor x))
-- algun elemento de xs divide a x? 

-- existeDivisor 5 [2,10]
-- True
-- existeDivisor 5 [2,3]
-- False

--Ejercicio 6e)

esPrimo :: Int -> Bool 
esPrimo 0 = False
esPrimo n = not (existeDivisor n [2..(n-1)])

-- esPrimo 5
-- True
-- esPrimo 6
-- False

--Ejercicio 6f)

factorial' :: Int -> Int
factorial' n = productoria' [1..n] id 

-- factorial' 5
-- 120
-- factorial' 7
-- 5040

--Ejercicio 6g)

verprimos :: [Int] -> [Int]
verprimos [] = []
verprimos (x:xs) | True == esPrimo x = x:verprimos xs
                 | otherwise = verprimos xs
                 
-- verprimos [2,3,4,6,7,8,2,3,0,8,4]
-- [2,3,7,2,3,0]
-- verprimos [2,2,8,12,6]
-- [2,2]
             

multPrimos :: [Int] -> Int
multPrimos xs = productoria (verprimos xs)

-- multPrimos [2,4,7,6,9,12]
-- 14
-- multPrimos [2,4,7,6,9,12,3]
-- 42

--Ejercicio 6h)

fib :: Int -> Int
fib n | (n<2) = n
      | otherwise = fib(n-1) + fib(n-2) 
      
esFib :: Int -> Bool
esFib n = pertenece n (map fib [0..(n+1)])

-- esFib 1
-- True
-- esFib 4
-- False

--Ejercicio 6i)

todosFib :: [Int] -> Bool
todosFib xs = paraTodo' xs esFib

-- todosFib [1,1,2]
-- True
-- todosFib [1,1,4]
-- False

--Ejercicio7)

-- map toma una función y una lista y aplica esa función a cada elemento de esa lista, produciendo una nueva lista. Su tipo es = map :: (a -> b) -> [a] -> [b].

-- La función filter toma una función p y una lista no vacía x:xs, si la expresión p x se evalúa a True , el elemento x se engancha al principio de la lista final y se sigue con la evaluación de la expresión filter p xs. Su tipo es = filter :: (a -> Bool) -> [a] -> [a]

-- ¿A que equivale la expresion map succ [1, -4, 6, 2, -8], donde succ n = n+1?

-- Equivale a [2, -3, 7, 3, -7]

-- ¿Y la expresion filter esPositivo [1, -4, 6, 2, -8]?

-- Equivale a [1, 6, 2]

--Ejercicio 8). Programa una función que dada una lista de números xs, devuelve la lista que resulta de duplicar cada valor de xs.

-- a) Definila usando recursion.

duplica :: [Int] -> [Int]
duplica [] = [] 
duplica (x:xs) = (x*2) :duplica xs

-- b) Definila utilizando la función map.

duplica' :: [Int] -> [Int]
duplica' xs = map (*2) xs

-- Ejercicio 9a)

sonPrimos :: [Int] -> [Int]
sonPrimos [] = []
sonPrimos (x:xs) | esPrimo x == True = x: sonPrimos xs
                 | otherwise = sonPrimos xs

-- sonPrimos [1,2,5,6,7]
-- [1,2,5,7]
-- sonPrimos [1,2,5,6,7,10,12]
-- [1,2,5,7]

-- Ejercicio 9b) 

sonPrimos' :: [Int] -> [Int]
sonPrimos' xs = filter esPrimo xs

-- sonPrimos' [1,2,5,6,7]
-- [1,2,5,7]
-- sonPrimos' [1,2,5,6,7,10,12]
-- [1,2,5,7] 

-- Ejercicio 9c)

multPrimos' :: [Int] -> Int
multPrimos' xs = productoria (sonPrimos' xs)

-- multPrimos' [1,2,3,5]
-- 30
-- multPrimos' [1,2,3,5,6]
-- 30
-- multPrimos' [1,2,3,5,6,2]
-- 60

-- Ejercicio 10a)

primIgualesA :: (Eq a) => a -> [a] -> [a]
primIgualesA n [] = []
primIgualesA n (x:xs) | n == x = x: primIgualesA n xs
                      | otherwise = primIgualesA n []

-- primIgualesA 6 [6,6,7,2]
-- [6,6]
-- primIgualesA 6 [6,7,2]
-- [6]
-- primIgualesA 6 [5,6,7,6]
-- []
-- primIgualesA 'b' "bbbee"
-- "bbb"

-- Ejercicio 10b)

primIgualesA' :: (Eq a) => a -> [a] -> [a]
primIgualesA' n xs = takeWhile (n ==) xs

-- primIgualesA' 'r' "rrarrt"
-- "rr"
-- primIgualesA' 3 [3,3,3,3,5,6,7]
-- [3,3,3,3]
-- primIgualesA' 3 [5,6,3]
-- []

-- Ejercicio 11a)

primIguales :: (Eq a) => [a] -> [a]
primIguales [] = []
primIguales [x] = [x]
primIguales (x:xs) | (head xs == x) = x : primIguales xs
                   | otherwise = primIguales [x]

-- primIguales [6,6,7,3]
-- [6,6]
-- primIguales "oooola"
-- "oooo"

-- Ejercicio 11b)

primIguales' :: (Eq a) => [a] -> [a]
primIguales' [] = []
primIguales' (x:xs) = x: primIgualesA' x xs

-- primIguales' [4,4,4,5,3]
-- [4,4,4]
-- primIguales' [2,4,5,3]
-- [2]
-- primIguales' "AArgentina"
-- "AA"

-- Ejercicio12)

cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen op z [] t = z
cuantGen op z (x:xs) t = t x `op` cuantGen op z xs t    -- 'op' por notacion infija

-- cuantGen (+) 0 [1,2,3] (+1)
-- 9
-- cuantGen (+) 0 [1,2,3] (+2)
-- 12
-- cuantGen (*) 1 [1,2,3] (+1)
-- 24

paratodo'' :: [a] -> (a -> Bool) -> Bool
paratodo'' xs t = cuantGen (&&) True xs t

-- paratodo'' [0,0,0] esCero 
-- True
-- paratodo'' [0,0,1] esCero 
-- False

existe'' :: [a] -> (a -> Bool) -> Bool
existe'' xs t = cuantGen (||) False xs t 

-- existe'' [0,1,2] esCero
-- True
-- existe'' [2,1,2] esCero
-- False

sumatoria'' :: [a] -> (a -> Int) -> Int
sumatoria'' xs t = cuantGen (+) 0 xs t

-- sumatoria'' [1,2,3] (+2)
-- 12
-- sumatoria'' [1,2,3] (+1)
-- 9

productoria'' :: [a] -> (a -> Int) -> Int
productoria'' xs t = cuantGen (*) 1 xs t

-- productoria'' [1,2,3] factorial
-- 12
-- productoria'' [1,2,3] (+1)
-- 24

-- Ejercicio13)

distanciaEdicion :: [Char] -> [Char] -> Int
distanciaEdicion [] xs = length xs
distanciaEdicion ys [] = length ys
distanciaEdicion (x:xs) (y:ys) | x==y = distanciaEdicion xs ys 
                               | otherwise = 1 + distanciaEdicion xs ys 

-- distanciaEdicion [] "Holaa"
-- 5
-- distanciaEdicion "Holaa" []
-- 5
-- distanciaEdicion "Holaa" "Holaa"
-- 0
-- distanciaEdicion "Holaa" "chauu"
-- 5

-- Ejercicio14)

primQueCumplen :: [a] -> (a -> Bool) -> [a]
primQueCumplen [] p = []
primQueCumplen (l:ls) p | p (l) = l: primQueCumplen ls p
                        | otherwise = primQueCumplen [] p
 
-- primQueCumplen [2,3,4] esPrimo
-- [2,3]
-- primQueCumplen [4,3,4] esPrimo
-- []
-- primQueCumplen [2,4,3,4] esPrimo
-- [2]

--Ejercicio 15)

--a) f :: (a, b) -> ...  
--f (x , y) = ... 
--El tipado es correcto, su tipo es una tupla de tipo a y tipo b

--b) f :: [(a, b)] -> ...
--f (a , b) = ...
--No esta bien tipado, lo correcto seria ((a,b):xs)

--c) f :: [(a, b)] -> ...
--f (x:xs) = ... 
--No esta bien tipado, la funcion espera el valor que debe tomar b

--d) f :: [(a, b)] -> ...
--f ((x, y) : ((a, b) : xs)) = ...
--No esta bien tipado, la tupla (x, y) esta por fuera de la lista xs

--e) f :: [(Int, a)] -> ...
--f [(0, a)] = ...
--El tipado es correcto, su tipo es de una lista de pares, el primer par tipo Int y el segundo tipo a

--f ) f :: [(Int, a)] -> ...
--f ((x, 1) : xs) = ...
--El tipado es incorrecto, nunca se especifica el tipo Eq a ni tampoco Num a.

--g) f :: (Int -> Int) -> Int -> ...
--f a b = ...
--El tipado es correcto, f va de una funcion de tipo Int en Int hacia un elemento tipo Int

--h) f :: (Int -> Int) -> Int -> ...
--f a 3 = ...
--El tipado es correcto, f va desde un predicado te tipo Int en Int hacia un elemento tipo Int 

--i) f :: (Int -> Int) -> Int -> ...
--f 0 1 2 = ...
--El tipado es incorrecto, no tipa Int con (Int -> Int)


--Ejercicio16)

--a) f :: (a, b) -> b
--   f (x , y) = y   la funcion solo toma dos argumentos.

--b) f :: (a, b) -> c
--   no es posible 

--c) f :: (a -> b) -> a -> b
--   f t x = t x               

--d) f :: (a -> b) -> [a] -> [b]
--   f t (x:xs) = t x : map t xs   forma alternativa   f t (x:xs) = map t xs










