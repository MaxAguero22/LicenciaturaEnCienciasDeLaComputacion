#include<stdio.h>
#define N 5
#include<limits.h>

struct paridad_t {
    int maximo_par;
    int minimo_impar;
};

void pedir_arreglo(int a[], int tam){
    int i = 0;
    printf("Ingrese un entero de %d elementos\n",tam);
    while(i < tam){
        scanf("%d",&a[i]);
        i++;
    }
}
struct paridad_t maxmin_paridad(int a[], int tam){
    int i = 0;
    struct paridad_t result;
    result.maximo_par = INT_MIN;
    result.minimo_impar = INT_MAX;
    while(i < tam){
        if(a[i] % 2 == 0 && a[i] > result.maximo_par){
            result.maximo_par = a[i]; 
        }
        else if(a[i] % 2 != 0 && a[i] < result.minimo_impar){
            result.minimo_impar = a[i];
        }
        i++;
    }
return result;
}
int main(void){
    struct paridad_t result;
    int a[N];
    pedir_arreglo(a,N);
    result = maxmin_paridad(a,N);
    printf("El maximo par es %d\nEl minimo impar es %d\n",result.maximo_par, result.minimo_impar);
    
return 0;
}
