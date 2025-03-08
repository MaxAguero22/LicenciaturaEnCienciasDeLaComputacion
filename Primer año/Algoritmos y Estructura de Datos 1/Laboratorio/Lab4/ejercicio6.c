#include<stdio.h>

void pedir_arreglo(int n_max, int a[]){
    int i = 0;
    while(i < n_max){
        printf("Ingrese el valor %d\n",i);
        scanf("%d",&a[i]);
        i = i + 1;
    }
}
void imprimir_arreglo(int n_max, int a[]){
    int i = 0;
    while(i < n_max){
        printf("El valor de la posicion %d es %d\n", i, a[i]);
        i = i + 1;
    }
}
int main(void){

int n_max = 5;
int a[n_max];
pedir_arreglo(n_max, a); 
imprimir_arreglo(n_max, a);
return 0;
}
