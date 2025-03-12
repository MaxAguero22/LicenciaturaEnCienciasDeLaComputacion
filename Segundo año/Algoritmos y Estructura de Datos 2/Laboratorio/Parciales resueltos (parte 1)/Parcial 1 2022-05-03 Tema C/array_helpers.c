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
* @brief returns true when reach last entry in flight table
* @return True when is the last entre of the flight table, False otherwise
*/
static bool is_last_line(unsigned int hour, unsigned int type) {
  return  hour == HOURS - 1u && type == TYPE - 1u;
}

void array_dump(DeliveryTable a) {
  for (unsigned int type = 0u; type < TYPE; ++type) {
    for (unsigned int hour = 0u; hour < HOURS; ++hour) {
      Flight f = a[type][hour];
      fprintf(stdout, "%c: flight with %u %s arrived at %u:00", f.code, f.items_amount, f.type == 0 ? "boxes" : "letters", f.hour - 1);
      if (!is_last_line(hour, type))
      {
        fprintf(stdout, "\n");
      }
    }
  }
}

unsigned int extra_space_fee_cost (DeliveryTable a, unsigned int h) {  
    unsigned int max_allowed = MAX_ALLOWED_BOXES;
    unsigned int penalty = BOX_PENALTY;
    unsigned int total_cost = 0u;
    unsigned int items_exceed;
    unsigned int cost_per_type;
    unsigned int total_items;
    for (unsigned int type = 0u; type < TYPE; ++type) {
        items_exceed = 0u;
        cost_per_type = 0u;
        total_items = 0u;
        
        for (unsigned int hour = 0u; hour < HOURS; ++hour) {
            if(a[type][hour].hour <= h){
                total_items = a[type][hour].items_amount + total_items;  
            }
        }
        if(total_items > max_allowed){
            items_exceed = total_items - max_allowed;
            cost_per_type = items_exceed * penalty;
            total_cost = cost_per_type + total_cost;
        }
        penalty = LETTER_PENALTY;
        max_allowed = MAX_ALLOWED_LETTERS;
  }
  return total_cost;
 
}

void array_from_file(DeliveryTable array, const char *filepath) {
  FILE *file = NULL;

  file = fopen(filepath, "r");
  if (file == NULL) {
    fprintf(stderr, "File does not exist.\n");
    exit(EXIT_FAILURE);
  }

  char code;
  unsigned int arrival_hour;
  int i = 0; 
  while (!feof(file)) {
    int res = fscanf(file, "_%c_ ", &code);
    if (res != 1) {
      fprintf(stderr, "Invalid file.\n");
      exit(EXIT_FAILURE);
    }
    res = fscanf(file, "%u ", &arrival_hour);
    if (res != 1) {
      fprintf(stderr, "Invalid file.\n");
      exit(EXIT_FAILURE);
    }
    arrival_hour = arrival_hour + 1u;
    Flight flight_boxes = flight_from_file(file,code,arrival_hour);
    Flight flight_letters = flight_from_file(file,code,arrival_hour);
  
  
   array[boxes][i] = flight_boxes;
   array[letters][i] = flight_letters;
   i++;
  }
}






















