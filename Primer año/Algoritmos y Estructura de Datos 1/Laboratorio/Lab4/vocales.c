#include<stdio.h>
#include<stdbool.h>
#include<ctype.h>

char pedir_letra(void){
    char letra;
    printf("Ingrese una letra: \n");
    scanf("%c",&letra); 
    return letra;
}
bool es_vocal(char letra){
    bool x;
    char letraMinuscula = tolower(letra);
    char vocales[] = "aeiou";
    int i = 0;
    while(i != 5){
        if(vocales[i] == letraMinuscula){
            x = 1;
            break;
        }
        else{
            x = 0;
        }
        i = i + 1;
    }
    return x;
}
void imprimir_resultado(bool n, char letra){
    if(n == 1){
    printf("La letra ingresada %c es una vocal\n", letra);
    }
    else{
    printf("La letra ingresada %c no es una vocal\n", letra);
    }
}
int main (void){

bool x;
char letra;
letra = pedir_letra();
x = es_vocal(letra);
imprimir_resultado(x,letra);
return 0;
}
