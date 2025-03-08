#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <assert.h>

#include "command.h"
#include "parser.h"
#include "parsing.h"
#include "builtin.h"
#include "execute.h"

#include "obfuscated.h"
#include "tests/syscall_mock.h"

static void single_command_execute(scommand cmd){
    // Creates an array with Pipe arguments to be use in execvp()
    int cmd_len = scommand_length(cmd);
    char** args = calloc(cmd_len + 1, sizeof(char*));
    unsigned int i = 0; 

    while(!scommand_is_empty(cmd)){
        args[i] = strdup(scommand_front(cmd));
        scommand_pop_front(cmd);
        i++;
    }
    args[cmd_len] = NULL;

    execvp(args[0], args);  
}

sig_atomic_t child_exit_status;

static void clean_up_child_process (int signal_number)
{
        int status;
        pid_t pid;
        pid = waitpid(-1, &status, WNOHANG);		// Mata a un proceso hijo
    
    	// Mata a los demas (si es que hay)
        while (pid  > 0) {
                pid = waitpid(-1, &status, WNOHANG);	// -1 espera a cualquier hijo que haya terminado
        }						// WNOHANG indica que si no hay hijos terminados decuelve 0
}		

void execute_pipeline(pipeline apipe)
{
    assert(apipe != NULL);

    if(builtin_alone(apipe)){
            builtin_run(pipeline_front(apipe));
            return;               
    }
    
    unsigned int length = pipeline_length(apipe);
    
    // Matamos a los procesos zombies
    if(!pipeline_get_wait(apipe))
    {
            struct sigaction sigchld_action;
            memset (&sigchld_action, 0, sizeof (sigchld_action));
            sigchld_action.sa_handler = clean_up_child_process;
            sigaction (SIGCHLD, &sigchld_action, NULL);
    }
    
    int pipemain[2];
    int pipeaux[2];
    int* pid_hijo = malloc(length * sizeof(int));
    
    for(unsigned int i = 0; i < length; i++)
    {

            if(i != 0)                    	// Si es el primer proceso de la cadena no me interesa 
	    {				  	// setear fd auxiliares porque solo me hace falta la salida al pipe.
	            pipeaux[0] = pipemain[0];
	            pipeaux[1] = pipemain[1];
	    }

            if(i != length - 1)			// Si es un comando solo o si es el ultimo no necesito hacer pipe
	    {
	            pipe(pipemain);
	    }
	    
	    int pid = fork();
            
            if(pid == -1)
	    {
		    printf("Error en el Fork\n");
                    exit(0);  
            }
	    else if(pid == 0)				// Hijo
	    {

           	    if(i != length - 1)          	// No estoy en el ultimo proceso de la cadena. Redirijo la salida al 
           	    {					// pipe, asi despues puedo leerla 
		            close(pipemain[0]);         // Cierro el file descriptor de lectura del pipe
		            close(STDOUT_FILENO);       // Cierro el file descriptor standard de salida del proceso 
		            dup(pipemain[1]);           // Duplico el file descriptor de escritura del pipe, 
		            				// en el file descriptor standard de salida del proceso 
		            close(pipemain[1]);         // Cierro el file descriptor de escritura del pipe
	            }
                    /*
                      El hecho de que se use un pipemain y un pipeaux, 
                      es porque a un mismo pipe yo necesito darle tanto 
                      una entrada como una salida para comunicar comandos distintos
                    */

	            if(i != 0)                  	// No estoy en el primer proceso de la cadena 
	            {
		            close(pipeaux[1]);
		            close(STDIN_FILENO);       	// Cierro el file descriptor standard de entrada del proceso  
		            dup(pipeaux[0]);            // Duplico el file descriptor de lectura del pipe, 
		            				// en el file descriptor standard de entrada del proceso 
		            close(pipeaux[0]);          // Cierro el file descriptor de lectura del pipe
	            }
	            
	            if(scommand_get_redir_in(pipeline_front(apipe)) != NULL)
                    {
                            int fd_in = open(scommand_get_redir_in(pipeline_front(apipe)), O_RDONLY, S_IRWXU);
            		    close(STDIN_FILENO);
            		    dup(fd_in);
            		    close(fd_in); 
           	    }
                    if(scommand_get_redir_out(pipeline_front(apipe)) != NULL)
                    {
            		    int fd_out = open(scommand_get_redir_out(pipeline_front(apipe)), O_CREAT|O_WRONLY|O_TRUNC, S_IRWXU);   
            		    close(STDOUT_FILENO);
            		    dup(fd_out);
            		    close(fd_out);
           	    }

                    single_command_execute(pipeline_front(apipe));
                    printf("ERROR DE EJECUCION\n");
                    exit(EXIT_FAILURE);
            }
            else					// Padre
            {
            	    if(i != 0)
            	    {
            	            close(pipeaux[0]);
            	            close(pipeaux[1]);
            	    }
		    pid_hijo[i] = pid;
                    pipeline_pop_front(apipe);
            }
    }
    
    if(pipeline_get_wait(apipe))
    {
            for(unsigned int i = 0; i < length ; i++)
            {
                    waitpid(pid_hijo[i], NULL, 0);
	    } 
    }
    free(pid_hijo);

}
