#include<stdio.h>
#include<assert.h>

int pedir_entero(void){
    int n;
    printf("Ingrese un entero\n");
    scanf("%d",&n);
    return n;
}
int main(void){
    int x;
    int y;
    int xaux;
    int X;
    int Y;
    x = pedir_entero();
    y = pedir_entero();
    X = x;
    Y = y;
    assert(x == X && y == Y);
    xaux = x;
    x = y;
    y = xaux;
    assert(x == Y && y == X);
    printf("Los valores finales son x = %d y y = %d\n",x,y);

return 0;
}
