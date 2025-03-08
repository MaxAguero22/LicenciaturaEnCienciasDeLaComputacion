/*--------------------------------------------------------------------------
Especificacion:

var x: Int;
var r: Int;
{P: x == X}
S
{Q: r >= 0 && (r == X || r == -X)}

Derivacion:

asignamos la variable x,r := E,F entonces veamos P --> wp.(x,r:=E,F).Q
Asumimos P: x == X.
wp.(x,r:=E,F).(r >= 0 && (r == X || r == -X))
={ def de wp
F >= 0 && (F == X || F == -X)
={ hipotesis x == X
F >= 0 && (F == x || F == -x)
={ separamos en casos
caso (F >= 0)

(F == x || F == -x)
={ como f es >= 0
F == x

caso (F < 0)
(F == x || F == -x)
={ como f es < 0
F == -x

var x: Int;
var r: Int;
    x := X;
{P: x == X}
    if(x >= 0)-->
        r := x
    else(x < 0)-->
        r := -x
{Q: r >= 0 && (r == X || r == -X)}
--------------------------------------------------------------------------*/
#include <stdio.h>
#include <assert.h>

int pedir_entero(char letra){
    int n;
    printf("Ingrese un valor entero para '%c':\n", letra);
    scanf("%d",&n);
    return n;
}
int main()
{
    int x,r;
    int X;
    X = pedir_entero('x');
    x = X;
    assert(x == X);
    if (x >= 0){
        r = x;
    }
    else{
        r = -x;
    }
    assert(r >= 0 && (r == X || r == -X));
    printf("su valor absoluto es %d\n",r);
    
    return 0;
}
