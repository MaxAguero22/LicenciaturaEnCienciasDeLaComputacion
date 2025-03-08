#include<stdio.h>
#include <stdbool.h>

int pedir_enteros(void){

int n;

printf("Ingrese el valor requerido: \n");
scanf("%d",&n);
return n;

}

bool pedir_booleanos(void){

int temp;
bool n;

printf("Ingrese el booleano requerido: \n");
scanf("%d",&temp);

n = temp;
return n;

} 

void imprimir_iteracion(int x, int i, bool res){

printf("Iteracion : x = %d, i = %d, res = %d\n", x, i, res);

}

int main(void){

int x, i;
bool res;

x = pedir_enteros();
i = pedir_enteros();
res = pedir_booleanos();

i = 2;
res = true;

while((i < x)&&(res)){

res = res && ((x % i) == 0);
i = i + 1;

imprimir_iteracion(x,i,res);

}
}

/* 
Iteracion 1 : x = 5, i = 3, res = 0

Con otros valores el programa resulta:

x -> 10, i -> 3, res -> true

Iteracion : x = 10, i = 3, res = 1
Iteracion : x = 10, i = 4, res = 0

*/
