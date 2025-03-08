#include<stdio.h>

int pedir_enteros(char name[]){

    int n;
    printf("Ingrese un entero para %s: ", name);
    scanf("%d",&n);
    return n;

}
void intercambio (int x, int y, int z, char name[], char namee[]){

    z = x;
    x = y;
    y = z;
    printf("El intercambio resulta %s = %d, %s = %d\n", name, x, namee, y);
    
}

int main(void){

char name[] = "x";
char namee[] = "y";
int x,y,z;

z = 0;
x = pedir_enteros(name);
y = pedir_enteros(namee);
printf("Los valores ingresados son x = %d, y = %d\n", x ,y);
intercambio(x,y,z,name,namee);

return 0;
}
