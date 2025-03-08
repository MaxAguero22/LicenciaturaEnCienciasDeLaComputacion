#ifndef _WEATHER_UTILS_H
#define _WEATHER_UTILS_H

#include<stdlib.h>
#include "array_helpers.h"

int low_historic_temp(WeatherTable a);

void high_temp(WeatherTable a, int output[YEARS]);

void high_rainfall(WeatherTable a, month_t output[YEARS]);

void dump_rainfall(month_t highest_rainfall[]);

void dump_highest_temp(int highest_temp[]);

#endif
