#include<stdio.h>
#define N 2
#include<limits.h>

struct persona_t{
    int dni;
    float altura;
};
struct stats_t {
    float altura_media;
    float altura_minima;
    float altura_maxima;
};
void pedir_arreglo(struct persona_t a[], int tam){
    int i = 0;
    while(i < tam){
    printf("DNI de la posicion %d: ",i);
    scanf("%d",&a[i].dni);
    printf("Altura de la posicion %d: ",i);
    scanf("%f",&a[i].altura);
    i++;
    }
}
struct stats_t calcular_estadisticas(struct persona_t a[], int tam){
    int i = 0;
    struct stats_t terna;
    terna.altura_media = 0;
    terna.altura_minima = INT_MAX;
    terna.altura_maxima = INT_MIN;
    while(i < tam){
        if(a[i].altura > terna.altura_maxima){
        terna.altura_maxima = a[i].altura;
        }
        if(a[i].altura < terna.altura_minima){
        terna.altura_minima = a[i].altura;
        }
        terna.altura_media = terna.altura_media + a[i].altura;
        i++;
    }
    terna.altura_media = terna.altura_media / tam; 
    
return terna;
}
void imprimir_struct(struct stats_t terna){
    printf("La altura minima es %f\nLa altura maxima es %f\nLa altura promedio es %f\n",terna.altura_minima,terna.altura_maxima,terna.altura_media);
}



int main(void){
    struct persona_t a[N];
    pedir_arreglo(a,N);
    imprimir_struct(calcular_estadisticas(a,N));    

return 0;
}


