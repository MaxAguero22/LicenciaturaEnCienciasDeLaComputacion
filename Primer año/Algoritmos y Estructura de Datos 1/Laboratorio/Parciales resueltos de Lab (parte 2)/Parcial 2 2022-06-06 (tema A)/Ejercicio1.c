/* Ejercicio 1 */

#include<stdio.h>
#include<assert.h>
int pedir_entero(void){
    int n;
    printf("Ingrese un entero:\n");
    scanf("%d",&n);
    return n;
}
int main(void){

int s, r, S, R;
int raux;
s = pedir_entero();
r = pedir_entero();
S = s;
R = r;

assert(r == R && s == S && S > R); 

raux = r;
r = s - r;
s = raux + s;

assert( r == S - R && s == R + S);

printf("s = %d y r = %d",s,r);

return 0;
}
