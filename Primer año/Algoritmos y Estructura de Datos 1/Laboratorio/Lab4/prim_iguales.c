#include<stdio.h>
#define N 5
void pedir_arreglo(int tam, int a[]){
    int i = 0;
    printf("Ingrese un arreglo de %d elementos\n",tam);
    while(i < tam){
        scanf("%d",&a[i]);
        i = i + 1;
    }
}
int prim_iguales(int tam, int a[]){
    int i = 0;
    int result = 1;
    while(i < tam){
        if(a[i] == a[i+1]){
            result = result + 1;
        }
        else{
            break;
        }
        i = i + 1;
    }
    return result;
}
int main(void){
    int i = 0;
    int x;
    int a[N];
    pedir_arreglo(N,a);
    x = prim_iguales(N,a);
    printf("El tramo inicial mas largo es %d\n",x);

/*------------------------------Punto B------------------------------------------*/

    while(i < x){
    printf("%d\n",a[i]);
    i = i + 1;
    } 

return 0;
}
