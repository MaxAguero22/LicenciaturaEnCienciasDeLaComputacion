#include<stdio.h>
#include<assert.h>

int pedir_entero(void){
    
    int n;
    printf("ingrese un valor:\n");
    scanf("%d",&n);
    
    return n;
}

void hola_hasta(int n){

    while(n != 0){
        assert(n>0);
        printf("Hola\n");
        n = n - 1; 
    }
}

int main(void){

    int x;
    
    x = pedir_entero();
    assert(x>0);
    hola_hasta(x);

}
