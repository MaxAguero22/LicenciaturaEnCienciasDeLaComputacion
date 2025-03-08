#include<stdio.h>

int pedir_enteros(void){

	int n;

	printf("ingrese un entero: ");
	scanf("%d",&n);

	return n;

}

void imprimir_enteros(int x){

	printf("El valor final es %d:\n ", x);

}

void alteracion(int x, int y, int z, int m){

	if(x < y){
	m = x;
	}
	else{
	m = y;
	}
	imprimir_enteros(x);
	imprimir_enteros(y);
	imprimir_enteros(z);
	imprimir_enteros(m);
	if(m < z){
	}
	else{
	m = z;
	}
	imprimir_enteros(x);
	imprimir_enteros(y);
	imprimir_enteros(z);
	imprimir_enteros(m);

}




int main(void){

int x, y, z, m;

x = pedir_enteros();
y = pedir_enteros();
z = pedir_enteros();
m = pedir_enteros();

printf("\n");

alteracion(x,y,z,m);

return 0;

}

/*
Esta nueva version posee la ventaja de ser un codigo mas intuitivo y legible
*/




