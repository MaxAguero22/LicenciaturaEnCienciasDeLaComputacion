### Laboratorio 2 Sistemas Operativos: Semaforos#

En este laboratorio se implemento un sistema de Semáforos para espacio de usuario,que sirven como mecanismo de sincronización entre procesos. 
Se implementaro en la versión RISC-V de XV6 (sistema operativo con fines académicos) en espacio de kernel y provee syscalls accesibles desde espacio de usuario.
Como los semáforos vienen en varios estilos, en este laboratorio se implemento sólo un estilo de semáforos llamado semáforos nombrados inspirándose en los
semáforos nombrados que define POSIX.

## Características de los semáforos nombrados:
---
● Son administrados por el kernel.
● Están disponibles globalmente para todos los procesos del sistema operativo
(i.e. no hay semáforos "privados").
● Su estado se preserva mientras el SO esté activo (i.e., se pierden entre reinicios).
● Cada semáforo tiene un "nombre" que lo identifica con el kernel, en nuestro caso
los nombres son números enteros entre 0 y un límite máximo (idea similar a los
file descriptors).

## Descripción

Este repositorio contiene la implementación de semáforos dentro de un proyecto que consta de múltiples archivos de código. La implementación de las funciones para manipular 
los semáforos en sí no fue el ls que mas costo, lo más complicado fue entender **cómo** y **dónde** deberían ser implementados los semáforos al tener que abrir y cerrar varios archivos de código.

## Dificultades Encontradas en la Organización del Código

El verdadero desafío fue revisar todos los archivos del proyecto para entender correctamente dónde se necesitaban los semáforos y cuales eran las funciones que debian cumplir
Tuvimos que explorar el flujo del programa y entender los puntos clave donde los semáforos debían actuar para sincronizar los recursos compartidos.

### Inicialización de Semáforos

Una vez que logramos implementar las cuatro funciones principales que manipulan los semáforos (`sem_open`, `sem_close`, `sem_up` y `sem_down`), pasamos un tiempo considerable decidiendo **dónde inicializar** 
el arreglo de semáforos utilizando `sem_init`. El objetivo era hacer que los semáforos fueran accesibles de forma global para evitar inicializarlos individualmente en cada archivo o función donde se usaran.
Despues de renegar un _buen_ rato, nos dimos cuenta que tenia que ser algo que se inicializaba en conjunto al Kernel. No podia ser algo que se fuera de parte del usuario. 

## Funciones Principales
Las principales funciones que gestionan los semáforos en este proyecto son:

- `sem_open`: Abre un semáforo.
- `sem_close`: Cierra un semáforo.
- `sem_up`: Incrementa el valor del semáforo.
- `sem_down`: Decrementa el valor del semáforo.

Cada una de estas funciones está diseñada para trabajar en conjunto y asegurar la correcta sincronización dentro del programa.

# Funcion particular en Semaphores.c
```int
sem_get()
{
    for(uint i = 0; i < MAX_SIZE; i++){
        if (semaphores[i].sem_value == -1){
           return i;
        }
    }
    printf("No hay semaforos disponibles");
    return -1;
}
```
Esta función, `sem_get()`, está diseñada para encontrar y devolver el índice del primer semáforo disponible en el arreglo de semáforos.

Recorre un arreglo de semáforos de tamaño MAX_SIZE.
Para cada semáforo en el arreglo, verifica si el valor de sem_value es -1. Un valor de -1 indica que el semáforo no está inicializado.
Si encuentra un semáforo con un sem_value de -1, devuelve el índice (i) de ese semáforo.
Si la función completa el ciclo sin encontrar un semáforo disponible, imprime el mensaje "No hay semáforos disponibles" y devuelve -1 para indicar que no se encontró ninguno.
En resumen, esta función verifica el primer semáforo disponible (indicado por un valor de -1) y devuelve su índice. 
Si no encuentra ninguno disponible, devuelve -1 como señal de error.

Esta funcion la usamos para poder encontrar el primer semaforo disponible para abrir uno, si no hay devuelve el mensaje de error.


## Conclusión

El proceso de implementación fue más un ejercicio de navegación y organización de código que de escribir las funciones en sí. 
La bocha estaba en la importancia de comprender el flujo completo de la aplicación antes de decidir dónde y cómo integrar los semáforos.

¡Gracias por revisar nuestro trabajo!



