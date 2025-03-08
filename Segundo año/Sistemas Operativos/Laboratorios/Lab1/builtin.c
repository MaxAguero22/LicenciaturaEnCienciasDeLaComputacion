#include <string.h>
#include <unistd.h> //para poder usar la funcion getlogin()
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <errno.h>
#include "tests/syscall_mock.h"

#include "builtin.h"
#include "command.h"

/*Creo un arreglo que contenga todos los comandos que tenemos que implementar, el cd , help y exit*/

char* builtin_commands[] = {"cd","help","exit"};

unsigned int length_bt_commands = 3; // me va a servir para poder recorrer el arreglo.

bool builtin_is_internal(scommand cmd)
{
    assert(cmd != NULL);
    for(unsigned int i = 0; i < length_bt_commands ; i++)
    {
        if(!strcmp(scommand_front(cmd),builtin_commands[i])) // aca lo niego porque si los strings son iguales strcmp devuelve 0.
        {
            return true;
        }
    }
    return false;
}


bool builtin_alone(pipeline p)
{
    assert(p != NULL);
    return (pipeline_length(p) == 1) && builtin_is_internal(pipeline_front(p));
}

void builtin_run(scommand cmd)
{
    char home_dir[] = "/home/";

    assert(cmd != NULL);
    if(!strcmp(scommand_front(cmd),builtin_commands[0])) // caso 0: cd
    {
        scommand_pop_front(cmd); // aca saco el cd, me quedo con el string q me dice un path.
    

        if(scommand_length(cmd) == 0) // osea el comando cd solo    
        { 
            // consigo el user y le pego al final de home_dir, asi me queda algo del estilo /home/user
            char * user_id = getlogin();
            char * user_dir = malloc(sizeof(home_dir) + sizeof(user_id)); // voy a tener q pedir memoria pq tengo que usar strcpy y strcat para poder formar el path /home/user
            strcpy(user_dir,home_dir);  /* path actual: /home/ */                                                                 
            strcat(user_dir,user_id);   /* path actual: /home/user */    
            scommand_push_back(cmd,user_dir); // como cmd estaba "vacio" le agrego la cadena /home/user al final
        }

        int chdir_result = chdir(scommand_front(cmd)); // si sale todo bien, chdir() cambia el directorio y devuelve 0

        if(chdir_result != 0) //manejo de errores utilizando errno.h
        {
            switch (errno)
            {
            case EACCES:
                printf("Permiso denegado. El usuario no tiene los permisos para cambiar a ese directorio\n");
                break;
            case ENOENT:
                printf("El directorio proporcionado no existe\n");
                break;
            case ENOTDIR:
                printf("Un componente del path no es un directorio\n");
                break;
            case EFAULT:
                printf("El path esta apuntando afuera de tu espacio de memoria acesible\n");
                break;
            }
        }

    }

    else if(!strcmp(scommand_front(cmd),builtin_commands[1])) // caso 1: help
    {
        printf("Bienvenido a la ventana de ayuda de MyBash.\n\n"
        "Aquí podrás encontrar información acerca de los comandos que esta increíble shell puede ejecutar!\n\n"
       "cd -> Cambia el directorio en el que te encuentras, permitiéndote navegar por tu sistema.\n"
       "help -> Te muestra este texto!. Con toda la información que necesitas sobre los comandos de MyBash.\n"
       "exit -> Finaliza la sesión actual de MyBash.\n\n"
       "Autores: Máximo Agüero, Francisco Villán, Pedro Pedernera, Jeremías Almeira\n");

    }
    else if(!strcmp(scommand_front(cmd),builtin_commands[2])) // caso 2: exit
    {
        exit(EXIT_SUCCESS);
    }
}
