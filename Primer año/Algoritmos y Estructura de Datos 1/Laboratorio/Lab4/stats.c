#include<stdio.h>
#define N 5
#include<limits.h>

typedef struct{
    float maximo;
    float minimo;
    float promedio;
}datos_t;

datos_t stats(int tam, float a[]){
    int i = 0;
    datos_t terna;
    terna.maximo = INT_MIN;
    terna.minimo = INT_MAX;
    terna.promedio = 0;
    while(i < tam){
    if(terna.maximo < a[i]){
        terna.maximo = a[i];
    }
    if(terna.minimo > a[i]){
        terna.minimo = a[i];
    }
    terna.promedio = terna.promedio + a[i];
    i = i + 1;
    }
    terna.promedio = terna.promedio / N;
return terna;
}
void imprimir_terna(datos_t terna){
    printf("El maximo es: %f\nEl minimo es: %f\nEl promedio es: %f\n",terna.maximo, terna.minimo, terna.promedio);
}

void pedir_arreglo(int tam, float a[]){
    int i = 0;
    printf("Ingrese un arreglo de %d elementos\n",tam);
    while(i < tam){
        scanf("%f",&a[i]);
        i = i + 1;
    }
}
int main(void){
    float a[N];
    pedir_arreglo(N,a);
    imprimir_terna(stats(N,a));
return 0;    
}

