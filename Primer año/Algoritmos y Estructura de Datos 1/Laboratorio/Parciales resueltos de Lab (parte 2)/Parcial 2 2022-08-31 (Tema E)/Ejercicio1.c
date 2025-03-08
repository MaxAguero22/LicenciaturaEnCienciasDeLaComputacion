#include<stdio.h>
#include<stdbool.h>
#include<assert.h>

int pedir_entero(){
    int n;
    printf("Ingrese un entero:\n");
    scanf("%d",&n);
    return n;
}
bool pedir_booleano(){
    int x;
    bool n;
    printf("Ingrese un booleano 1 para true, 0 para false\n");
    scanf("%d",&x);
    n = x;
    return n;
} 
void imprimir_booleano(bool x){
    printf("El resultado final es %d\n",x);
}
void imprimir_entero(int x){
    printf("El resultado final es %d\n",x);
}

int main(void){
    int x;
    int xaux;
    int y;
    int yaux;
    bool z;
    int X;
    int Y;
    bool Z;
    x = pedir_entero();
    y = pedir_entero();
    z = pedir_booleano();
    X = x;
    Y = y;
    Z = z;
    assert(x == X && y == Y && z == Z && X > 0);
    xaux = x;
    yaux = y;
    x = x*x + y*y;
    y = xaux + y;
    z = xaux > yaux;
    assert(x == X*X + Y*Y && y == X + Y && (z == (X > Y)));
    imprimir_entero(x);
    imprimir_entero(y);
    imprimir_booleano(z);
    
return 0;
}
