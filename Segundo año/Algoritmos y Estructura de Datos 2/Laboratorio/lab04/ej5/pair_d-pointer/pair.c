#include <stdlib.h>
#include "pair.h"
#include <assert.h>

struct s_pair_t {
    int fst;
    int snd;
};

pair_t pair_new(int x, int y){
    pair_t p;
    p = malloc(sizeof(pair_t));
    p->fst = x;
    p->snd = y;
    assert(p->fst == x && p->snd == y);
    return p;
}

int pair_first(pair_t p){
    int fst = p->fst;
    assert(p->fst == fst);
    return fst;
}

int pair_second(pair_t p){
    int snd = p->snd;
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
¿La implementación logra encapsulamiento?
  Totalmente, pair.h ahora solo nos da la informacion de como esta especificado el TAD.
  La función show_pair ya no accede a la representación interna del TAD.

¿Está bien que falle? 
  En un principio si, ahora el usuario no tiene acceso a la representación interna del TAD

*/
