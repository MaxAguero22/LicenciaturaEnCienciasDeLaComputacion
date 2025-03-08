#include<stdio.h>
#define N 5

struct cinco_t{
    int primero;
    int segundo;
    int tercero;
    int cuarto;
    int quinto;
};
void pedir_arreglo(int tam, int a[]){
    int i = 0;
    printf("Ingrese un arreglo de %d elementos\n",tam);
    while(i < tam){
    scanf("%d",&a[i]);
    i++;
    }
}
struct cinco_t cinco_pares(int a[], int tam){
    struct cinco_t pares;
    int i = 0;
    while(i < tam){
        if(!(a[i] % 2 == 0)){
            a[i] = (-1);
        }
    i++;
    }
    pares.primero = a[0];
    pares.segundo = a[1];
    pares.tercero = a[2];
    pares.cuarto = a[3];
    pares.quinto = a[4];

return pares;
}
void imprimir_struct(struct cinco_t pares){
    printf("El resultado es\nprimero = %d\nsegundo = %d\ntercero = %d\ncuarto = %d\nquinto = %d\n",pares.primero,pares.segundo,pares.tercero,pares.cuarto,pares.quinto);
}
int main(void){
    int a[N];
    pedir_arreglo(N,a);
    imprimir_struct(cinco_pares(a,N));   

return 0;
}
