#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>


#include "helpers.h"
#include "sort.h"
#include "player.h"

#define MAX_PLAYERS 5000

void print_help(char *program_name) {
    printf("Usage: %s <input file path>\n\n"
           "Sort an array given in a file in disk.\n"
           "\n"
           "The input file must have the following format:\n"
           " * Each line must contain the name of a player"
           " without spaces followed by a three-letter country"
           " code, the rank of the player, his age, his atp points"
           " and the number of tournaments played during the year.\n"
           " * Values must be separated by one or more spaces.\n"
           " * Numeric values must be natural numbers.\n\n",
           program_name);
}

char *parse_filepath(int argc, char *argv[]) {
    char *result = NULL;

    if (argc < 2) {
        print_help(argv[0]);
        exit(EXIT_FAILURE);
    }

    result = argv[1];

    return (result);
}

int main(int argc, char *argv[]) {
    char *filepath = NULL;
    player_t atp[MAX_PLAYERS];

    filepath = parse_filepath(argc, argv);

    unsigned int length = process_file(filepath, atp);

    player_t copy[MAX_PLAYERS];
    array_copy(copy, atp, length);
    {
        clock_t start, end;

        start = clock();

        sort(atp, length);

        end = clock();

        double used_cpu_time = ((double) (end - start)) / CLOCKS_PER_SEC;

        atp_dump(atp, length);

        printf("\ncpu time used to sort the array: %f seconds.\n", used_cpu_time);
    }

    assert(array_is_sorted(atp, length));

    assert(array_is_permutation_of(copy, atp, length));
    return (EXIT_SUCCESS);
}
