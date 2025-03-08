#include<stdio.h>
#include<limits.h>

typedef struct _persona {
    char *nombre;
    int edad;
    float altura;
    float peso;
} persona_t;

float peso_promedio(unsigned int longitud, persona_t arr[]){
    float peso = 0;
    unsigned int i = 0;
    while(i < longitud){
    peso = peso + arr[i].peso;
    i++;
    }
    peso = peso / longitud;
    return peso;
}
persona_t persona_de_mayor_edad(unsigned int longitud, persona_t arr[]){
    persona_t ashe;
    ashe.edad = INT_MIN;
    unsigned int i = 0;
    while(i < longitud){
        if(arr[i].edad > ashe.edad){
            ashe.edad = arr[i].edad;
            ashe.nombre = arr[i].nombre;
            ashe.peso = arr[i].peso;
            ashe.altura = arr[i].altura;
        }
        i++;
    }
    return ashe;
}
persona_t persona_de_menor_altura(unsigned int longitud, persona_t arr[]){
    persona_t ashe;
    ashe.altura = INT_MAX;
    unsigned int i = 0;
    while(i < longitud){
        if(arr[i].altura < ashe.altura){
             ashe.altura = arr[i].altura;
             ashe.edad = arr[i].edad;
             ashe.peso = arr[i].peso;
             ashe.nombre = arr[i].nombre;
        }
        i++;
    }
    return ashe;
}

int main(void) {
persona_t p1 = {.nombre="Paola", .edad=21, .altura=1.85, .peso=75};
persona_t p2 = {.nombre="Luis", .edad=54, .altura=1.75, .peso=69};
persona_t p3 = {.nombre="Julio", .edad=40, .altura=1.70, .peso=80};
unsigned int longitud = 3;
persona_t arr[] = {p1, p2, p3};
printf("El peso promedio es %f\n", peso_promedio(longitud, arr));
persona_t p = persona_de_mayor_edad(longitud, arr);
printf("El nombre de la persona con mayor edad es %s\n", p.nombre);
p = persona_de_menor_altura(longitud, arr);
printf("El nombre de la persona con menor altura es %s\n", p.nombre);
return 0;
}

