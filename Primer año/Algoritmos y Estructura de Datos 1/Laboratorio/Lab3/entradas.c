#include<stdio.h>

int pedir_entero(char name[]){

int n;
printf("Ingresa un valor para %s: ", name);
scanf("%d",&n);
return n;

}

void imprimir_entero(int x, char name[]){

printf("El valor de la variable %s ingresado es: %d\n", name, x);

}

int main(void){

int x;
char name[] = "n";


x = pedir_entero(name);
imprimir_entero(x, name);

return 0;
}
