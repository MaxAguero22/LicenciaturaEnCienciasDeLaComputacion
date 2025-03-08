#include<stdio.h>

int pedir_enteros(void){

	int n;
	printf("Ingrese el entero requerido: ");
	scanf("%d",&n);
	return n; 
}

void imprimir_estado(int x, int y, int z, int m){

printf("Estado final: (x = %d),(y = %d),(z = %d),(m = %d)\n", x,y,z,m);

}

int main(void){

  int x, y, z, m;

  x = pedir_enteros();
  y = pedir_enteros();
  z = pedir_enteros();
  m = pedir_enteros();

  if(x < y){
	m = x;
}
  else{
	m = y;
}
  if(m < z){
}
  else{
	m = z;
}

  imprimir_estado(x,y,z,m);

  return 0;
  
  
}

/* 

El programa asigna valores a la variable m dependiendo unas condiciones, el valor final de m es m=4 

σ1 = x→5 ,y→4 ,z→8 ,m→4
σ2 = x→5 ,y→4 ,z→8 ,m→4


*/ 


