/*---------------------------------------------------------------
{Pre: x = X, y = Y, z = Z, a = A, b = B}

a = x;
b = y;
x = y;
y = y + a + z;
z = a + b;

{Post: x = Y, y = Y + X + Z, z = Y + X, a = X, b = Y}
------------------------------------------------------------*/
#include<stdio.h>

int pedir_entero(char name[]){

    int n;
    printf("Ingrese un valor para %s: ", name);
    scanf("%d",&n);
    return n;
}

void intercambio(int x, int y, int z, int a, int b, char name[], char namee[], char nameee[]){

    a = x;
    b = y;
    x = y;
    y = y + a + z;
    z = a + b;
    printf("Estado final: %s --> %d, %s --> %d, %s --> %d",name,x,namee,y,nameee,z);
}

int main(void){

char name[] = "x";
char namee[] = "y";
char nameee[] = "z";
int x, y, z, a, b;
a = 0;
b = 0;
x = pedir_entero(name);
y = pedir_entero(namee);
z = pedir_entero(nameee);
printf("Estados inicial: x --> %d, y --> %d, z --> %d\n", x,y,z);
intercambio(x,y,z,a,b,name,namee,nameee);

}

