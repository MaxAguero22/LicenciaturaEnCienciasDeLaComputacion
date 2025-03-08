#include<stdio.h>
int pedir_entero(void){

    int n;
    printf("Ingrese un entero: ");
    scanf("%d",&n);
    return n;
}
void gauss(int x, int r) {
    
    r = (x * (x + 1))/2;
    printf("La suma de 1 hasta %d resulta: %d\n", x, r);

}
void es_negativo(int x, int r){

    if(x < 0){
        printf("Error\n");
    }
    else{
    gauss(x,r);
    }
}

int main(void){

int x, r;
r = 0;

x = pedir_entero();
es_negativo(x,r);

return 0;
}
