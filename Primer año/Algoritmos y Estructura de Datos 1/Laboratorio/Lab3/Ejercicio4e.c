#include<stdio.h>

int pedir_enteros(void){

	int n;	
	printf("Ingrese el entero requerido: ");
	scanf("%d",&n);
	return n; 
}

void imprimir_estado(int x, int y){

printf("Estado final: (x = %d), (y = %d)\n", x, y);

}


int main(void){

int x, y;

x = pedir_enteros();
y = pedir_enteros();


	if (x >= y){
		x = 0;
		imprimir_estado(x,y);
}
	else{
		x = 2;
		imprimir_estado(x,y);
}
return 0;
}

