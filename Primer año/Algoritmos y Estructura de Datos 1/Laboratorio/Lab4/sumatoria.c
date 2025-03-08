#include<stdio.h>

void pedir_arreglo(int tam, int a[]){
    int i = 0;
    printf("Ingrese un arreglo de 5 elementos:\n");
    while(i < tam){
        scanf("%d",&a[i]);
        i = i + 1;
    }
}
int sumatoria(int tam, int a[]){
    int n = 0;
    int i = 0;
    while(i < tam){
    n = n + a[i];
    i = i + 1;
    }
    return n;
}

int main(void){
int tam = 5; 
int r = 0;
int a[tam];
pedir_arreglo(tam,a);
r = sumatoria(tam,a);
printf("La sumatoria del arrego el %d\n",r);

}
