#include <stdio.h>

int pedir_enteros(void){

	int n;

	printf("ingrese un entero: ");
	scanf("%d",&n);

	return n;

}

void imprimir_enteros(int i, int x, int y){

	printf("Ejecucion %d : (x = %d), (y = %d) \n", i, x, y);
}

int main()
{

int x, y;
int i = 1;

while (i != 4) {
	
	x = pedir_enteros();
	y = pedir_enteros();
	
	y = y + y;
	
	imprimir_enteros(i,x,y);
	
	x = x + y;
	
	imprimir_enteros(i,x,y);
	
	i = i + 1;
}
}
/*
                - usuario ingresa un σ0 - produce una salida σ
1.c ejecucion 1       x-> 2, y-> 5      -    x-> 12, y -> 10
1.c ejecucion 2       x-> 1, y-> 2      -    x-> 5, y -> 4
1.c ejecucion 3       x-> 5, y-> 3      -    x-> 11, y -> 6


*/
