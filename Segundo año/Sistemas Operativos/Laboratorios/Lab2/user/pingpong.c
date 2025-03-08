#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"

#define INVALID_SEMAPHORE -1 
#define EXPECTED_ARGC 2
#define SUCCESS 0
#define FAILURE 1
#define FORK_FAILURE -1
#define FORK_SUCCES 0

int
main(int argc, char const *argv[]) {
    
    if (argc != EXPECTED_ARGC) {fprintf(2, "ERROR: numero de argumentos invalido.\n");return FAILURE;}

    int length = atoi(argv[1]);

    if (length < 1) {fprintf(2, "ERROR: El numero de rounds tiene que ser mayor a 1.\n");return FAILURE;}

    //Inicializacion de semaforos y debugging
    int sem_child   = sem_get(0);
    int sem_parent  = sem_get(1);
    
    if (sem_child == INVALID_SEMAPHORE || sem_parent == INVALID_SEMAPHORE){fprintf(2, "ERROR: No hay semaforos disponibles.\n");return FAILURE;}



    int pid = fork();

    if (pid == FORK_FAILURE){ printf("Fork failure.");return FAILURE;} 

    if (pid == FORK_SUCCES) {


        for(uint i = 0; i < length; i++){
        sem_down(sem_child);
        printf("    Pong\n");
        sem_up(sem_parent);
        }

        return SUCCESS;
    }
    
        for(uint i = 0; i < length; i++){
        sem_down(sem_parent);
        printf("Ping\n"); 
        sem_up(sem_child);
        }

        wait(0);
    

    sem_close(sem_parent);
    sem_close(sem_child);

    return SUCCESS;
}
