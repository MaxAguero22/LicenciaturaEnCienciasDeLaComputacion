#include<stdio.h>
#include<stdbool.h>
int pedir_enteros(void){
    int n;
    printf("Ingrese un entero:\n");
    scanf("%d",&n);
    return n;
}
void pedir_arreglo(int tam, int a[]){
    int i = 0;
    printf("Ingrese los valores de un arreglo de %d elementos:\n",tam);
    while(i < tam){
        scanf("%d",&a[i]);
        i = i + 1;
    }
}
bool todos_pares(int tam, int a[]){
    int i = 0;
    bool x = true;
    while(i < tam){
        if((a[i] % 2) == 0){
            x = x;
            i = i + 1;
            }
        else{
            x = 0;
            i = i + 1;
        }
    }
    return x;
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

int main(void){
bool x;
int tam = 5;
int a[tam];
int m,b;
pedir_arreglo(tam,a);
printf("¿Que funcion desea ejecutar?\nIngrese 1 para saber si los elementos del arreglos son todos pares.\n2 para saber si existe un multiplo de m en el arrego\n");
scanf("%d",&b);
if (b == 1){
    x = todos_pares(tam,a);
    if(x == 1){
        printf("true\n");
    }
    else{
        printf("false\n");
    }
}
else{
    m = pedir_enteros();
    x = existe_multiplo(m,tam,a);
    if(x == 1){
        printf("true\n");
    }
    else{
        printf("false\n");
    }
}
}

















































