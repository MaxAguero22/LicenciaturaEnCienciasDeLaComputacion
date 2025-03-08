#include<stdio.h>

int pedir_entero(void){
    int n;
    printf("Ingrese un entero positivo (posicion):\n");
    scanf("%d",&n);
    return n;
}
void pedir_arreglo(int a[], int tam){
    int n = 0;
    printf("Ingrese un arreglo de %d elementos\n",tam);
    while(n < tam){
        scanf("%d",&a[n]);
        n = n + 1;
    }
}
void intercambiar(int tam, int a[], int i, int j){
    int x;
    int n = 0;
    x = a[i];
    a[i] = a[j];
    a[j] = x;
    while(n < tam){
        printf("Posicion %d: %d\n",n,a[n]);
        n = n + 1;
    }
}
int main(void){
    int tam = 5;
    int a[tam];
    int i,j;
    i = pedir_entero();
    j = pedir_entero();
    if (j < tam && i < tam && j >= 0 && i >= 0){
        pedir_arreglo(a,tam);
        intercambiar(tam,a,i,j);
    }
    else{
        printf("La posicion ingresada no pertenece al rango\n");
    }
    return 0;
}

