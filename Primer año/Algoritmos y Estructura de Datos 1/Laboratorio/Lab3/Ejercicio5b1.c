#include<stdio.h>

int pedir_enteros(void){

int n;
printf("Ingrese el entero requerido: \n");
scanf("%d",&n);
return n;

}

void imprimir_iteracion(int i, int x, int y){

printf("Iteracion %d : x = %d, y = %d, i = %d\n", i, x, y, i);

}

int main(void){

int x, y, i;

x = pedir_enteros();
y = pedir_enteros();
i = pedir_enteros();

i = 0;

while(x >= y){

x = x - y;
i = i + 1;

imprimir_iteracion(i,x,y);

}
}

/* 
Iteracion 1 : x = 10, y = 3, i = 1
Iteracion 2 : x = 7, y = 3, i = 2
Iteracion 3 : x = 4, y = 3, i = 3
Iteracion 4 : x = 1, y = 3, i = 4
*/




