#include<stdio.h>
#include<assert.h>

int pedir_entero(char a){
    int n;
    printf("Ingrese un entero para el valor de %c\n",a);
    scanf("%d",&n);
    
return n;
}
void imprimir_entero(int n){
    printf("El resultado final es %d\n",n);
}
int main(void){
    int x,y,z,X,Y,Z;
    x = pedir_entero('x');
    y = pedir_entero('y');
    z = pedir_entero('z');
    X = x; Y = y; Z = z;
    
    assert(x == X && y == Y && z == Z && (Y != 0) && (z > 0));
    
    x = Y * Z; y = X % Z; z = X / Y;
    
    assert(x == Y * Z && y == X % Z && z == X / Y);
    
    imprimir_entero(x);
    imprimir_entero(y);
    imprimir_entero(z);
    
return 0;
}
