#include <stdlib.h>  /* exit() y EXIT_FAILURE */
#include <stdio.h>   /* printf(), scanf()     */
#include <stdbool.h> /* Tipo bool             */

#include <assert.h>  /* assert() */
#define N 5
#define CELL_MAX (N * N - 1)

void print_sep(int length) {
    printf("\t ");
    for (int i=0; i < length;i++) printf("................");
    printf("\n");

}

void print_board(char board[N][N])
{
    int cell = 0;

    print_sep(N);
    for (int row = 0; row < N; ++row) {
        for (int column = 0; column < N; ++column) {
            printf("\t | %d: %c ", cell, board[row][column]);
            ++cell;
        }
        printf("\t | \n");
        print_sep(N);
    }
}

char get_winner(char board[N][N])
{
    char winner = '-';
    bool win = true;
    
    // verificar filas
    
    for(int i=0; i < N; i++){
        for(int j=0; j < N-1; j++){
            if(board[i][j] != winner && board[i][j] == board[i][j+1]){
              
            } //cierra el if
            else{
                win = false;
            }
        } //cierra for de columnas
        
        if(win){
            winner = board[i][N-1];
            return winner;
        }
        else{
            win = true;
        }
    } //cierra for de filas
    
    
    // verificar columnas
    
    for(int i = 0; i < N; i++){
        for(int j = 0; j < N-1; j++){
            if(board[j][i] != winner && board[j][i] == board[j+1][i]){
            
            } //cierra el if
            else{
                win = false;
            }
        } //cierra for de filas
        
        if(win){
            winner = board[N-1][i];
            return winner;
        }
        else{
            win = true;
        }
    } //cierra for de columnas

    // verificar diagonales
    
    for(int i = 0; i < N; i++){
        if(board[0][0] != winner && board[0][0] == board[i][i]){
            
        }
        else{
            win = false;
        }
     } //cierra for diagonales
     
     if(win){
         winner = board[0][0];
         return winner;
     }
     else{
         win = true;
     }

    int j, i;
    for(i = N - 2, j = 1; (i >= 0 && j < N); i--, j++){
        if(board[N-1][0] != winner && board[N-1][0] == board[i][j]){
                
        }
        else{
            win = false;
        }
    } //cierra for diagonales
    
    if(win){
            winner = board[N-1][0];
            return winner;
        }
        else{
            win = true;
        }
        
return winner;
}


bool has_free_cell(char board[N][N])
{
    bool free_cell=false;
    for(int i = 0; i < N; i++){
        for(int j = 0; j < N; j++){
            if(board[i][j] == '-'){
            free_cell = true;
            }
        }
    }   
    return free_cell;
}

int main(void)
{
    printf("TicTacToe [InCoMpLeTo :'(]\n");
    
    char board[N][N];
    for(int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            board[i][j] = '-';
        }
    };

    char turn = 'X';
    char winner = '-';
    int cell = 0;
    while (winner == '-' && has_free_cell(board)) {
        print_board(board);
        printf("\nTurno %c - Elija posición (número del 0 al %d): ", turn,
               CELL_MAX);
        int scanf_result = scanf("%d", &cell);
        if (scanf_result <= 0) {
            printf("Error al leer un número desde teclado\n");
            exit(EXIT_FAILURE);
        }
        if (cell >= 0 && cell <= CELL_MAX) {
            int row = cell / N;
            int colum = cell % N;
            if (board[row][colum] == '-') {
                board[row][colum] = turn;
                turn = turn == 'X' ? 'O' : 'X';
                winner = get_winner(board);
            } else {
                printf("\nCelda ocupada!\n");
            }
        } else {
            printf("\nCelda inválida!\n");
        }
    }
    print_board(board);
    if (winner == '-') {
        printf("Empate!\n");
    } else {
        printf("Ganó %c\n", winner);
    }
    return 0;
}

