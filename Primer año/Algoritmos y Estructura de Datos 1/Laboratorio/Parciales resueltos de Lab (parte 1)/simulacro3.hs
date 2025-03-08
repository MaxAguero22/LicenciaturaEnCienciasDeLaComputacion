-- Ejercicio1)

type Titulo = String 
type Artista = String
type Duracion = Int 
 
data Genero = Rock | Blues | Pop | Jazz
 
data Cancion = Tema Titulo Artista Genero Duracion | Publicidad Duracion

mismo_genero :: Genero -> Genero -> Bool
mismo_genero Rock Rock = True
mismo_genero Blues Blues = True
mismo_genero Pop Pop = True
mismo_genero Jazz Jazz = True
mismo_genero _ _ = False

duracion_de :: Cancion -> Duracion
duracion_de (Publicidad x) = x
duracion_de (Tema _ _ _ x) = x

instance Eq Cancion
  where 
         c1 == c2 = duracion_de (c1) == duracion_de (c2)

instance Ord Cancion
  where 
         c1 <= c2 = duracion_de (c1) <= duracion_de (c2)


-- Ejercicio2)

solo_genero :: [Cancion] -> Genero -> [Titulo]
solo_genero [] gi = []
solo_genero ((Tema t _ g _):cs) gi | (mismo_genero g gi) = t : solo_genero cs gi 
                                   | otherwise = solo_genero cs gi
solo_genero (_:cs) gi = solo_genero cs gi

-- solo_genero [(Tema "a" "aa" Pop 250),(Tema "c" "oo" Pop 500),(Tema "ee" "ii" Jazz 400)] Pop
-- ["a","c"]
-- solo_genero [(Tema "a" "aa" Pop 250),(Tema "c" "oo" Pop 500),(Tema "ee" "ii" Jazz 400)] Jazz
-- ["ee"]

-- Ejercicio3)

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)

la_suma_mayores :: Num b => Ord b => ListaAsoc a b -> b -> b
la_suma_mayores Vacia x = 0 
la_suma_mayores (Nodo a b lista) x = case b of 
                                   b |(b >= x) -> b + la_suma_mayores lista x
                                   b |(b < x) -> la_suma_mayores lista x

-- la_suma_mayores (Nodo 1 3 (Nodo 2 3 (Nodo 3 3 (Nodo 4 3 Vacia)))) 4
-- 0
-- la_suma_mayores (Nodo 1 3 (Nodo 2 3 (Nodo 3 3 (Nodo 4 3 Vacia)))) 2
-- 12

-- Ejercicio4)

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a)

a_listar :: Arbol a -> [a]
a_listar Hoja = []
a_listar (Rama ar1 a ar2) = [a] ++ (a_listar ar1) ++ (a_listar ar2) 

-- a_listar (Rama(Rama(Hoja)(4)(Rama(Hoja)(5)(Hoja)))(7)(Rama(Rama(Hoja)(10)(Hoja))(15)(Rama(Hoja)(18)(Hoja))))
-- [7,4,5,15,10,18]

-- a_listar (Rama (Rama(Hoja)(2)(Hoja))(1)(Rama(Hoja)(3)(Hoja)))
-- [1,2,3]























