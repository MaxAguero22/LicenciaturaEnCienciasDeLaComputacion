#include <stdlib.h>
#include <stdio.h>
#include "pair.h" 
#include <assert.h>


pair_t pair_new(int x, int y){
    pair_t q;
    q.values[0] = x;
    q.values[1] = y;
    
return q;
}

int pair_first(pair_t p){
    int fst = p.values[0];
    assert(fst == p.values[0]);
return fst;
}

int pair_second(pair_t p){
    int snd = p.values[1];
    assert(snd == p.values[1]);
return snd;
}

pair_t pair_swapped(pair_t p){
    pair_t q;
    q.values[0] = p.values[1];
    q.values[1] = p.values[0];
    assert(pair_first(q) == pair_second(p) && pair_second(q) == pair_first(p));
return q;
}

pair_t pair_destroy(pair_t p){
    return p;
}


