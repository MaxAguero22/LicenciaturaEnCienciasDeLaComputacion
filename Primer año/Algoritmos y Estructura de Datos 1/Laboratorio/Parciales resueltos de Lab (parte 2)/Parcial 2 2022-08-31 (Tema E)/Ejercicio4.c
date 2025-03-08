#include<stdio.h>
#define N 5

struct producto_t {
    int precio;
    int peso_en_kilos;
};
struct total_t {
    int precio_total;
    int peso_total;
};

void pedir_arreglo(struct producto_t a[], int tam){
    int i = 0;
    printf("Ingresar precio y peso de %d productos\n",tam);
    while(i < tam){
        printf("Precio\n");
        scanf("%d",&a[i].precio);
        printf("Peso\n");
        scanf("%d",&a[i].peso_en_kilos);
        i++;
    }
}

struct total_t calcular_montos(struct producto_t a[], int tam){
    int i = 0;
    struct total_t total;
    total.precio_total = 0;
    total.peso_total = 0;
    while(i < tam){
        total.precio_total = total.precio_total + a[i].precio;
        total.peso_total = total.peso_total + a[i].peso_en_kilos;
    i++;
    }
return total;
}

int main(void){
    struct producto_t a[N];
    struct total_t total;
    pedir_arreglo(a,N);
    total = calcular_montos(a,N);
    printf("El total a pagar es $%d y el peso total es %dkg\n",total.precio_total, total.peso_total);
    
return 0;
}
