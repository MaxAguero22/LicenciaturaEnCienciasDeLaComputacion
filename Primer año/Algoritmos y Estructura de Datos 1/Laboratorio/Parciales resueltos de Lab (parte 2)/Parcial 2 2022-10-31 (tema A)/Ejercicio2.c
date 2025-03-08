#include<stdio.h>
#include<assert.h>
#include<stdbool.h>
#define N 5

int pedir_entero(void){
    int n;
    printf("Ingrese un entero\n");
    scanf("%d",&n);
    return n;
}
void pedir_arreglo(int tam, int a[]){
    int i = 0;
    printf("Ingrese un arreglo de %d elementos\n",tam);
    while(i < tam){
    scanf("%d",&a[i]);
    i++;
    }
}
int cuantos_primos(int a[], int tam, int pos1, int pos2){
    int result = 0;
    while(pos1 <= pos2 && pos1 < tam){
        int i = 2;
        bool res = true;
        while(i < a[pos1] && res){
            res = res && !(a[pos1] % i == 0);
            i++;
        }
        if(res){
        result = result + 1;
        }
        pos1++;
    }
return result;
}

int main(void){
    int a[N];
    int pos1;
    int pos2;
    int result; 
    pos1 = pedir_entero();
    pos2 = pedir_entero();
    assert(pos1 >= 0 && pos1 < N && pos2 >= 0 && pos2 < N);
    assert(pos1 <= pos2);
    pedir_arreglo(N,a);
    result = cuantos_primos(a,N,pos1,pos2);
    printf("El resultado es %d: \n",result);

return 0;
}
