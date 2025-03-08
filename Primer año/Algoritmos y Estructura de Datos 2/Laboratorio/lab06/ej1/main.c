/* First, the standard lib includes, alphabetically ordered */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "abb.h" /* TAD abb */


void print_help(char *program_name) {
    /* Print the usage help of this program. */
    printf("Usage: %s <input file path>\n\n",
           program_name);
}

char *parse_filepath(int argc, char *argv[]) {
    /* Parse the filepath given by command line argument. */
    char *result = NULL;

    if (argc < 2) {
        print_help(argv[0]);
        exit(EXIT_FAILURE);
    }

    result = argv[1];

    return (result);
}

abb abb_from_file(const char *filepath) {
    FILE *file = NULL;
    abb read_tree;

    read_tree = abb_empty();
    file = fopen(filepath, "r");
    if (file == NULL) {
        fprintf(stderr, "File does not exist.\n");
        exit(EXIT_FAILURE);
    }
    unsigned int i = 0u;
    unsigned int size = 0u;
    int res = 0;
    res = fscanf(file, " %u ", &size);
    if (res != 1) {
        fprintf(stderr, "Invalid format.\n");
        exit(EXIT_FAILURE);
    }
    while (i < size) {
        abb_elem elem;
        res = fscanf(file," %d ", &(elem));
        if (res != 1) {
            fprintf(stderr, "Invalid array.\n");
            exit(EXIT_FAILURE);
        }
        read_tree = abb_add(read_tree, elem);

       ++i;
    }
    fclose(file);
    return read_tree;
}

unsigned int  print_menu(void) {
  unsigned int result;
  printf("\nChoose what you want to do. Options are:\n"
  "\n"
  "\t**************************************************************\n"
  "\t* 1: Show the tree in stdout.                                *\n"
  "\t* 2: Add a new element to the tree.                          *\n"
  "\t* 3: Remove an element from the dict.                        *\n"
  "\t* 4: Check the existance of an element.                      *\n"
  "\t* 5: Size of the tree.                                       *\n"
  "\t* 6: Show tree root, max and min.                            *\n"
  "\t* 7: Quit.                                                   *\n"
  "\t**************************************************************\n"
  "\nPlease enter your choice: ");
  scanf("%u",&result);
  return (result);
}

int main(int argc, char *argv[]) {
    char *filepath = NULL;

    /* parse the filepath given in command line arguments */
    filepath = parse_filepath(argc, argv);

    /* parse the file to obtain an abb with the elements */
    abb tree = abb_from_file(filepath);
   
    unsigned int option = 0u;
    option = print_menu();
    do {
        option = print_menu();
        switch (option) {
            case 1 :
            	printf("En que modo desea imprimir el arbol:\n0. IN_ORDER\n1. PRE_ORDER\n2. POST_ORDER\n");
            	unsigned int option;
            	scanf("%u", &option);
                abb_dump(tree, option);
                break;
                // Consultar por qué no imprime al primer intento
                
            case 2 :
                printf("Ingrese el elemento a agregar: ");
                unsigned int new_elem;
                scanf("%u",&new_elem);
                tree = abb_add(tree, new_elem);
                break;
            case 3 :
                printf("\nIngrese el elemento a remover: ");
                unsigned int kill_elem;
                scanf("%u",&kill_elem);
                tree = abb_remove(tree, kill_elem);
                break;
            case 4 :
                printf("\nIngrese el elemento a verificar: ");
                bool result = true;
                unsigned int is_elem;
                scanf("%u",&is_elem);
                result = abb_exists(tree, is_elem);
                if(result){
                    printf("\nEl elemento existe\n");
                }
                else{
                    printf("\nEl elemento no existe\n");
                }
                break;
            case 5 :
            	;
            	unsigned int length = 0u;
                length = abb_length(tree);
                printf("\nEl largo del arbol es: %u\n", length);
                break;
            case 6 :
                if (!abb_is_empty(tree)){
 		    printf("\n");
                    printf("\n raiz: %d\n minimo: %d\n maximo: %d\n", abb_root(tree),abb_min(tree),abb_max(tree));
    	        } 
    	        else{
                    printf("\nÁrbol vacío\n");
    	        }
                break;
            case 7 :
                tree = abb_destroy(tree);
                printf("\nExiting.\n");
                return (EXIT_SUCCESS);
            default:
                printf("\n\"%c\" is invalid. Please choose a valid "
                "option.\n\n", option);
       }
    } while (option != 7);
   
    tree = abb_destroy(tree);
    return (EXIT_SUCCESS);
}
