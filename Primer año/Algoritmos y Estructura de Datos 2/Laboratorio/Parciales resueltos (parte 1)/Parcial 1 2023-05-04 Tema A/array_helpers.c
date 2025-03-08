/*
@file array_helpers.c
@brief Array Helpers method implementation
*/
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include "array_helpers.h"

static const int EXPECTED_DIM_VALUE = 2;

static const char* CITY_NAMES[CITIES] = {
    "Cordoba", "Rosario", "Posadas", "Tilcara", "Bariloche"};
static const char* SEASON_NAMES[SEASONS] = {"low", "high"};

void array_dump(BakeryProductTable a)
{
    for (unsigned int city = 0u; city < CITIES; ++city)
    {
        for (unsigned int season = 0u; season < SEASONS; ++season)
        {
            fprintf(stdout, "%s in %s season: flour (%u,%u) Yeast (%u,%u) Butter (%u,%u) Sales value %u",
                    CITY_NAMES[city], SEASON_NAMES[season], a[city][season].flour_cant,
                    a[city][season].flour_price, a[city][season].yeast_cant,
                    a[city][season].yeast_price, a[city][season].butter_cant,
                    a[city][season].butter_price, a[city][season].sale_value);
            fprintf(stdout, "\n");
        }
    }
}

unsigned int best_profit(BakeryProductTable a)
{
    unsigned int max_profit = 0u;
    unsigned int aux0;
    unsigned int aux1;
    for (unsigned int city = 0u; city < CITIES; ++city)
    {
        for (unsigned int season = 0u; season < SEASONS; ++season)
        {
            aux0 = (a[city][season].flour_price * a[city][season].flour_cant) +
            (a[city][season].yeast_cant * a[city][season].yeast_price) + (a[city][season].butter_cant * 
            a[city][season].butter_price);
            aux1 = a[city][season].sale_value - aux0; 
                       
            if(max_profit < aux1){
                max_profit  = aux1;
            }
        
        }
        
    }
    return max_profit;
}



void array_from_file(BakeryProductTable array, const char* filepath)
{
    FILE* file = NULL;

    file = fopen(filepath, "r");
    if (file == NULL)
    {
        fprintf(stderr, "File does not exist.\n");
        exit(EXIT_FAILURE);
    }
    int k_citycode;
    int k_season;
    int i = 0;
    while (!feof(file))
    {
        int res = fscanf(file, "##%d??%d " , &k_citycode, &k_season);  
        if (res != EXPECTED_DIM_VALUE)
        {
            fprintf(stderr, "Invalid file.\n");
            exit(EXIT_FAILURE);
        }
        
        BakeryProduct product_stats = bakery_product_from_file(file);
        
        array[(CITIES + k_citycode) - CITIES][i] = product_stats;
        
        ++i;
        if(i == 2){
            i = 0;
        }
        
    }
    fclose(file);
}
