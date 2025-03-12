/*
  @file weather.c
  @brief Implements weather mesuarement structure and methods
*/
#include <stdlib.h>
#include "weather.h"

static const int AMOUNT_OF_WEATHER_VARS = 6 ;


/* aca tengo que hacer lo mismo que en array_from_file pero tengo que guardar los 6 elementos climaticos en una estructura  */

Weather weather_from_file(FILE* file) //tiene que leer la estructura correspondiente a la fecha
{
    Weather weather;
    int res = fscanf(file, EXPECTED_WEATHER_FILE_FORMAT, &weather._average_temp, 
            &weather._max_temp, &weather._min_temp, &weather._pressure, &weather._moisture, &weather._rainfall);
    if(res != AMOUNT_OF_WEATHER_VARS){
        fprintf(stderr, "Error. An incorrect variable number has been read\n");
        exit(EXIT_FAILURE);
    }
    return weather;
}

void weather_to_file(FILE* file, Weather weather) //toma el archivo y una estructura (asumo que con la estructura del cilma)
{
    fprintf(file, EXPECTED_WEATHER_FILE_FORMAT, weather._average_temp, 
            weather._max_temp, weather._min_temp, weather._pressure, weather._moisture, weather._rainfall);
}
