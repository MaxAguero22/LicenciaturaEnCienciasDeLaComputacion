/*---------------------------------------------------------------
{Pre: x = X, y = Y, z = Z}

z = x;
x = x + 1;
y = z + y;

{Post: x = X + 1, y = X + Y , z = X}
------------------------------------------------------------*/

#include<stdio.h>

int pedir_entero(char name[]){

    int n;
    printf("Ingrese un valor para %s: ", name);
    scanf("%d",&n);
    return n;
}

void intercambio(int x, int y, int z, char name[], char namee[]){

    z = x;
    x = x + 1;
    y = z + y;
    printf("Estado final: %s --> %d, %s --> %d", name,x,namee,y);
}

int main(void){

char name[] = "x";
char namee[] = "y";
int x, y, z;

z = 0;
x = pedir_entero(name);
y = pedir_entero(namee);
printf("Estados inicial: x --> %d, y --> %d\n", x,y);
intercambio(x,y,z,name,namee);

}

