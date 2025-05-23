-- Stock system

-- 1
generateStock :: [String] -> [(String, Int)]
generateStock [] = []
generateStock (x:xs) = (x, contStock x (x:xs)) : generateStock (deleteX x xs)

contStock :: String -> [String] -> Int
contStock _ [] = 0
contStock product (p:ps)
    | product == p = 1 + contStock product ps
    | otherwise = contStock product ps

deleteX :: String -> [String] -> [String]
deleteX _ [] = []
deleteX product (p:ps)
    | product /= p = p : deleteX product ps
    | otherwise = deleteX product ps

-- 2
stockOfProduct :: [(String, Int)] -> String -> Int
stockOfProduct [] _ = 0
stockOfProduct (x:xs) product
    | product == fst x = snd x
    | otherwise = stockOfProduct xs product 

-- 3
moneyInStock  :: [(String, Int)] -> [(String, Float)] -> Float
moneyInStock _ [] = 0
moneyInStock stock (p:ps) = fromIntegral (stockOfProduct stock (fst p)) * (snd p) + moneyInStock stock ps 

-- 4
applyOffer ::  [(String, Int)] -> [(String, Float)] -> [(String,Float)]
applyOffer _ [] = []
applyOffer stock (p:ps)
    | fromIntegral (stockOfProduct stock (fst p)) > 10 =  (fst p, fromIntegral (stockOfProduct stock (fst p)) * (snd p) * (0.80)) : applyOffer stock ps
    | otherwise = (fst p, fromIntegral (stockOfProduct stock (fst p)) * (snd p)) : applyOffer stock ps

-- Soup of numbers

type Fila = [Int]
type Tablero = [Fila]
type Posicion = (Int, Int)
type Camino = [Posicion]

-- 5
maximo :: Tablero -> Int
maximo [x] = maximoFila x
maximo (f1:f2:fs)
    | maximoFila f1 >= maximoFila f2 = maximo (f1:fs)
    | otherwise = maximo (f2:fs)

maximoFila :: Fila -> Int
maximoFila [x] = x
maximoFila (x1:x2:xs)
    | x1 >= x2 = maximoFila (x1:xs)
    | otherwise = maximoFila (x2:xs)

-- 6


aplanarTablero :: Tablero -> Fila
aplanarTablero [] = []
aplanarTablero (f:fs) = f ++ aplanarTablero fs