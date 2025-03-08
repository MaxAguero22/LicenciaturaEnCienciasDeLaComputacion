#include <stdio.h>

int main(void)
{
   int x, y, z;
   
   printf("Ingrese un valor para x\n");
   scanf("%d",&x);
   printf("Ingrese un valor para y\n");
   scanf("%d",&y);
   printf("Ingrese un valor para z\n");
   scanf("%d",&z);
 

  printf("la expresion 1 es %d\n", (x + y + 1));
  printf("la expresion 2 es %d\n", (z * z + y * 45 - 15 * x));
  
  if (y - 2 == (x * 3 + 1) % 5) {
	printf("La expresion 3 es = True\n");
  	}
   	else {
   		printf("La expresion 3 es = False\n");
   	}
   	
  printf("La expresion 4 es = %d\n", (y / 2 * x));

   if (y < x * z) {
   	printf("La expresion 5 es = True\n");
   	}
   	else {
   		printf("La expresion 5 es = False\n");
   	}
}

/*

para estos estados (x→7, y→3, z→5) los resultados son:

la expresion 1 es 11
la expresion 2 es 55
La expresion 3 es = False
La expresion 4 es = 7
La expresion 5 es = True

y para estos (x→1, y→10, z→8) el resultado equivale a: 

la expresion 1 es 12
la expresion 2 es 499
La expresion 3 es = False
La expresion 4 es = 5
La expresion 5 es = False

¿En la ultima expresion, que tipo tiene el resultado en lenguaje “C”?

Es un tipo string

*/




