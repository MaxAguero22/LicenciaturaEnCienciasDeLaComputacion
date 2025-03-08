#include <stdlib.h>
#include <stdio.h>

void absolute(int x, int y) {
    if(x >= 0){
        y = x;
    }
    else{
        y = -x;
    }
}
void print(int res){
    printf("El resultado es : %d\n",res);
}

int main(void) {
    int a=0, res=0;
    a = -10;
    absolute(a,res);
    print(res);
    
    return EXIT_SUCCESS;
}

/* EL programa coincide con el lenguaje del teorico pero el valor que se muestra por pantalla es 0 */
