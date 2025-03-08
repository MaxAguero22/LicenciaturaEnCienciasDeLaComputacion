#include<stdlib.h>
#include <limits.h>

#include "weather_utils.h"
#include "array_helpers.h"


int low_historic_temp(WeatherTable a){
     
     int temperature = INT_MAX;
     
     for (unsigned int year = 0u; year < YEARS; ++year) {
        for (month_t month = january; month <= december; ++month) {
            for (unsigned int day = 0u; day < DAYS; ++day) {
                if(a[year][month][day]._min_temp < temperature){
                    temperature = a[year][month][day]._min_temp;
                }    
            }
        }
    }
return temperature;
}

void high_temp(WeatherTable a, int output[YEARS]){
    
    for (unsigned int year = 0u; year < YEARS; ++year) {
        int temperature = INT_MIN;
        for (month_t month = january; month <= december; ++month) {
            for (unsigned int day = 0u; day < DAYS; ++day) {
                if(a[year][month][day]._max_temp > temperature){
                    temperature = a[year][month][day]._max_temp;
                }    
            }
        
        }
            output[year] = temperature;  
    }        
}

void dump_highest_temp(int highest_temp[]){
    
    int year = FST_YEAR;
    for(int i = 0; i < YEARS; i++){
        printf("The maximun temperature recorded in %d was %d\n\n",year,highest_temp[i]);
        year++;
    }
}

void high_rainfall(WeatherTable a, month_t output[YEARS]){
    
    unsigned int rainfall_sum;
    unsigned int max_rainfall;
    unsigned int rainfall_per_month[MONTHS];
    
    for (unsigned int year = 0u; year < YEARS; ++year) {
        //variable para obtener el mes de maxima precipitacion mensual en el año.
        max_rainfall = 0u; 
        for (month_t month = january; month <= december; ++month) {
            //variable para sumar diariamente las precipitaciones por mes
            rainfall_sum = 0u;
            for (unsigned int day = 0u; day < DAYS; ++day) {
                rainfall_sum = rainfall_sum + a[year][month][day]._rainfall;
                }
                //guardo en arreglo auxiliar, la posicion indica el mes en el cual estamos.
                rainfall_per_month[month] = rainfall_sum;
          }
          //arreglo auxiliar con todas las precipitacines mensuales del año.
          //saco el maximo y guardo la posicion (indica el mes en done hubo mas precipitaciones)
              for(unsigned int j = 0u; j < MONTHS; j++){
                  if(rainfall_per_month[j] > max_rainfall){
                      max_rainfall = rainfall_per_month[j];
                      output[year] = j;
                  }
              }
        } 
}


void dump_rainfall(month_t highest_rainfall[]){
    
    int year = FST_YEAR;
    for(int i = 0; i < YEARS; i++){
        if(highest_rainfall[i] == 0){
        printf("In %d, the highest precipitation ocurred in January\n\n",year);
        }
        else if(highest_rainfall[i] == 1){
        printf("In %d, the highest precipitation ocurred in February\n\n",year);
        }
        else if(highest_rainfall[i] == 2){
        printf("In %d, the highest precipitation ocurred in March\n\n",year);
        }
        else if(highest_rainfall[i] == 3){
        printf("In %d, the highest precipitation ocurred in April\n\n",year);
        }
        else if(highest_rainfall[i] == 4){
        printf("In %d, the highest precipitation ocurred in May\n\n",year);
        }
        else if(highest_rainfall[i] == 5){
        printf("In %d, the highest precipitation ocurred in June\n\n",year);
        }
        else if(highest_rainfall[i] == 6){
        printf("In %d, the highest precipitation ocurred in July\n\n",year);
        }
        else if(highest_rainfall[i] == 7){
        printf("In %d, the highest precipitation ocurred in August\n\n",year);
        }
        else if(highest_rainfall[i] == 8){
        printf("In %d, the highest precipitation ocurred in September\n\n",year);
        }
        else if(highest_rainfall[i] == 9){
        printf("In %d, the highest precipitation ocurred in October\n\n",year);
        }
        else if(highest_rainfall[i] == 10){
        printf("In %d, the highest precipitation ocurred in November\n\n",year);
        }
        else if(highest_rainfall[i] == 11){
        printf("In %d, the highest precipitation ocurred in December\n\n",year);
        }
    year++;
    }
}


 
