--Ejercicio 1a)

data Carrera = Matematica | Fisica | Computacion | Astronomia deriving Eq

--Ejercicio 1b)

titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Lic. en Ciencias de la Computacion"
titulo Astronomia = "Licenciatura en Astronomia"

-- titulo Matematica
-- "Licenciatura en Matematica"
-- titulo Fisica
-- "Licenciatura en Fisica"

--Ejercicio 1c)

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Eq, Ord, Show, Bounded)

--Ejercicio 1d)

cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'B'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

-- cifradoAmericano Do
-- 'B'
-- cifradoAmericano Sol
-- 'G'

--Ejercicio 2)

-- Do <= Re
-- True
-- Fa `min` Sol
-- Fa 

--Ejercicio 3a)

minimoElemento :: Ord a => [a] -> a
minimoElemento [x] = x
minimoElemento (x:xs) = x `min` minimoElemento xs  

--Ejercicio 3b)

minimoElemento' :: Bounded a => Ord a => [a] -> a
minimoElemento' [] = minBound
minimoElemento' xs = minimoElemento xs

-- minimoElemento' ([1,2,3,4]::[Int])
-- 1
-- minimoElemento' ([True,False]::[Bool])
-- False
-- minimoElemento' ("abc"::[Char])
-- 'a'

--Ejercicio 3c)

-- minimoElemento' [Fa,La,Sol,Re,Fa]::NotaBasica
-- Re

--Ejercicio 4a)

type Altura = Int
type NumCamiseta = Int

data Zona = Arco | Defensa | Mediocampo | Delantera deriving Show 
data TipoReves = DosManos | UnaMano deriving Show
data Modalidad = Carretera | Pista | Monte | BMX deriving Show
data PiernaHabil = Izquierda | Derecha deriving Show

type ManoHabil = PiernaHabil


data Deportista = Ajedrecista | Ciclista Modalidad | Velocista Altura | Tenista TipoReves ManoHabil Altura | Futbolista Zona NumCamiseta PiernaHabil Altura deriving Show

--Ejercicio 4b)

-- el constructor Ciclista tiene tipo Deportista con un argumento tipo Modalidad

--Ejercicio 4c)

contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas ((Velocista n):xs) = 1 + contar_velocistas xs
contar_velocistas (_:xs) = contar_velocistas xs

-- contar_velocistas [(Velocista(4)),(Velocista(3)),Ajedrecista]
-- 2
-- contar_velocistas [Ajedrecista,Velocista(4)]
-- 1

--Ejercicio 4d)

contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] l = 0
contar_futbolistas ((Futbolista(Arco)_ _ _):xs) Arco = 1 + contar_futbolistas xs Arco
contar_futbolistas ((Futbolista(Defensa) _ _ _ ):xs) Defensa = 1 + contar_futbolistas xs Defensa
contar_futbolistas ((Futbolista(Mediocampo) _ _ _ ):xs) Mediocampo = 1 + contar_futbolistas xs Mediocampo
contar_futbolistas ((Futbolista(Delantera) _ _ _ ):xs) Delantera = 1 + contar_futbolistas xs Delantera
contar_futbolistas (_:xs) l = contar_futbolistas xs l

-- contar_futbolistas [Futbolista(Arco)(3)(Derecha)(6),Futbolista(Arco)(3)(Derecha)(6),Futbolista(Defensa)(2)(Izquierda)(7),Velocista(2)] Defensa
-- 1

--Ejercicio 4e)

igZona :: Zona -> Deportista -> Bool
igZona Arco (Futbolista Arco _ _ _) = True
igZona Defensa (Futbolista Defensa _ _ _)= True
igZona Mediocampo (Futbolista Mediocampo _ _ _)= True
igZona Delantera (Futbolista Delantera _ _ _)= True
igZona l _ = False 

contar_futbolistas' :: [Deportista] -> Zona -> Int 
contar_futbolistas' xs l = length (filter (igZona l) xs)

-- contar_futbolistas' [Futbolista(Arco)(3)(Derecha)(6),Futbolista(Arco)(3)(Derecha)(6),Futbolista(Defensa)(2)(Izquierda)(7),Velocista(2)] Arco
-- 2

-- Ejercicio 5a)

sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

-- Ejercicio 5b)

data Alteracion = Bemol | Natural | Sostenido
-- Ejercicio 5c)

data NotaMusical = Nota NotaBasica Alteracion

-- Ejercicio 5d)

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota (a)(Natural)) = sonidoNatural (a)
sonidoCromatico (Nota (a)(Sostenido)) = (sonidoNatural (a)) + 1
sonidoCromatico (Nota (a)(Bemol)) = (sonidoNatural (a)) - 1

-- sonidoCromatico (Nota(Sol)(Natural))
-- 7
-- sonidoCromatico (Nota(Sol)(Sostenido))
-- 8
-- sonidoCromatico (Nota(Sol)(Bemol))
-- 6

-- Ejercicio 5e)

instance Eq NotaMusical 
  where
       Nota a1 b1 == Nota a2 b2 = sonidoCromatico(Nota a1 b1) == sonidoCromatico(Nota a2 b2)

-- Nota(Re)(Bemol)==Nota(Do)(Sostenido)
-- True
-- Nota(Re)(Bemol)==Nota(Fa)(Sostenido)
-- False


--Ejercicio 5f)

instance Ord NotaMusical
  where 
       Nota a1 b1 <= Nota a2 b2 = sonidoCromatico(Nota a1 b1) <= sonidoCromatico(Nota a2 b2)

-- Nota(Do)(Natural) <= Nota(Re)(Bemol)
-- True
-- Nota(Mi)(Bemol) <= Nota(Re)(Bemol)
-- False

-- Ejercicio 6a)

primerElemento :: [a] -> Maybe a 
primerElemento [] = Nothing
primerElemento (x:xs) = Just x

-- primerElemento []
-- Nothing
-- primerElemento [1]
-- Just 1
-- primerElemento [1,2]
-- Just 1


-- Ejercicio 7a)

-- 1)

data Cola = VaciaC | Encolada Deportista Cola deriving Show

atender :: Cola -> Maybe Cola 
atender VaciaC = Nothing 
atender (Encolada _  y) = Just y

-- atender (Encolada(Ajedrecista)(Encolada(Velocista(6))(Encolada(Ajedrecista)(VaciaC)))) 
-- Just (Encolada (Velocista 6) (Encolada Ajedrecista VaciaC))

-- 2)

enColar :: Deportista -> Cola -> Cola
enColar x (Encolada(d)(VaciaC)) = (Encolada(d)(Encolada(x)(VaciaC)))
enColar x (Encolada(d)(c)) = (Encolada(d)(enColar x c))

-- enColar Ajedrecista (Encolada(Velocista(3))(Encolada(Ajedrecista)(VaciaC)))
-- Encolada (Velocista 3) (Encolada Ajedrecista (Encolada Ajedrecista VaciaC))
-- enColar Ajedrecista (Encolada(Ciclista(BMX))(Encolada(Velocista(3))(VaciaC)))
-- Encolada (Ciclista BMX) (Encolada (Velocista 3) (Encolada Ajedrecista VaciaC)) 

-- 3)

busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC l = Nothing
busca (Encolada (Futbolista Arco n p a)(c)) Arco = Just (Futbolista Arco n p a)
busca (Encolada (Futbolista Defensa n p a)(c)) Defensa = Just (Futbolista Defensa n p a)
busca (Encolada (Futbolista Mediocampo n p a)(c)) Mediocampo = Just (Futbolista Mediocampo n p a)
busca (Encolada (Futbolista Delantera n p a)(c)) Delantera = Just (Futbolista Delantera n p a)
busca (Encolada(_)(c)) l = busca c l

-- busca (Encolada(Ajedrecista)(VaciaC)) Arco
-- Nothing
-- busca (Encolada(Velocista 4)(Encolada(Ajedrecista)(Encolada(Futbolista Arco 5 Izquierda 5)(Encolada(Futbolista Defensa 6 Derecha 7)(VaciaC))))) Defensa
-- Just (Futbolista Defensa 6 Derecha 7)
-- busca (Encolada(Velocista 4)(Encolada(Ajedrecista)(Encolada(Futbolista Defensa 5 Izquierda 5)(Encolada(Futbolista Defensa 6 Derecha 7)(VaciaC))))) Defensa
-- Just (Futbolista Defensa 5 Izquierda 5)

-- Ejercicio 7b)

-- Cola se parece a una lista de tipos

-- Ejercicio 8a)

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving Show

type Guiatelefonica = ListaAsoc String String 

-- Ejercicio 8b)

-- 1)

la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo a b l) = 2 + la_long(l)

-- la_long Vacia
-- 0
-- la_long (Nodo(1)(2)(Nodo(4)(5)(Nodo(6)(9)(Vacia))))
-- 6

-- 2)

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia x = x
la_concat (Nodo a b x) x' = (Nodo a b (la_concat x x'))

-- la_concat (Nodo 1 2 Vacia) (Vacia)
-- 1 2 Vacia
-- la_concat Vacia (Nodo 1 2 Vacia)
-- Nodo 1 2 Vacia
-- la_concat (Nodo 3 5 Vacia) (Nodo 1 2 Vacia)
-- Nodo 3 5 (Nodo 1 2 Vacia)

-- 3)

la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia a b = Nodo a b Vacia
la_agregar (Nodo a b lista) a' b' = case a of
                                a | a == a' -> Nodo a' b' lista
                                a | not (a == a') -> Nodo a b (la_agregar lista a' b')

-- la_agregar (Nodo 1 2 (Nodo 3 6 (Nodo 5 7 Vacia))) 1 3
-- Nodo 1 3 (Nodo 3 6 (Nodo 5 7 Vacia))
-- la_agregar (Nodo 1 2 (Nodo 3 6 (Nodo 5 7 Vacia))) 40 8
-- Nodo 1 2 (Nodo 3 6 (Nodo 5 7 (Nodo 40 8 Vacia)))

-- 4)

la_pares :: ListaAsoc a b -> [(a,b)]
la_pares Vacia = []
la_pares (Nodo a b lista) = [(a,b)]++(la_pares (lista))

-- la_pares (Nodo 1 2 (Nodo 3 4 (Nodo 5 6 Vacia)))
-- [(1,2),(3,4),(5,6)]

-- 5)

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia x = Nothing
la_busca (Nodo a b lista) x = case a of
                        a | a == x -> Just b 
                        a | not (a == x) -> la_busca lista x    

-- la_busca (Nodo 1 2 (Nodo 3 4 (Nodo 5 6 Vacia))) 1
-- Just 2
-- la_busca (Nodo 1 2 (Nodo 3 4 (Nodo 5 6 Vacia))) 3
-- Just 4
-- la_busca (Nodo 1 2 (Nodo 3 4 (Nodo 5 6 Vacia))) 5
-- Just 6
-- la_busca (Nodo 1 2 (Nodo 3 4 (Nodo 5 6 Vacia))) 2
-- Nothing

-- 6)

la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar x Vacia = Vacia
la_borrar x (Nodo a b lista) = case a of
                           a | a == x -> la_borrar x lista
                           a | not (a == x) -> Nodo a b (la_borrar x lista)

-- la_borrar 1  (Nodo 1 2 (Nodo 3 4 (Nodo 5 6 Vacia)))
-- Nodo 3 4 (Nodo 5 6 Vacia)
-- la_borrar 3  (Nodo 1 2 (Nodo 3 4 (Nodo 5 6 Vacia)))
-- Nodo 1 2 (Nodo 5 6 Vacia)
-- la_borrar 5  (Nodo 1 2 (Nodo 3 4 (Nodo 5 6 Vacia)))
-- Nodo 1 2 (Nodo 3 4 Vacia) 

-- Ejercicio 9)

-- a)

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a) deriving Show

a_long :: Arbol a -> Int 
a_long Hoja = 0
a_long (Rama ar1 a ar2) = 1 + a_long ar2 + a_long ar2

-- a_long (Rama (Rama (Rama(Hoja)("rio")(Hoja))("a")(Rama(Hoja)("s")(Hoja)))("Can")(Rama(Rama(Hoja)("ar")(Hoja))("t")(Rama(Hoja)("o")(Hoja))))
-- 7

-- b)

a_hojas :: Arbol a -> Int 
a_hojas Hoja = 1
a_hojas (Rama ar1 a ar2) = 0 + a_hojas ar2 + a_hojas ar2

-- a_hojas (Rama (Rama (Rama(Hoja)("rio")(Hoja))("a")(Rama(Hoja)("s")(Hoja)))("Can")(Rama(Rama(Hoja)("ar")(Hoja))("t")(Rama(Hoja)("o")(Hoja))))
-- 8

-- c) 

a_inc :: Num a => Arbol a -> Arbol a
a_inc Hoja = Hoja 
a_inc (Rama ar1 a ar2) = Rama (a_inc ar1) (a+1) (a_inc ar2)

-- a_inc (Rama (Rama Hoja 3 Hoja) 1 (Rama Hoja 6 Hoja))
-- Rama (Rama Hoja 4 Hoja) 2 (Rama Hoja 7 Hoja)

-- d)

a_map :: (a -> b) -> Arbol a -> Arbol b
a_map f Hoja = Hoja
a_map f (Rama ar1 a ar2) = Rama (a_map f ar1) (f a) (a_map f ar2)

-- a_map (not) (Rama(Rama(Hoja)(True)(Hoja))(True)(Rama(Hoja)(True)(Hoja)))
-- Rama (Rama Hoja False Hoja) False (Rama Hoja False Hoja)

-- Ejercicio 10)

-- a)

data ABB a = VacioABB | RamaABB (ABB a) a (ABB a) deriving Show

-- b)

insertar :: Ord a => a -> ABB a -> ABB a 
insertar x VacioABB = RamaABB (VacioABB) x (VacioABB)
insertar x (RamaABB ar1 a ar2) | (x<a) = (RamaABB (insertar x ar1) a ar2)
                               | otherwise = (RamaABB ar1 a (insertar x ar2))

-- insertar 11 (RamaABB (RamaABB(RamaABB(VacioABB)(1)(VacioABB))(3)(RamaABB(VacioABB)(4)(VacioABB)))(5)(RamaABB(VacioABB)(8)(RamaABB(VacioABB)(10)(VacioABB))))
-- RamaABB (RamaABB (RamaABB VacioABB 1 VacioABB) 3 (RamaABB VacioABB 4 VacioABB)) 5 (RamaABB VacioABB 8 (RamaABB VacioABB 10 (RamaABB VacioABB 11 VacioABB)))

-- c)

buscarEnArbol :: Eq a => a -> ABB a -> Bool
buscarEnArbol x VacioABB = False
buscarEnArbol x (RamaABB ar1 a ar2) = case x of
                                 x | (x==a) -> True 
                                 x | not(x==a) -> (buscarEnArbol x ar1) || (buscarEnArbol x ar2)

-- buscarEnArbol 11 (RamaABB (RamaABB(RamaABB(VacioABB)(1)(VacioABB))(3)(VacioABB))(6)(RamaABB(VacioABB)(10)(RamaABB(VacioABB)(11)(VacioABB))))
-- True

-- d) 

-- Auxiliares

mayor :: Ord a => a -> ABB a -> Bool
mayor x VacioABB = True
mayor x (RamaABB ar1 a ar2) = case x of
                          x | (x >= a) && (mayor x ar1) && (mayor x ar2) -> True 
                          x | otherwise -> False
                          
menor :: Ord a => a -> ABB a -> Bool
menor x VacioABB = True
menor x (RamaABB ar1 a ar2) = case x of
                          x | (x < a) && (menor x ar1) && (menor x ar2) -> True 
                          x | otherwise -> False

verificarABB :: Ord a => ABB a -> Bool
verificarABB (RamaABB ar1 a ar2) = (menor a ar2) && (mayor a ar1)
                 
ejemplo1 = RamaABB ( RamaABB VacioABB 10 VacioABB ) 2 ( RamaABB VacioABB 11 VacioABB )

ejemplo2 = RamaABB (RamaABB (RamaABB VacioABB 1 VacioABB) 3 (RamaABB VacioABB 7 VacioABB)) 5 (RamaABB VacioABB 8 (RamaABB VacioABB 10 VacioABB))

ejemplo3 = RamaABB (RamaABB VacioABB 3 VacioABB) 5 (RamaABB VacioABB 8 VacioABB)


-- verificarABB ejemplo1
-- False
-- verificarABB ejemplo2
-- False
-- verificarABB ejemplo3
-- True




















