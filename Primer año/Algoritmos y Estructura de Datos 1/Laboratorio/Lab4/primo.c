#include<stdio.h>
#include<stdbool.h>

int pedir_entero(void){
    int n;
    printf("Ingrese un entero positivo\n");
    scanf("%d",&n);
    return n;
}
bool es_primo(int n)
{
    bool x;
    int i = 1;
    int c = 0;
    while(i <= n)
    {
        if(n % i == 0)
        {
            c++;
        }
    i++;
    }
    if(c == 2)
    {
        x = 1;
    }
    else
    {
        x = 0;
    }
    return x;
}
int nesimo_primo(int N){
    int i = 2;
    int nesimo;
    while(0 < N)
    {
    if(es_primo(i))
    {
        nesimo = i;
        N = N - 1;
    }
        i = i + 1;
    }
return nesimo;
}


int main(void){

    int x;
    x = pedir_entero();
    while(x < 0){
    printf("Error, valor negativo\n");
    x = pedir_entero();
    }
    printf("El numero primo %d es: %d\n",x,nesimo_primo(x));

return 0;
}

