/*
Especificacion:

Var  r, x, y : Int;
{ x = A ∧ y = B }
    S
{ r == B || r == A }

Derivacion

r,x,y:=E,F,Z
asumimos P : x = A ^ y = B
wp.(r,x,y:=E,F,Z).(r == B || r == A)
={ def de wp
E == B || E == A



*/


#include <stdio.h>
#include <assert.h>

int pedir_entero(void){
    
    int n;
    printf("Ingrese un valor:\n");
    scanf("%d",&n);
    return n;
    
}

void pedir_minimo(int x, int y){
    int a,b,r;
    A = x;
    B = y;
    assert((A == x)&&(B == y));
    if (A < B){
        
        r = A;
        printf("el minimo es %d: ", r);
        
    }
    else {
        
        r = B;
        printf("el minimo es %d: ", r);
    
    }
    
    assert(r == A || r == B);
} 

int main()
{
    int x,y;
    
    x = pedir_entero();
    y = pedir_entero();
   
    pedir_minimo(x,y);
    
    return 0;
}
