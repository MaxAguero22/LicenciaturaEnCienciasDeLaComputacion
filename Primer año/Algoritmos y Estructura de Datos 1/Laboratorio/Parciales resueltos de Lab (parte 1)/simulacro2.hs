data Forma = Piedra | Papel | Tijera


--1)a)

le_gana :: Forma -> Forma -> Bool
le_gana Piedra Tijera = True
le_gana Papel Piedra = True
le_gana Tijera Papel = True
le_gana _ _ = False


--1)b)

type Nombre = String
data Jugador = Mano Nombre Forma

ganador :: Jugador -> Jugador -> Maybe Nombre
ganador (Mano n x) (Mano n' x') = case le_gana x x' of
                                True -> Just n
                                False -> case le_gana x' x of
                                         True -> Just n'
                                         False -> Nothing 

--Ejercicio 2)

--auxiliar

iguales :: Forma -> Forma -> Bool
iguales Tijera Tijera = True
iguales Piedra Piedra = True
iguales Papel Papel = True
iguales _ _ = False

quien_jugo :: Forma -> [Jugador] -> [Nombre]
quien_jugo _ [] = []
quien_jugo x ((Mano n y):js) = case iguales x y of 
                        True -> n: quien_jugo x js 
                        False -> quien_jugo x js
                        
--Main> quien_jugo Piedra [(Mano "Pedro" Tijera),(Mano "Ramon" Piedra),(Mano "Jose" Tijera)]
--["Ramon"]

--Ejercicio 3)

data NotaMusical = Do | Re | Mi | Fa | Sol | La | Si
data Figura = Negra | Corchea

data Melodia = Entonar NotaMusical Figura Melodia | Vacia
contar_tiempos :: Melodia -> Int
contar_tiempos Vacia = 0
contar_tiempos (Entonar _ Negra lista) = 2 + contar_tiempos lista
contar_tiempos (Entonar _ Corchea lista) = 1 + contar_tiempos lista

-- contar_tiempos (Entonar Re Negra (Entonar Mi Corchea (Entonar Fa Negra (Entonar Mi Negra Vacia))))
-- 7

-- Ejercicio 4


data Arbol a = Vacio | Rama (Arbol a) a (Arbol a) deriving Show

arbol_sum :: Arbol Int -> Arbol Int -> Arbol Int
arbol_sum (Rama Vacio a Vacio) (Rama Vacio b Vacio) = Rama Vacio (a+b) Vacio
arbol_sum Vacio (Rama ar1 a ar2) = (Rama ar1 a ar2)
arbol_sum (Rama ar1 a ar2) Vacio = (Rama ar1 a ar2)
arbol_sum (Rama ar1 a ar2) (Rama ra1 b ra2) = (Rama (arbol_sum ar1 ra1) (a+b) (arbol_sum ar2 ra2)) 
































