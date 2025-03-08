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

unsigned int extra_space_fee_cost (DeliveryTable a) {
    unsigned int max_allowed = MAX_ALLOWED_BOXES;
    unsigned int type_penalty = BOX_PENALTY;
    unsigned int exceed;
    unsigned int total_items;
    unsigned int day_penalty;
    unsigned int total_cost = 0u;
    for (unsigned int type = 0u; type < TYPE; ++type) {
        exceed = 0u;
        total_items = 0u;
        day_penalty = 0u;
        for (unsigned int hour = 0u; hour < HOURS; ++hour) {
            if(a[type][hour].hour - 1u <= FEE_CLOSE_HOUR){
                total_items = a[type][hour].items_amount + total_items;
            } // cantidad de items boxes en el dia
        
        }
        if( total_items > max_allowed ){
                exceed = total_items - max_allowed;
                day_penalty = exceed * type_penalty;
            } // si se paso el limite se obtiene el costo a pagar
        total_cost = total_cost + day_penalty;
        //reseteo las variables y cambio valores para calcular penalty de letters
        max_allowed = MAX_ALLOWED_LETTERS;
        type_penalty = LETTER_PENALTY;
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
  int i = 0;
  while (!feof(file)) {
    int res = fscanf(file, "_%c_\n", &code);
    if (res != 1) {
      fprintf(stderr, "Invalid file.\n");
      exit(EXIT_FAILURE);
    }
    Flight flight_boxes = flight_from_file(file, code, boxes);
    Flight flight_letters = flight_from_file(file, code, letters);
  
    array[boxes][i] = flight_boxes;
    array[letters][i] = flight_letters;
    i++;
  }
}
