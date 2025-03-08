#include <stdio.h>
#include <stdbool.h>

int pedir_enteros(){

int n;
printf("Ingrese un valor:\n");
scanf("%d",&n);

return n;
}

bool pedir_booleano(){

int temp;

printf("Ingrese un valor booleano:\n");
scanf("%d",&temp);

return temp;
}

void imprimir_expresion(int x, int y, int z, bool w, bool b){

printf("la expresion 1 es %d\n", (x % 4 == 0));
printf("la expresion 2 es %d\n", ((x + y == 0) && (y - x == (-1) * z)));
printf("la expresion 3 es %d\n", (!b && w));
}


int main(void)
{
   bool b, w;
   int x, y, z;
   
  x = pedir_enteros();
  y = pedir_enteros();
  z = pedir_enteros();
   
  b = pedir_booleano();
  w = pedir_booleano();
   
  imprimir_expresion(x,y,z,w,b);
   
}







/* 

el estado que cumple con los valores dados es:
 
x -> 4, y -> (-4), z -> 8, b -> 0, w -> 0
 
 */




