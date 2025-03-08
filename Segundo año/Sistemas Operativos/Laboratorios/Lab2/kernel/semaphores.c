#include "types.h"
#include "param.h"
#include "riscv.h"
#include "spinlock.h"
#include "defs.h"


#define MAX_SIZE 251
#define SUCCESS 1
#define FAILURE 0
#define CLOSE_SEMAPHORE -1

struct sem_t {
    int sem_value; 
    struct spinlock mutex; // mutex: vale 0 si esta libre, 1 si esta bloqueado
};

struct sem_t semaphores[MAX_SIZE]; 
// ls id del semaforo esta representado por la posicion del arreglo

int
sem_get(int value)
{
    int i = 0;
    while(i < MAX_SIZE){
        if(sem_open(i, value)){return i;}
        i++;
    }
    printf("No hay semaforos disponibles\n");
    return CLOSE_SEMAPHORE;
}
//Devuelve el valor de semaphores[i].sem_value correspondiente al minimo semaforo disponible

void 
init_sem()
{
	for(unsigned int i = 0; i < MAX_SIZE; i++)
	{
		semaphores[i].sem_value = CLOSE_SEMAPHORE;
		initlock(&(semaphores[i].mutex),"MUTEX");
	}
}
// Es una funcion que inicializa todos los semaforos, el -1 representa que estan cerrados.
// De esta manera podemos manejar errores, como por ejemplo que se intente abrir un semaforo que ya esta abierto y que esta ocupado.

int
sem_open(int sem, int value)
{
	if(sem > MAX_SIZE || sem < 0){printf("Error, semaforo invalido\n");return FAILURE;}
	
	int ret = 0;
	acquire(&semaphores[sem].mutex);
	
	if(semaphores[sem].sem_value == CLOSE_SEMAPHORE)
	{
		(semaphores[sem].sem_value) = value;
		ret = 1;
	}
	
//	printf("Intentaste abrir un semaforo que ya se encontraba abierto.\n");
	release(&semaphores[sem].mutex);
	
	return ret;
}
// si retorna 0 el sem_open quiere decir que ese semaforo ya estaba abierto, por lo tanto no podemos actualizar su valor.
// si retorna 1 el sem_open es que el semaforo estaba cerrado y se actualizo su sem_value.

int
sem_close(int sem)
{
   // if(sem > MAX_SIZE || sem < 0){printf("Error, semaforo invalido\n");return 0;}

    return (sem > MAX_SIZE || sem < 0) ? (printf("Error, semaforo invalido\n"),FAILURE):SUCCESS;

    // Adquiere el mutex
    acquire(&semaphores[sem].mutex);

    semaphores[sem].sem_value = CLOSE_SEMAPHORE;

    // Libera el mutex
    release(&semaphores[sem].mutex);
    return SUCCESS;
}

int
sem_up(int sem)
{
    acquire(&semaphores[sem].mutex);

    if(semaphores[sem].sem_value == CLOSE_SEMAPHORE) {printf("Error, se intento incrementar un semaforo cerrado\n");
	release(&semaphores[sem].mutex);
        return FAILURE;
    }

    if (semaphores[sem].sem_value == 0) {
        wakeup(&semaphores[sem]);
    }
    semaphores[sem].sem_value++;
    
    release(&semaphores[sem].mutex);

    return SUCCESS;

}

int 
sem_down(int sem)
{

    acquire(&semaphores[sem].mutex);
    
    if(semaphores[sem].sem_value == CLOSE_SEMAPHORE){
        printf("Error, se intento decrementar un semaforo cerrado\n");
        release(&semaphores[sem].mutex);
	return FAILURE;
    }


        while(semaphores[sem].sem_value == 0) {     /*Bloqueado*/
            /*sleep libera el mutex*/
            sleep(&semaphores[sem], &semaphores[sem].mutex);           
        }
        semaphores[sem].sem_value--;

    /*Libera el mutex*/
    release(&semaphores[sem].mutex);
    
    return SUCCESS;
}
// Decrementa el semáforo ”sem” bloqueando los procesos
// Cuando su valor es 0. 
// El valor del semaforo nunca puede ser menor a 0
