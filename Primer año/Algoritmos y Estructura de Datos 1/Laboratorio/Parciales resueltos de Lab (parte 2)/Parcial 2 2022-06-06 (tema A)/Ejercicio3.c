#include<stdio.h>
#define N 5

struct paridad_t {
    int n_pares;
    int n_impares;
};
void pedir_arreglo(int a[], int tam){
    int i = 0;
    printf("Ingrese un arreglo de %d elementos\n",tam);
    while(i < tam){
    scanf("%d",&a[i]);
    i++;
    }
}
struct paridad_t contar_paridad(int a[], int tam){
    int i = 0;
    struct paridad_t result;
    result.n_pares = 0;
    result.n_impares = 0;
    while(i < tam){
        if(a[i] % 2 == 0){
        result.n_pares = result.n_pares + 1;
        }
        else{
        result.n_impares = result.n_impares + 1;
        }
    i++;
    }
return result;
}
void imprimir_struct(struct paridad_t result){
    printf("La cantidad de elementos pares es %d\nLa cantidad de elementos impares es %d\n",result.n_pares,result.n_impares);
}

int main(void){
    int a[N];
    pedir_arreglo(a,N);
    imprimir_struct(contar_paridad(a,N));    
    
return 0;
}
