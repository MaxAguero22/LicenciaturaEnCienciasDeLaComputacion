#include<stdio.h>
#define N 5

struct persona {
    int dni;
    float altura;
};

struct alturas_t {
    int n_altos;
    int n_bajos;
};

float pedir_flotante(void){
    float n;
    printf("Ingrese un decimal\n");
    scanf("%f",&n);
    
return n;
}

void pedir_arreglo(struct persona a[], int tam){
    int i = 0;
    printf("Ingrese un arreglo de %d personas\n",tam);
    while(i < tam){
        printf("DNI: ");
        scanf("%d",&a[i].dni);
        printf("Altura: ");
        scanf("%f",&a[i].altura);
        i++;
    }
}

struct alturas_t contar_altos_y_bajos(struct persona a[], int tam, float alt){
    int i = 0;
    struct alturas_t result;
    result.n_bajos = 0;
    result.n_altos = 0;
    while(i < tam){
        if(a[i].altura < alt){
            result.n_bajos = result.n_bajos + 1;
        }
        else{
            result.n_altos = result.n_altos + 1;
        }
    i++;
    }
return result;
}

int main(void){
    struct alturas_t resultado;
    float alt;
    struct persona a[N];
    alt = pedir_flotante();
    pedir_arreglo(a,N);
    resultado = contar_altos_y_bajos(a,N,alt);
    printf("La cantidad de personas mas altas que %fcm son %d, y las mas bajas son %d\n",alt,resultado.n_altos,resultado.n_bajos);
    
return 0;
}
