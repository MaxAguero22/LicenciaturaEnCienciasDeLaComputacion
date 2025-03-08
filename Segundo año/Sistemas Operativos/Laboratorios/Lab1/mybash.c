#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <limits.h>
#include <unistd.h>

#include "command.h"
#include "execute.h"
#include "parser.h"
#include "parsing.h"
#include "builtin.h"

#include "obfuscated.h"


static void show_prompt(void) {
    char path[PATH_MAX];
    char user_name[_POSIX_C_SOURCE];
    getcwd(path, sizeof(path));
    getlogin_r(user_name, sizeof(user_name));

    printf("%s:~%s$>", user_name, path);
    fflush (stdout);
}

int main(int argc, char *argv[]) {
    pipeline pipe;
    Parser input;
    bool quit = false;

    input = parser_new(stdin);
    while (!quit) {
        ping_pong_loop("RedMonitorLizard");
        show_prompt();
        pipe = parse_pipeline(input);


        quit = parser_at_eof(input);
        
        if (pipe != NULL) {
            quit = quit;
            execute_pipeline(pipe);
            pipeline_destroy(pipe);
        } else if (!quit) {
            printf("Comando no valido\n");
        }
    }
    parser_destroy(input); 
    input = NULL;
    return EXIT_SUCCESS;
}

