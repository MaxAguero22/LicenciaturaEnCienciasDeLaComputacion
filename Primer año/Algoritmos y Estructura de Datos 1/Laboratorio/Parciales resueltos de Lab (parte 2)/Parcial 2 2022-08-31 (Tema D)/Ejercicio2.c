#include<stdio.h>
#define N 5
#include<assert.h>

int pedir_entero(char a){
    int n;
    printf("Ingrese un entero para el valor de %c\n",a);
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
int multiplica_multiplos(int a[], int tam, int k){
    int i = 0;
    int result = 1;
    while(i < tam){
        if(a[i] % k == 0){
            result = result * a[i]; 
        }
        i++;
    }
return result;
}

int main(void){
    int k;
    int a[N];
    int result = 0; 
    k = pedir_entero('k');
    assert(k != 0);
    pedir_arreglo(a,N);
    result = multiplica_multiplos(a,N,k);
    printf("El resultado es %d\n",result);

return 0;
}
