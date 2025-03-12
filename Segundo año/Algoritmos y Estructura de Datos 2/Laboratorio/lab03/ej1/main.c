#include <stdlib.h>
#include <stdio.h>
#define MAX_SIZE 1000

static void dump(char a[], unsigned int length) {
    printf("\"");
    for (unsigned int j=0u; j < length; j++) {
        printf("%c", a[j]);
    }
    printf("\"");
    printf("\n\n");
}
void print_help(char *program_name) {
    printf("Wrong file format of %s /n",program_name);
}

char *parse_filepath(int argc, char *argv[]) {
    char *result = NULL;

    if (argc < 2) {
        print_help(argv[0]);
        exit(EXIT_FAILURE);
    }

    result = argv[1];

    return result;
}

unsigned int data_from_file(const char *path, unsigned int indexes[], char letters[], unsigned int max_size){

    FILE *file;
    file = fopen(path, "r");
    if (file == NULL) {
        fprintf(stderr, "File does not exist.\n");
        exit(EXIT_FAILURE);
    }
    unsigned int i = 0;
    while(!feof(file) && i < max_size){
            int res = fscanf(file,"%u -> *%c*\n", &indexes[i], &letters[i]);
            if (res != 2) {
            fprintf(stderr, "Invalid array.\n");
            exit(EXIT_FAILURE);
        }
            i++;
        }
    fclose(file);
    return i;
}


void rebuild(unsigned int indexes[], char letters[], char sorted[], unsigned int length){
    
    for(unsigned int i = 0u; i < length; i++){
        for(unsigned int j = 0u; j < length; j++){
            if(indexes[i] == j){
                sorted[j] = letters[i];            
            }
            if(indexes[i] > length){
                printf("Error! The indices of the file exceed the expected size\n");
                exit(EXIT_FAILURE);
            }
        }
    }    
}

int main(int argc, char *argv[]) {
    
    char *filepath = NULL;

    filepath = parse_filepath(argc, argv);
    
    unsigned int indexes[MAX_SIZE];
    char letters[MAX_SIZE];
    char sorted[MAX_SIZE];
    unsigned int length=0; 
    
    length = data_from_file(filepath, indexes, letters,MAX_SIZE);
    
    rebuild(indexes,letters,sorted,length);
    
    dump(sorted, length);
    
    return EXIT_SUCCESS;
}

