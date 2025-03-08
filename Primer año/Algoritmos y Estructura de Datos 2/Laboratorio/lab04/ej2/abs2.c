#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

void absolute(int x, int *y) {
    if(x >= 0){
        *y = x;
    }
    else{
        *y = -x;
    }
}

void print(int res){
    printf("El resultado es : %d\n",res);
}


int main(void) {
    int a=0, res=0;
    a = -10;
    absolute(a,&res);
    print(res);
    assert(res >= 0 && (res == a || res == -a));
    return EXIT_SUCCESS;
}

/*
 El parametro int *y de absolute es de tipo out, solo se usa para escritura.
 
 Todos los parametros en las funciones de c son de tipo in, solo entrada, no se puede modificar.
*/
