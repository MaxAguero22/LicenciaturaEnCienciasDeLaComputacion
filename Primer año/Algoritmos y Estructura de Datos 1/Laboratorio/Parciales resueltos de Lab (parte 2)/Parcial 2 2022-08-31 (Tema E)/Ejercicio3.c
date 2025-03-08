#include<stdio.h>
#include<assert.h>
#include<limits.h>
#include<stdbool.h>
#define N 5

struct minmult_t {
    int minimo;
    int indice;
};
void pedir_arreglo(int a[], int tam){
    int i = 0;
    printf("Ingrese un arreglo de %d elementos\n",tam);
    while(i < tam){
        scanf("%d",&a[i]);
        i++;
    }
}
int pedir_entero(){
    int n;
    printf("Ingrese un entero:\n");
    scanf("%d",&n);
    return n;
}
bool existe_multiplo(int m, int tam, int a[]){
    int i = 0;
    bool x = false;
    while(i < tam){
        if(a[i] % m == 0){
            x = true;
            i = i + 1;
        }
        else{
            x = x;
            i = i + 1;
        } 
    }
    return x;
}
struct minmult_t multiplo_minimo(int a[], int tam, int k){
    int i = 0;
    struct minmult_t par;
    par.minimo = INT_MAX;
    if(existe_multiplo(k,tam,a)){
         while(i < tam){
             if(a[i] % k == 0 && a[i] < par.minimo){
                 par.minimo = a[i];
                 par.indice = i;
             }
             i++;
         }
    }
    else{
        par.minimo = INT_MIN;
        par.indice = -1;
    }
    
return par;
}
int main(void){
    int a[N];
    int k;
    struct minmult_t par;
    pedir_arreglo(a,N);
    k = pedir_entero();
    par = multiplo_minimo(a,N,k);
    printf("El resultado es minimo = %d y indice = %d\n",par.minimo,par.indice);
    
return 0;
}

