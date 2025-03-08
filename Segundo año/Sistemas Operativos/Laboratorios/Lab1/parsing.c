#include <stdlib.h>
#include <stdbool.h>

#include "parsing.h"
#include "parser.h"
#include "command.h"
#include <assert.h>

static scommand parse_scommand(Parser p) {    
    scommand new_cons = scommand_new(); 
    arg_kind_t arg_type;
    char* arg;

//NOTE - If arg==NULL -> means there is a ' | ' or EOF
    while (!parser_at_eof(p))
    {

        arg = parser_next_argument(p,&arg_type);


        if (arg == NULL)break;
    
        
        if (arg_type == ARG_NORMAL)scommand_push_back(new_cons,arg);
            
        if (arg_type == ARG_INPUT)scommand_set_redir_in(new_cons,arg);
            
        if (arg_type == ARG_OUTPUT)scommand_set_redir_out(new_cons,arg);
            
    }
    
    return new_cons;
}

pipeline parse_pipeline(Parser p) {

    pipeline result = pipeline_new();
    scommand cmd = NULL;
    bool error = false, another_pipe=true;


    while (another_pipe && !error) {

        cmd = parse_scommand(p);
        
        parser_skip_blanks(p);              //REVIEW - skips blanck spaces
        pipeline_push_back(result,cmd);     //REVIEW - Puts at the end of a queue whatever it found
        parser_op_pipe(p,&another_pipe);    //REVIEW - Tell if another ' | ' exists
    
    }

//NOTE - If to be run on the background 
    bool run_on_background;
    parser_op_background(p,&run_on_background);
    pipeline_set_wait(result,!run_on_background);



//NOTE -  Checking for errors 

    bool gargabe;
    parser_garbage(p,&gargabe);

    if (pipeline_length(result) == 1 && scommand_length(pipeline_front(result)) == 0)   
    {
        pipeline_destroy(result);
        return NULL;
    }
    
    if (gargabe)
    {
        printf("Invalid command \n");
        pipeline_destroy(result);
        return NULL;
    }
  
    return result; 
}

