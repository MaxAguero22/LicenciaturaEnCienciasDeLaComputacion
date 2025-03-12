#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#define ARRAY_SIZE 4

struct bound_data {
    bool is_upperbound;
    bool is_lowerbound;
    bool exists;
    unsigned int where;
};

struct bound_data check_bound(int value, int arr[], unsigned int lenght){
    unsigned int i = 0;
    struct bound_data res = {true, true, false, 0};
    while(i < lenght){
        
        if(value == arr[i]){
            res.exists = true;
            res.where = i; 
        } 
        
        if (value < arr[i]) {
            res.is_upperbound = false;
        }
        
        if (value > arr[i]) {
            res.is_lowerbound = false;
        }
        i = i + 1;
    }
return res;
}

// Funcion que pide un arreglo

void pedir_arreglo(int tam, int a[]){
    int i = 0;
    printf("Ingrese un arreglo de %d elementos\n", tam);
    while(i < tam){
        scanf("%d",&a[i]);
        i = i + 1;
    }
}

// Funcion que pide un entero

int pedir_entero(void){
    int n;
    printf("Ingrese un entero para verificar check_bound\n");
    scanf("%d",&n);

return n;
}

int main(void){
    int a[ARRAY_SIZE];
    int x;
    struct bound_data result;
    pedir_arreglo(ARRAY_SIZE,a);
    x = pedir_entero();
    result = check_bound(x,a,ARRAY_SIZE);
    if(result.exists == true){
        if(result.is_lowerbound == true){
            printf("El valor %d se encuentra en el arreglo en la posicion %u y es cota inferior\n",x,result.where);
        }
        else{
            printf("El valor %d se encuentra en el arreglo en la posicion %u y es cota maxima\n",x,result.where);
        }
    }
        else{
            printf("El valor %d no se encuentra en el arreglo\n",x);
        }
    
    
    return EXIT_SUCCESS;
}

