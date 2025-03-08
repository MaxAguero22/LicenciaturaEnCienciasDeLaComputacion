--Ejercicio1)
 
--a) 
 
data Ropa = Camisa | Pantalon | Pollera | Short

misma_ropa :: Ropa -> Ropa -> Bool
misma_ropa Camisa Camisa = True
misma_ropa Pantalon Pantalon = True
misma_ropa Pollera Pollera = True
misma_ropa Short Short = True
misma_ropa _ _ = False

--b)

type Talle = Int

data Prenda = ConTalle Talle Ropa | TalleUnico Ropa

--c)

valor_talle :: Prenda -> Int
valor_talle (ConTalle t r) = t
valor_talle (TalleUnico r) = 0

--d)

instance Eq Prenda
  where
        p1 == p2 = valor_talle(p1) == valor_talle(p2)

instance Ord Prenda 
  where
        p1 >= p2 = valor_talle(p1) >= valor_talle(p2)
        p1 <= p2 = valor_talle(p1) <= valor_talle(p2)
        
--Ejercicio2)

--a)

solo_con_talle :: [Prenda] -> Ropa -> [Talle]
solo_con_talle [] r' = []
solo_con_talle ((ConTalle t r):ps) r' | (misma_ropa r r') = [t] ++ solo_con_talle ps r'
                                      | otherwise = solo_con_talle ps r'
solo_con_talle (_:ps) r' = solo_con_talle ps r'

--b)
 
ejemplo = [(ConTalle 4 Short),(ConTalle 5 Short),(TalleUnico Pollera)]

--c)

-- solo_con_talle ejemplo Short
-- [4,5]

--Ejercicio 3)

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving Show

la_duplica_pares :: (Integral a, Num b) => ListaAsoc a b -> ListaAsoc a b
la_duplica_pares Vacia = Vacia
la_duplica_pares (Nodo x y lista) | (mod x 2 == 0) = (Nodo x (y*2) (la_duplica_pares lista))
                                  | otherwise = Nodo x y (la_duplica_pares lista)

--Ejercicio4)

--a) 

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a)

a_esCota_inf :: Ord a => a -> Arbol a -> Bool
a_esCota_inf _ Hoja = True
a_esCota_inf e (Rama ar1 a ar2) = (e <= a) && (a_esCota_inf e ar1) && (a_esCota_inf e ar2)

--b)

ejemplo1 = (Rama(Rama(Rama(Hoja)((-10))(Hoja))(3)(Rama(Hoja)(2)(Hoja)))(5)(Rama(Rama(Hoja)(2)(Hoja))(4)(Rama(Hoja)(3)(Hoja))))

--c)

-- a_esCota_inf (-10) ejemplo1
-- True








































