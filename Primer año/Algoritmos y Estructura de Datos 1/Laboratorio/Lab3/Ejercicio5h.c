#include<stdio.h>

int pedir_entero(void){

int n;
printf("Ingrese 4 para el valor de i\n");
scanf("%d",&n);
return n;

}

void imprimir_estado(int i){

printf("i=%d\n",i);

}


int main(void){

int i;

i = pedir_entero();

while(i != 0){
printf("i=%d\n",i);
i = i - 1;

}

imprimir_estado(i);

}


