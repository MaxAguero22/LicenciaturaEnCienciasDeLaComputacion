#include <stdlib.h>
#include "pair.h"
#include <assert.h>

struct s_pair_t {
    elem fst;
    elem snd;
};

pair_t pair_new(elem x, elem y){
    pair_t p;
    p = malloc(sizeof(pair_t));
    p->fst = x;
    p->snd = y;
    assert(p->fst == x && p->snd == y);
    return p;
}

elem pair_first(pair_t p){
    elem fst = p->fst;
    assert(p->fst == fst);
    return fst;
}

elem pair_second(pair_t p){
    elem snd = p->snd;
    assert(p->snd == snd);
    return snd;
}

pair_t pair_swapped(pair_t p){
    pair_t q;
    q = malloc(sizeof(pair_t));
    q->fst = p->snd;
    q->snd = p->fst;
    assert(pair_first(q) == pair_second(p) && pair_second(q) == pair_first(p));
    return q;
}

pair_t pair_destroy(pair_t p){
    free(p);
    p = NULL;
    return p;
}

/*
¿Qué diferencia hay entre la especificación anterior y la que se encuentra en el pair.h de la carpeta pair_d-pointer?
   En esta especificación el TAD acepta todo tipo de datos, siempre y cuando este especificado como tal, pero de igual forma la función shor_pair en main.c genera conflicto.
*/
