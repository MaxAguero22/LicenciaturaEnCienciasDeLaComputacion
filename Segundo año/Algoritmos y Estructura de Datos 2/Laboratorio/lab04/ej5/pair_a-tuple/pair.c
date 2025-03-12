#include <stdlib.h>
#include <stdio.h>
#include "pair.h" 
#include <assert.h>


pair_t pair_new(int x, int y){
    pair_t q;
    q.fst = x;
    q.snd = y;
    
return q;
}

int pair_first(pair_t p){
    int fst = p.fst;
    assert(fst == p.fst);
return fst;
}

int pair_second(pair_t p){
    int snd = p.snd;
    assert(snd == p.snd);
return snd;
}

pair_t pair_swapped(pair_t p){
    pair_t q;
    q.fst = p.snd;
    q.snd = p.fst;
    assert(pair_first(q) == pair_second(p) && pair_second(q) == pair_first(p));
return q;
}

pair_t pair_destroy(pair_t p){
    return p;
}


