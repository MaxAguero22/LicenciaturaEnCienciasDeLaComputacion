#include<stdio.h>
#include<stdbool.h>

bool pedir_booleano(char name[]){

int temp;
bool y;

printf("Ingresa un valor booleano para %s: ", name);
scanf("%d",&temp);
y = temp;
return y;

}

void imprimir_booleano(bool x, char name[]){

if (x==1) {
	printf("el valor de %s es Verdadero\n", name);
}
else{
	printf("el valor de %s es Falso\n", name);
}

}

int main(void){

bool x;
char name[] = "n";
 
x = pedir_booleano(name);
imprimir_booleano(x,name);


return 0;
}
