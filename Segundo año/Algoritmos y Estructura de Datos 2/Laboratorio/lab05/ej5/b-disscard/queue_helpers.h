#ifndef _QUEUE_HELPERS_H
#define _QUEUE_HELPERS_H

#include "queue.h"

queue queue_from_file(const char *filepath);
/*
    Each element is read from the file located at 'filepath'.
    The file must exist in disk and must have its contents in the following
    format:

    empty: <empty_flag>
    <elem_1> <elem_2> <elem_3> ... <elem_N>

    The value <empty_flag> indicates with 0 that the saved queue is NOT EMPTY.
    A value greater or smaller than 0 indicates that the saved queue is EMPTY
    therefore is no data in the file (N==0).

    Returns an instance of 'queue' that holds the loaded elements

*/

queue queue_user_disscard(queue q);
/*
 * Asks the user to choose an item to disscard
 *
 *  PRE: {!queue_is_empty(q)}
 *
 */
 


#endif
