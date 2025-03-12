/*
@file array_helpers.c
@brief Array Helpers method implementation
*/
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "array_helpers.h"

/**
* @brief returns true when reach last line in flight file
* @return True when is the last line of the file, False otherwise
*/
static bool is_last_line(unsigned int hour, unsigned int type) {
  return  hour == HOURS - 1u && type == TYPE - 1u;
}

void array_dump(DelayTable a) {
  for (unsigned int type = 0u; type < TYPE; ++type) {
    for (unsigned int hour = 0u; hour < HOURS; ++hour) {
      Flight f = a[type][hour];
      fprintf(stdout, "%c: %s flight with %u passengers arrived at %u:00, with %u delay",
        f.code,
        f.type == 0 ? "last_mile" : "layover",
        f.passengers_amount,
        f.hour - 1,
        f.delay
      );
      if (!is_last_line(hour, type))
      {
        fprintf(stdout, "\n");
      }
    }
  }
}
unsigned int compensation_cost (DelayTable a, unsigned int h) {
    unsigned int max_delay = MAX_LM_DELAY_ALLOWED;
    unsigned int compensation;
    unsigned int compensation_per_pas;
    unsigned int delay;
    unsigned int total_cost = 0u;
    for (unsigned int type = 0u; type < TYPE; ++type) {
        for (unsigned int hour = 0u; hour < HOURS; ++hour) {
            compensation = 0u;
            delay = 0u;
            compensation_per_pas = 0u;
            if(max_delay < a[type][hour].delay && a[type][hour].hour <= h){
                delay = a[type][hour].delay - max_delay;
                compensation = COMPENSATION_PER_MINUTE * delay;
                compensation_per_pas = compensation * a[type][hour].passengers_amount; 
                total_cost = total_cost + compensation_per_pas;
               }
        }
        max_delay = MAX_LAYOVER_DELAY_ALLOWED;  
    }
    return total_cost;
}    
void array_from_file(DelayTable array, const char *filepath) {
  FILE *file = NULL;

  file = fopen(filepath, "r");
  if (file == NULL) {
    fprintf(stderr, "File does not exist.\n");
    exit(EXIT_FAILURE);
  }

  char code;
  int i = 0;
  while (!feof(file)) {
    Flight last_mile_info = flight_from_file(file);
    last_mile_info.type = last_mile;
    Flight layover_info = flight_from_file(file);
    layover_info.type = layover;
    int res = fscanf(file, "#%c#\n", &code);
    if (res != 1) {
      fprintf(stderr, "Invalid file.\n");
      exit(EXIT_FAILURE);
    }
    else{
    last_mile_info.code = code;
    layover_info.code = code;
    }
    
    if(i < HOURS){
    array[last_mile][i] = last_mile_info;
    array[layover][i] = layover_info;
    }
    i++;
  }
  fclose(file);
}
