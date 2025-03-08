--Ejercicio 1)
--a)1)
--b)4)
--c)4
--d)4



data Dispositivo = Televisor PulgadasTele TipoPantalla Precio | HomeTheater Potencia TipoDeSalida Precio

data PulgadasTele = TreintayDos | Cuarenta | Setenta
data TipoPantalla = QLED | OLED
type Precio = Int 

type Potencia = Int 
data TipoDeSalida = Mono | Estereo | CincoPUno


instance Eq TipoPantalla
   where
         QLED == QLED = True
         OLED == OLED = True


instance Eq Dispositivo
  where
        (Televisor TreintayDos tp1 pr1) == (Televisor TreintayDos tp2 pr2) = (tp1 == tp2)
        (Televisor TreintayDos tp1 pr1) == (Televisor Cuarenta tp2 pr2) = False
        (Televisor TreintayDos tp1 pr1) == (Televisor Setenta tp2 pr2) = False
        (Televisor Cuarenta tp1 pr1) == (Televisor Cuarenta tp2 pr2) = (tp1 == tp2)
        (Televisor Cuarenta tp1 pr1) == (Televisor TreintayDos tp2 pr2) = False
        (Televisor Cuarenta tp1 pr1) == (Televisor Setenta tp2 pr2) = False
        (Televisor Setenta tp1 pr1) == (Televisor Setenta tp2 pr2) = (tp1 == tp2)
        (Televisor Setenta tp1 pr1) == (Televisor TreintayDos tp2 pr2) = False
        (Televisor Setenta tp1 pr1) == (Televisor Cuarenta tp2 pr2) = False
        (HomeTheater pt1 ts1 pr1) == (HomeTheater pt2 ts2 pr2) = (pt1 == pt2)

--ghci> (HomeTheater 12 Mono 67) == (HomeTheater 12 Estereo 56)
--True
--ghci> (Televisor TreintayDos QLED 13) == (Televisor TreintayDos QLED 56)
--True

cuantosTelevisores :: [Dispositivo] -> TipoPantalla -> Int
cuantosTelevisores [] t = 0
cuantosTelevisores ((Televisor p OLED usd):ld) OLED = 1 + cuantosTelevisores ld OLED
cuantosTelevisores ((Televisor p QLED usd):ld) QLED = 1 + cuantosTelevisores ld QLED
cuantosTelevisores (_:ld) t = cuantosTelevisores ld t

--ghci> cuantosTelevisores [(Televisor Cuarenta OLED 2),(Televisor Setenta OLED 5),(Televisor TreintayDos OLED 2)] OLED
--3

noHayDosIguales :: [Dispositivo] -> Bool
noHayDosIguales [] = False
noHayDosIguales (y:x:ld) = case y of
                           y | (y==x) -> True
                           y | not(y==x) -> noHayDosIguales ld

--ghci> noHayDosIguales [(Televisor Cuarenta OLED 500),(Televisor Setenta QLED 600),(HomeTheater 23 Mono 600),(HomeTheater 23 Estereo 70)]
--True
--ghci> noHayDosIguales [(Televisor Setenta QLED 500),(Televisor Setenta QLED 600),(HomeTheater 19 Mono 600),(HomeTheater 23 Estereo 70)]
--True

--Ejercicio3)

data NotasDelCuatri = NoHayMasNotas | NotasDelAlumno NombreApellido PrimerParcial SegundoParcial Recuperatorio NotasDelCuatri

type NombreApellido = String
type PrimerParcial = Int
type SegundoParcial = Int
type Recuperatorio = Int

data Condicion = Regular | Libre | Promocional 

esLibreAlumno :: NotasDelCuatri -> String -> Bool
esLibreAlumno NoHayMasNotas alumno = False
esLibreAlumno (NotasDelAlumno nombre p1 p2 r1 lista) alumno = case nombre of
                                                     nombre | (alumno == nombre) -> ((p1 < 6) && (p2 < 6)) || ((p1 >= 6) && (r1 < 6)) || ((p2 >= 6) && (r1 < 6))
                                                     nombre | not (alumno == nombre) -> esLibreAlumno lista alumno

--ghci> esLibreAlumno (NotasDelAlumno ("Pablo")(8)(6)(7)(NotasDelAlumno ("Jorge")(1)(7)(9)(NotasDelAlumno ("Pedro")(1)(7)(9)(NoHayMasNotas)))) "Jorge"
--False

devolverPromedio :: NotasDelCuatri -> String -> Maybe Int
devolverPromedio NoHayMasNotas alumno = Nothing
devolverPromedio (NotasDelAlumno nombre p1 p2 r1 lista) alumno = case nombre of
                                                        nombre | (nombre == alumno) && (c1) -> Just n1
                                                        nombre | (nombre == alumno) && (c2) -> Just n2
                                                        nombre | (nombre == alumno) && (c3) -> Just n3
                                                        nombre | not(nombre == alumno) -> devolverPromedio lista alumno
                                                        
                                                        where c1 = (p1 >= 6) && (p2 >= 6)
                                                              c2 = (p2 >= 6) && (p1 < 6) && (r1 >= 6)
                                                              c3 = (p2 < 6) && (p1 >= 6) && (r1 >= 6)
                                                              n1 = (div (p1 + p2) 2)
                                                              n2 = (div (p2 + r1) 2)
                                                              n3 = (div (p1 + r1) 2)