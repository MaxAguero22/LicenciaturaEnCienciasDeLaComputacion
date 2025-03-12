#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#include "data.h"

void
print_data(data_t d) {
    printf("NOMBRE: %s\n"
           "EDAD  : %d años\n"
           "ALTURA: %d cm\n\n",
           d.name, d.age, d.height);
}

int main(void) {

    data_t messi = {"Leo Messiiiiii", 36, 169};
    print_data(messi);


    printf("name-size  : %lu bytes\n"
           "age-size   : %lu bytes\n"
           "height-size: %lu bytes\n"
           "data_t-size: %lu bytes\n", sizeof(messi.name), sizeof(messi.age), 
                                           sizeof(messi.height), sizeof(data_t));

    printf("La dirección de memoria apuntada por name es: %p\n", (void *) &messi.name);
    printf("La dirección de memoria apuntada por age es: %p\n", (void *) &messi.age);
    printf("La dirección de memoria apuntada por height es: %p\n", (void *) &messi.height);
    printf("La dirección de memoria apuntada por el struct messi es: %p\n", (void *) &messi);
    
    return EXIT_SUCCESS;
}

/* ¿La suma de los miembros coincide con el total? 
    No, pues la memoria se divide en segmentos de bytes, entonces puede ocurrir que
    nuestra estructura se encuentre en medio de dos "segmentos", por lo que al tomar
    el tamaño el compilador puede tirar una suma mayor a la esperada.

   ¿El tamaño del campo name depende del nombre que contiene?
    No, depende del tamaño maximo que tengamos para ese nombre, por ejemplo,
    char name_t [NAME_MAXSIZE]; si NAME_MAXSIZE es 30, el tamaño sera de 30bytes  

   ¿Hay algo raro en las direcciones de memoria?
    Pues las direcciones solo difieren de los ultimos 2 numeros menos significativos
    ya que la manera de segmentarse una estructura dentro de la memoria es un campo seguido del otro. 
*/












