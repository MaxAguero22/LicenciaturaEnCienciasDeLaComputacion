#include<stdio.h>

typedef struct{
    float menores;
    float iguales;
    float mayores;
} comp_t;

int pedir_entero(void){
    int n;
    printf("Ingrese un entero:\n");
    scanf("%d",&n);
    return n;
}
void pedir_arreglo(int tam, int a[]){
    int i = 0;
    printf("Ingrese un arreglo de %d elementos\n",tam);
    while(i < tam){
    scanf("%d",&a[i]);
    i = i + 1;
    }
}
comp_t cuantos(int tam, int a[], int elem){
    comp_t terna;
    int i = 0;
    terna.iguales = 0;
    terna.mayores = 0;
    terna.menores = 0;
    while(i < tam){
        if(a[i] == elem){
            terna.iguales = terna.iguales + 1;
        }
        else if(a[i] < elem){
            terna.menores = terna.menores + 1;
        }
        else if(a[i] > elem){
            terna.mayores = terna.mayores + 1;
        }
        i = i + 1;
    }
return terna;
}
void imprime_terna(comp_t terna){
printf("Elementos menores: %f\nElementos mayores: %f\nElementos iguales: %f\n",
terna.menores,terna.mayores,terna.iguales);
}

int main(void){
int tam;
int elem;
printf("Ingrese un entero positivo para el tamaño de un arreglo\n");
scanf("%d",&tam);
int a[tam];

pedir_arreglo(tam,a);
elem = pedir_entero();
imprime_terna(cuantos(tam,a,elem));

return 0;
}
