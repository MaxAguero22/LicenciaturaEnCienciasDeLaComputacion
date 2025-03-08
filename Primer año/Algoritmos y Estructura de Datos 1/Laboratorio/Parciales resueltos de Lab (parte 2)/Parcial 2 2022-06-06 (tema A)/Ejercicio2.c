#include<stdio.h>
#include<assert.h>
#define N 5

int pedir_entero(char a){
    int n;
    printf("Ingrese un entero para el valor de la posicion %c\n",a);
    scanf("%d",&n);
    
return n;
}

void pedir_arreglo(int a[], int tam){
    int i = 0;
    printf("Ingrese un entero de %d elementos\n",tam);
    while(i < tam){
    scanf("%d",&a[i]);
    i++;
    }
}
int suma_mayores(int a[], int tam, int k){
    int i = 0;
    int res = 0;
    while(i < tam){
        if(a[i] > a[k]){
        res = res + a[i];
        }
        i++;
    }
return res;
}

int main(void){

    int a[N];
    int k;
    int res;
    pedir_arreglo(a,N);
    k = pedir_entero('k');
    assert(0 <= k && k < N);
    res = suma_mayores(a,N,k);
    printf("El resultado es %d\n",res);

return 0;
}
