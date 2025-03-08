#include <stdio.h>

int pedir_enteros(void){
	
	int n;
	printf("\ningrese un valor: \n");
	scanf("%d", &n);
	return n;
}

void imprimir_ejecucion(int i, int x){

	printf("Ejecucion %d : (x = %d) \n", i, x);
}





int main()
{

int x;
int i = 1;

while (i != 4) {
	
	
	x = pedir_enteros();
	x = 5;
	imprimir_ejecucion(i,x);
	i = i + 1;
}

return 0;
}



/*
                - usuario ingresa un σ0 - produce una salida σ
1.a ejecucion 1         x-> 1           -        x-> 5
1.a ejecucion 2         x-> 2           -        x-> 5
1.a ejecucion 3         x-> 3           -        x-> 5


*/
