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
* @return True when is the last entry of the flight table, False otherwise
*/
static bool is_last_line(unsigned int hour, unsigned int type) {
  return  hour == HOURS - 1u && type == TYPE - 1u;
}

void array_dump(LayoverTable a) {
  for (unsigned int hour = 0u; hour < HOURS; ++hour) {
    for (unsigned int type = 0u; type < TYPE; ++type) {
      Flight f = a[hour][type];
      fprintf(stdout, "%c: %s at %u:00 with %u passengers", f.code, f.type == 0 ? "arrives" : "departs", f.hour - 1, f.passengers_amount);
      if (!is_last_line(hour, type))
      {
        fprintf(stdout, "\n");
      }
    }
  }
}

unsigned int passengers_amount_in_airport (LayoverTable a, unsigned int h) {
  
  
  unsigned int passengers = 0u;
  
    for (unsigned int hour = 0u; hour < HOURS; ++hour) {
        for (unsigned int type = 0u; type < TYPE; ++type) {

            // a las 11, ¿cuantos pasajeros estan esperando? en primer luagr
            // aquellos que llegaron en esa hora. En segundo lugar, el vuelo de salida
            // correspondiente al vuelo de llegada a las 11, se toman como pasajeros en espera
            // esto quiere decir que tanto los que llegaron a las 11, como los que tienen que salir
            // son pasajeros en espera.
            // luego, antes de las 11, puede haber pasajeros que todavia no salieron
            // es decir, tengo que sumar aquellos vuelos de llegada menor a 11, pero con salida mayor a 11.
            // recorro todas las posiciones, aquel vuelo que haya llegado a las 11, sumo sus pasajeros
            // aquel vuelo que sale a las 11, sumo los pasajeros
            // si existe un vuelo que llego antes que las 11, y su salida es despues, sumo los psajeros de salida
            if(a[hour][type].hour - 1 == h){
                //entra al vuelo de las 11
                //te da los pasajeros que llegaron type = 0
                passengers = passengers + a[hour][type].passengers_amount;
            }
            if(a[hour][0].hour < hour && a[hour][1].hour > hour){
                passengers = passengers + a[hour][1].passengers_amount;
             
            }
            
            
            
            
               
        } //ends for TYPE  
    } //ends for HOURS
    
  
  
  
  
  
  
  
  
  
  
  return passengers;
}
//debe mostrar a la hora 11 24 pasajeros esperan.


void array_from_file(LayoverTable array, const char *filepath) {
  FILE *file = NULL;

  file = fopen(filepath, "r");
  if (file == NULL) {
    fprintf(stderr, "File does not exist.\n");
    exit(EXIT_FAILURE);
  }

  char code;
  int i=0;
  while (!feof(file)) {
    int res = fscanf(file, "_%c_ ", &code);
    if (res != 1) {
      fprintf(stderr, "Invalid file.\n");
      exit(EXIT_FAILURE);
    }
    Flight flight_arrival =   flight_from_file(file, code);
    Flight flight_departure = flight_from_file(file, code);
    array[i][arrival] = flight_arrival;
    array[i][departure] = flight_departure;
    i++;
  }
  fclose(file);
}
