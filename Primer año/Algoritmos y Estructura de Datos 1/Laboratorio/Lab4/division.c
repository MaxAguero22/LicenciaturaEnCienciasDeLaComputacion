#include<stdio.h>
/* Definición de la estructura en C */

struct div_t {
    int cociente;
    int resto;
};

/* Funcion que toma dos enteros y retorna una estructura */

struct div_t division(int a, int b){
    int r, q;
    q = 0;
    r = a;
    while(b <= r){
    q = q + 1;
    r = r - b;
    }
    struct div_t res;
    res.cociente=q;
    res.resto = r;
    return res;
}
/* Funcion que imprime una estructura */
 
void imprime_par(struct div_t p){
  printf("El cociente es %d y el resto es %d\n",p.cociente, p.resto); 
}

/* Funcion que pide enteros */

int pedir_entero(void){
    int n;
    printf("Ingrese un entero no negativo: ");
    scanf("%d",&n);
    return n;
    }

int main(void){
int x, y;
x = pedir_entero();
y = pedir_entero();
if(y != 0){
    imprime_par(division(x,y));
}
else{
printf("Error, el divisor es nulo\n");
}
return 0;
}







































