#include <stdio.h>

int pedir_enteros(void){
	
	int n;
	printf("\nIngrese un valor: \n");
	scanf("%d", &n);
	return n;
}
void imprimir_estados(int i, int x, int y){

	printf("Ejecucion %d : (x = %d), (y = %d)\n", i, x, y);

}

int main()
{

int x, y;
int i = 1;

while (i != 4) {
	
	x = pedir_enteros();
	y = pedir_enteros();
	
	x = x + y;
	
	imprimir_estados(i,x,y);
	
	y = y + y;
	
	imprimir_estados(i,x,y);
	
	i = i + 1;
}

return 0;
}




/*
                - usuario ingresa un σ0 - produce una salida σ
1.b ejecucion 1    x -> 2, y -> 5       -   x -> 7, y -> 10
1.b ejecucion 2    x -> 1, y -> 2       -   x -> 3, y -> 4
1.b ejecucion 3    x -> 3, y -> 1       -   x -> 4, y -> 2


*/
