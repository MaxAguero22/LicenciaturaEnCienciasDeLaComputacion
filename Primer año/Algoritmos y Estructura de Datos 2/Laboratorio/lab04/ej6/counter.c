#include <stdbool.h>
#include <stdlib.h>
#include <assert.h>

#include "counter.h"

struct _counter {
    unsigned int count;
};

counter counter_init(void) {
    counter c = NULL;
    c = malloc(sizeof(counter));
    c->count = 0;
    
return c;
}

void counter_inc(counter c) {
    c->count = c->count + 1u;
}

bool counter_is_init(counter c) {
    bool b = 0 == c->count;
return b;
}

void counter_dec(counter c) {
    assert(!counter_is_init(c));
    c->count = c->count - 1u;
}

counter counter_copy(counter c) {
    counter c2 = NULL;
    c2 = malloc(sizeof(counter));
    c2->count = c->count;
    
return c2;
}

void counter_destroy(counter c) {
    free(c);
    c = NULL;
}
