#include<stdio.h>
#include<stdbool.h>
#define N 5

typedef char clave_t;
typedef int valor_t;

typedef struct {
    clave_t clave;
    valor_t valor;
} asoc; 


void pedir_arreglo(int tam, asoc a[]){
    int i = 0;
    while(i < tam){
        printf("Posicion %d: Ingrese la clave y luego el valor\n",i+1);
        scanf("%s",&a[i].clave);
        scanf("%d",&a[i].valor);
        i = i + 1;
    }
}
clave_t pedir_clave(void){
    clave_t n;
    printf("Ingrese una clave:\n");
    scanf("%s",&n);

return n;
}
bool asoc_existe(int tam, asoc a[], clave_t c){
    bool x;
    int i = 0;
    while (i < tam){
        if(a[i].clave == c){
            x = 1;
            break;
        }
        else{
        i = i + 1;
        x = 0;
        }
    }
return x;
}
int main(void){
    clave_t c;
    asoc a[N];
    bool y;
    
    pedir_arreglo(N,a);
    c = pedir_clave();
    y = asoc_existe(N,a,c);
    if(y == 1){
    printf("true\n");
    }
    else{
    printf("false\n");
    }
return 0;
}















