# Puesta en común - Primera Parte
---

#### 1. ¿Qué política de planificación utiliza xv6-riscv para elegir el próximo proceso a ejecutarse?**
---
   El sistema xv6-riscv implementa una política de planificación de tipo Round-Robin modificada. En lugar de seguir estrictamente el orden de llegada de los procesos, xv6-riscv selecciona el próximo proceso basándose en el estado de los procesos dentro del arreglo `struct proc[NPROC]`. La función `scheduler()` recorre este arreglo de izquierda a derecha, seleccionando el primer proceso que esté en el estado `RUNNABLE` y cambiándolo a `RUNNING` para ejecutarlo. Esto permite que procesos nuevos que estén listos para ejecutarse tengan prioridad sobre procesos más antiguos que aún no están en estado `RUNNABLE`.


#### 2. ¿Cuáles son los estados en los que un proceso puede permanecer en xv6-riscv y qué los hace cambiar de estado?**
---
   Los estados en los que un proceso puede estar en xv6-riscv incluyen:

   - **UNUSED**: Al inicializar `proc[NPROC]` con `procinit()` o liberar un proceso con `freeproc()`.
   - **USED**: Un proceso cambia a `USED` desde `UNUSED` mediante `allocproc()`, lo que asigna el proceso para ejecutarse.
   - **SLEEPING**: Un proceso cambia a `SLEEPING` cuando se invoca la función `sleep()`.
   - **RUNNABLE**: Al crear un proceso con `fork()`, ceder el CPU con `yield()`, o despertar un proceso dormido con `wakeup()`.
   - **RUNNING**: Cuando el planificador selecciona un proceso para ejecución, cambia a `RUNNING`.
   - **ZOMBIE**: Al finalizar, un proceso queda en `ZOMBIE` hasta que su padre llama a `wait()` para liberar sus recursos.


#### 3. ¿Qué es un quantum? ¿Dónde se define en el código? ¿Cuánto dura un quantum en xv6-riscv?**
---
   Un **quantum** es el intervalo de tiempo asignado a cada proceso para ejecutarse antes de ceder el CPU. En xv6-riscv, este tiempo está definido en `start.c` en la función `timerinit()`, y establece una interrupción cada 0.1 segundos en QEMU, equivalente a aproximadamente 1,000,000 ciclos de CPU. Este valor permite que cada proceso tenga una oportunidad de ejecutarse de manera cíclica en el sistema, pero puede variar si se ejecuta fuera de QEMU, debido a los otros procesos que el sistema operativo anfitrión esté manejando simultáneamente.


#### 4. ¿En qué parte del código ocurre el cambio de contexto en xv6-riscv? ¿En qué funciones un proceso deja de ser ejecutado?**
---
   El cambio de contexto ocurre en `scheduler()` y `sched()` en `proc.c`, usando la función `swtch()` para realizar la transición entre contextos. `scheduler()` se encarga de la planificación de procesos a nivel general, mientras que `sched()` se invoca cuando un proceso cede el CPU (como al llamar a `yield()` en `trap.c` por `usertrap()` y `kerneltrap()`), que manejan interrupciones desde el espacio de usuario y del kernel, respectivamente. También, al finalizar un proceso, `exit()` lo cambia a `ZOMBIE` hasta que el padre invoque `wait()`.

#### La secuencia de una interrupción es la siguiente (involucra cambios de contexto):
```
El hardware nos manda a kernelvec.S (si es un kernel trap.)     
	Se guardan los registros.     
	Salta kerneltrap() en trap.c. (interrupts and exceptions from kernel code go here via kernelvec.)         
		devintr() para definir de que excepcion se trata.             
			Give up the CPU if this is a timer interrupt.             
			Otras acciones.     
	Restaura los registros.  
	
El hardware nos manda a trampoline.S (si es un user trap.)     
	Se guardan los registros.     
	Salta a usertrap() en trap.c (interrupts, exception, or system call from user space. called from trampoline.S.)         
		Salta a kernelvec.S (estamos en kernel.)             
			Mismo proceso anterior.     
	usertrapret() para volver a user space y restaurar los registros.
```


#### 5. ¿El cambio de contexto consume tiempo de un quantum?**
---
   El cambio de contexto si consume quantum. Cuando ocurre una interrupción del timer, el encargado de gestionarla es la función `timervec()` escrita en assembly. Aquí se planifica la próxima interrupción del timer modificando el registro **MTIMECMP** con el quantum actual, luego se modifica un registro de estado **sip** que se refiere a _"Supervisor Interrupt Pending"_. Cuando el sistema quiere definir el tipo de interrupción, si esta es del timer, se limpia el registro **sip**, habilitando el contador del timer a correr nuevamente. Con el tipo definido, en esta caso del timer, se llama a `yield()`, `sched()` y `scheduler()`, en ese orden, para planificar el nuevo proceso. Entonces desde que definimos la interrupción hasta que se planifico un nuevo proceso el quantum ya se redujo.


---

# Puesta en común - Segunda Parte
---

## Experimento 1:
---
### 1. Describa los parámetros de los programas cpubench e iobench para este experimento (o sea, los define al principio y el valor de N. Tener en cuenta que podrían cambiar en experimentos futuros, pero que si lo hacen los resultados ya no serán comparables). 

#### Parámetros:

Los parámetros que utilizamos en los programas son:

El valor de N para todos los experimentos sera 30.

cpubench.c: 
```c
CPU_MATRIX_SIZE 128
CPU_EXPERIMENT_LEN 256
```

iobench.c 
```c
IO_OPSIZE 64
IO_EXPERIMENT_LEN 256
```


### 2. ¿Los procesos se ejecutan en paralelo? ¿En promedio, qué proceso o procesos se ejecutan primero? Hacer una observación cualitativa.

#### Ejecución de Procesos en xv6-riscv

No, los procesos no se ejecutan en paralelo en xv6-riscv. Dado que estamos utilizando un solo núcleo de CPU, solo es posible ejecutar un proceso a la vez. El CPU alterna entre ellos usando un método de planificación similar a Round-Robin, donde se asigna un quantum de 10 ms por proceso. Esto da la ilusión de que los procesos se ejecutan simultáneamente, pero en realidad, son interrumpidos y alternados en secuencia.

En promedio, el cpubench se ejecuta siempre primero ya que es un proceso cpu bound que usa todo su quantum para ejecutar. En comparación, el iobench es un proceso que no utiliza todo su quantum, dada la gran interrupciones que tiene (open, write, close, read). Esto provoca que por mas que el iobench llegue primero el cpubench termina monopolizando el cpu y quedan los iobench planificados para el final. 

![image](https://bitbucket.org/sistop-famaf/so24lab3g18/raw/63f583892407f789cfe75d2b53ec3443e66095b1/Images/Experimento%201/io%2Bcpu(3).png)


### 3. ¿Cambia el rendimiento de los procesos iobound con respecto a la cantidad y tipo de procesos que se estén ejecutando en paralelo? ¿Por qué?

En primer lugar observaremos como se comporta el Benchmark `iobench 30 &` por si solo, para luego comparar estas mediciones con escenarios diferentes sumando la cantidad de procesos que se estén ejecutando.

Los siguientes datos nos indican que en promedio tenemos 44.16 interrupciones por quantum y 11 operaciones por ciclo de CPU.

![io-100K](https://bitbucket.org/sistop-famaf/so24lab3g18/raw/8dcd049c12e92b818c63791995ac408b9fc0d3f8/Images/Experimento%201/io-100k.png)

- iops/tick (promedio): `11.598`
- elapsed_time (promedio)`44.16`
- Quantum: '100,000'
- Ciclos de mediciones: `30`
---

En comparación, en el comportamiento con el Benchmark `iobench 30 &; iobench 30 &; iobench 30 &; iobench 30 &`, se puede ver que la diferencia no es mucha. 
Mientras que en el benchmark anterior (un solo iobench) tiene un promedio de 44.16 interrupciones por quantum, en este, el promedio es de 39.3. Lo mismo pasa con las operaciones por ciclo, mientras que en el primero tenemos 11.59, en el segundo tenemos 13.87.

![io(4)-100K](https://bitbucket.org/sistop-famaf/so24lab3g18/raw/8dcd049c12e92b818c63791995ac408b9fc0d3f8/Images/Experimento%201/io(4)-100k.png)

- iops/tick (promedio): `13.87`
- elapsed_time (promedio)`39.3`
- Quantum: '100,000'
- Ciclos de mediciones: `30`
---

Por último, con un Benchmark `iobench 30 &; cpubench 30 &; cpubench 30 &; cpubench 30 &`, vemos que los resultados finales muestran un decremento en las operaciones por interrupción, y además un incremento pronunciado en la cantidad de _elapsed_time_. 

- iops/tick (promedio): `11.47`
- elapsed_time (promedio)`167`
- Quantum: '100,000'
- Ciclos de mediciones: `30`

Basta observar el siguiente gráfico para ver cuándo es que llega el primer iobench (azul) al scheduler y cuándo termina de ejecutarse.

![image](https://bitbucket.org/sistop-famaf/so24lab3g18/raw/63f583892407f789cfe75d2b53ec3443e66095b1/Images/Experimento%201/io%2Bcpu(3).png)

Lo que sucede, es que, el proceso **iobench** llega en _start_ticks_ = 27.19, mientras que todos los **cpubench** llegan a partir del _start_ticks_ = 27.2. Lo notable es que a pesar de haber llegado primero, se ejecuta una vez finalizados los 90 **cpubench**. Esto es porque los procesos **iobench** no solo tienen interrupciones por quantum, sino que tienen muchas otras interrupciones de **syscall** (escritura, lectura, etc). 

Entonces por cada interrupción, al haber otros procesos los cuales sí utilizan todo su quantum (como lo es **cpubench**), la vuelta al **iobench** inicial se posterga. De esta forma se alarga sustancialmente la ejecución de **iobench** por la "monopolización" de los **cpubench**. Luego del primer **iobench** podemos ver como se normalizan las mediciones para los consecuentes. 

En resumen, el rendimiento del proceso **iobench** no es afectado cuando existen otros del mismo tipo. Sin embargo, cuando también tenemos varios **cpubench** presentes en nuestro Benchmark el resultado es muy diferente. Estos "monopolizan"  la cpu en respuesta de un quantum muy largo. Esto, sumado a la desventaja del **iobench** al tener muchas más interrupciones.


### 4. ¿Cambia el rendimiento de los procesos cpubound con respecto a la cantidad y tipo de procesos que se estén ejecutando en paralelo? ¿Por qué?

Para responder esta pregunta utilizaremos la misma lógica que la anterior, vamos a definir una medición "estándar" para solo un cpubench y luego vamos a comparar este rendimiento con el observado en diferentes escenarios.

Veamos, como eje de comparación un Benchmark `cpubench 30 &`. Notamos que la tabla nos indica que en promedio tenemos `41.23` interrupciones por quanto y un promedio de `13,024.77` operaciones por ciclo de CPU.

![cpu-100K](https://bitbucket.org/sistop-famaf/so24lab3g18/raw/8dcd049c12e92b818c63791995ac408b9fc0d3f8/Images/Experimento%201/cpu-100k.png)

- Benchmark: cpubench 30 &
- iops/tick (promedio): 13,024.77
- elapsed_time(promedio): 41.23
- Quantum: 100,000
- Ciclos de mediciones:30
---

Ahora como metrica del Benchmark usaremos `cpubench + 3 cpubench`.

En este caso notaremos mucha diferencia. Mientras que un **cpubench** tiene una media de 41.23 interrupciones por quantum, al agregar 3 cpubench más a la ejecución,  tienen una media de 120.66. Lo mismo pasa con las operaciones por ciclo, mientras que en el primero tenemos 13,014.77 en el segundo experimento tenemos 4449.87. 

Para entender lo que esta sucediendo recordemos que elapsed_time es una aproximación a los tick que ocurren desde que el proceso inicia hasta que finaliza, _pero no todos los ticks son propios del proceso_. Es decir, esto _aproxima_ el tiempo de ejecución, por lo tanto, al tener muchos cpubench compitiendo por el procesador, cuando uno cede el CPU, tarda muchos ticks en volver a tomar el control del mismo. Esto, sumado a que un cpubench por lo general utiliza todo su quanto. 

En conclusion, cuando se ejecuta un solo cpubench sin competencia, su tiempo de ejecución es rápida. Mientras si se encuentran otros procesos cpubench ejecutando en paralelo, estos compiten por el CPU y el tiempo en volver a ejecutar el cpubench inicial es más alto.

![cpu(4)](https://bitbucket.org/sistop-famaf/so24lab3g18/raw/8dcd049c12e92b818c63791995ac408b9fc0d3f8/Images/Experimento%201/cpu(4)-100k.png)

- Benchmark: cpubench 30 &; cpubench 30 &; cpubench 30 &; cpubench 30 & 
- iops/tick (media): `4449.87`                                                    
- elapsed_time(media): `120.66`                                                   
- Quantum: `100,000`                                                   
- Ciclos de mediciones: `30`    
---
Por ultimo mezclamos la ejecución del cpubench con varios iobench.

Lo que sucedió en este experimento es que las mediciones se acercaron mucho al caso en donde se ejecuta solo un cpubench, esto ocurre por la gran cantidad de interrupciones que tienen los iobench, el proceso cpubench "monopoliza" el CPU nuevamente.

![cpu+io(3)](https://bitbucket.org/sistop-famaf/so24lab3g18/raw/8dcd049c12e92b818c63791995ac408b9fc0d3f8/Images/Experimento%201/cpu%2Bio(3)-100k.png)

- Benchmark: cpubench 30 &; iobench30 &; iobench 30 &; iobench 30 & 
- iops/tick (media): 12,647.00
- elapsed_time(media): 43                                                 
- Quantum: 100,000                                              
- Ciclos de mediciones: 30            

Conculsión:
En resumen, el rendimiento del proceso cpubench no es afectado cuando existen otros proceso iobench. Sin embargo, cuando tenemos varios cpubench el resultado es muy diferente, puesto que estos por lo general ejecutan consumiendo todo su quantum, esto causa que el tiempo de volver a ejecutar un cpubench específico sea mayor, aumentando el walltime.

### 5. ¿Es adecuado comparar la cantidad de operaciones de cpu con la cantidad de operaciones iobound?

No es adecuado comparar la cantidad de operaciones de cpubench con las de iobench, ya que estos tipos de procesos tienen características y comportamientos diferentes. 

La principal diferencia la notamos en las observaciones anteriores. Mientras que cpubench es un proceso que requiere principalmente tiempo de CPU para realizar cálculos, los procesos iobench tienen una mayor cantidad de interrupciones dado que tienen que esperar por operaciones de entrada/salida como leer o escribir en disco. Es decir, una usa mucho menos el CPU que la otra. Comparar la cantidad de operaciones no refleja del todo el rendimiento o tiempo de uso de los recursos dado que el cpubench no depende de operaciones de entrada/salida y el iobench puede pasar mucho tiempo sin usar el CPU.

---
## Experimento 2:
---
### 1. ¿Fue necesario modificar las métricas para que los resultados fueran comparables? ¿Por qué?

Si fue necesario modificar las métricas. En **iobench teníamos** _total_iops / elapsed_time_ y en **cpubench** _total_iops / elapsed_time_. Al reducir el quantum, un proceso ejecuta por menos tiempo, por ende, realiza menos operaciones por tick. Esto nos conduce a un aumento de _elapsed_time_ dada la relación que tiene con los ticks. Al aumentar el valor de _elapsed_time_ las métricas resultantes eran cercanas a 0 y por lo tanto casteadas a 0. Para solucionarlo multiplicamos _total_kops_ y _total_iops_ por mil para que dieran números más grandes. Finalmente al momento de medir es importante dividir por mil para tener el número sin la escala y poder comparar.

### 2. ¿Qué cambios se observan con respecto al experimento anterior? ¿Qué comportamientos se mantienen iguales?

Uno de los cambios más notorios que se observaron fue que al reducir el intervalo de tiempo, hubo una caída muy grande de operaciones por tick. Esto tiene sentido, ya que al tener menos tiempo para ejecutar, es menor la cantidad de cosas que se pueden hacer. Este fenómeno se puede ver reflejado en las mediciones resultantes de un mismo Benchmark, pero con un quantum decreciente. 

**Experimento con iobench**
A partir de las mediciones que fueron tomadas, y al observar los graficos podemos llegar a la siguient conculsion:

Un quanto cada vez más chico perjudica a `iobench`, ya que se realizan menos operaciones por tick y aumenta el tiempo de ejecución.

![io Image 1](https://bitbucket.org/sistop-famaf/so24lab3g18/raw/02267f7fd0bdbf67801fd0db02c5ddbc9733c21c/Images/Experimento%202/IO%20Quantum%20%3D%20100%2C000.png)
![io Image 2](https://bitbucket.org/sistop-famaf/so24lab3g18/raw/02267f7fd0bdbf67801fd0db02c5ddbc9733c21c/Images/Experimento%202/IO%20Quantum%20%3D%2010%2C000.png)
![io Image 3](https://bitbucket.org/sistop-famaf/so24lab3g18/raw/02267f7fd0bdbf67801fd0db02c5ddbc9733c21c/Images/Experimento%202/IO%20Quantum%20%3D%201%2C000.png)


| Quanto               | 100,000      | 10,000       | 1,000        |
| :------------------- | :----------- | :----------- | :----------- |
| Benchmark            | iobench 30 & | iobench 30 & | iobench 30 & |
| iops/tick (media)    | 11.598       | 1.09         | 0.046        |
| elapsed_time(media)  | 44.16        | 468.6        | 10973.26     |
| Ciclos de mediciones | 30           | 30           | 30           |




**Experimento con cpubench**

![cpu Image 1](https://bitbucket.org/sistop-famaf/so24lab3g18/raw/02267f7fd0bdbf67801fd0db02c5ddbc9733c21c/Images/Experimento%202/CPU%20Quantum%20%3D%20100%2C000.png)
![cpu Image 2](https://bitbucket.org/sistop-famaf/so24lab3g18/raw/02267f7fd0bdbf67801fd0db02c5ddbc9733c21c/Images/Experimento%202/CPU%20Quantum%20%3D%2010%2C000.png)
![cpu Image 3](https://bitbucket.org/sistop-famaf/so24lab3g18/raw/02267f7fd0bdbf67801fd0db02c5ddbc9733c21c/Images/Experimento%202/CPU%20Quantum%20%3D%201%2C000.png)

| Quanto               | 100,000      | 10,000       | 1,000        |
| :------------------- | :----------- | :----------- | :----------- |
| Benchmark            | cpubench 30 &| cpubench 30 &| cpubench 30 &|
| iops/tick (media)    | 13,024.77    | 1,215.00     | 14.71        |
| elapsed_time(media)  | 41.23        | 441          | 36598        |
| Ciclos de mediciones | 30           | 30           | 30           |



**Otra observación**

Otra observación es que con un quantum establecido en 10k se vuelve más justo para con los procesos **iobench**, permitiendo que se ejecuten con más frecuencia intercalandose con las ejecuciones del **cpubench** (que suele monopolizar el cpu). Lo cual se puede observar con el siguiente gráfico:

![Segunda Observacion](https://bitbucket.org/sistop-famaf/so24lab3g18/raw/45ad04734b7350d221e8e68166d9687ffc7247bd/Images/Experimento%202/Segunda%20Observacion.png)

### 3. ¿Con un quatum más pequeño, se ven beneficiados los procesos iobound o los procesos cpubound?

Con los siguientes gráficos podemos ver el comportamiento del planificador ante dos Benchmark iguales, pero con un número de quantum distinto.

![Pregunta 3, Q=100K](https://bitbucket.org/sistop-famaf/so24lab3g18/raw/c5ce0f0d27bb9def845994fb32510bbb2414f05b/Images/Experimento%202/Pregunta%203%20Quantum%20%3D%20100K.png)
![Pregunta 3, Q=1K](https://bitbucket.org/sistop-famaf/so24lab3g18/raw/c5ce0f0d27bb9def845994fb32510bbb2414f05b/Images/Experimento%202/Pregunta%203%20Quantum%20%3D%201%2C000.png)

#### Caso 1 (Izquierda)
---
- Benchmark: iobench 30 &; cpubench 30 &; cpubench 30 &; cpubench 30 &			
- kops/tick (promedio): 11.47			
- elapsed_time(promedio): 167			
- Quantum: 100,000			
- Ciclos de mediciones: 30			


#### Caso 2 (Derecha)
---
- Benchmark: iobench 30 &; cpubench 30 &; cpubench 30 &; cpubench 30 & 
- kops/tick (promedio): 0.02                                                    
- elapsed_time(promedio): 25729
- Quantum: 1,000           
- Ciclos de mediciones: 30

Viendo ambos gráficos, se puede decir que en un quantum mas pequeño los procesos `iobench` comienzan a ser planificados de una manera más “justa” con respecto a los procesos `cpubench`. Generando así una especie de fenómeno donde el planificador es más “interactivo” ya que no existen procesos de CPU-bound corriendo todo el tiempo "monopolizando" el CPU. Vemos que la planificación es distinta porque se intercalan más los procesos de distinto tipo. Al final siempre se terminan ejecutando todos los `iobench` primero y después los `cpubench`.

Entonces concluimos que un quantum más pequeño beneficia principalmente a los procesos IO-bound, permitiéndoles un acceso más frecuente a la CPU para manejar sus operaciones de entrada/salida. Los procesos CPU-bound, en cambio, se ven afectados negativamente por un quantum reducido, ya que experimentan más interrupciones, aumentando así su tiempo total de procesamiento.


# Puesta en común - Tercera y Cuarta Parte

Luego de implementar el nuevo planificador MLFQ y de volver a correr todos los experimentos realizados anteriormente con RR, las conclusiones a las que llegamos no fueron las esperadas.

Para dar contexto sobre cómo fue la implementación de nuestro MLFQ, decidimos agregar dos nuevos atributos a la estructura de los procesos: uno de prioridad y otro al que llamamos `times_chosen`. Este último indica la cantidad de veces que se planificó cada proceso. En base a esto, el MLFQ seleccionará aquel proceso con máxima prioridad y menor cantidad de ejecuciones.

Nuestra expectativa ante la implementación del MLFQ era que, dada la ejecución de un benchmark que combina tanto iobench como cpubench, encontraríamos un comportamiento distinto al de Round Robin.

### ¿Qué mostraron los resultados?

Cuando corrimos cpubench 30 e iobench 30, ambos por separado, notamos un comportamiento que se asemeja al de RR. Concluimos que, con estos benchmarks, la prioridad es trivial, ya que se ejecuta un único proceso. Lo mismo se puede concluir al correr varios procesos del mismo tipo todos en paralelo, dado que todos tendrán la misma prioridad.

Los benchmarks de interés son aquellos que mezclan distintos tipos de procesos en paralelo:

- Benchmark 1: `cpubench 30 &; iobench 30 &; iobench 30 &; iobench 30 &`

- Benchmark 2: `iobench 30 &; cpubench 30 &; cpubench 30 &; cpubench 30 &`

En las mediciones con estos benchmarks, al experimentar con quantums altos, obtuvimos planificaciones muy similares a las de RR. Aquí existían momentos en los que tanto los procesos cpubench como los iobench tenían la misma prioridad. Sin embargo, el valor de `times_chosen` de los iobench era mayor, por lo que se planificaban los cpubench.

| PID | State  | Name      | Priority | Times Chosen |
|-----|--------|-----------|----------|--------------|
| 1   | sleep  | init      | 2        | 16           |
| 2   | sleep  | sh        | 2        | 14           |
| 10  | run    | cpubench  | 0        | 572          |
| 5   | runble | iobench   | 0        | 1564         |
| 7   | runble | cpubench  | 0        | 571          |
| 9   | runble | cpubench  | 0        | 571          |

Si bien los cpubench se ejecutaban usando todo su quantum, la diferencia de los `times_chosen` en los iobench era notablemente mayor en todos los casos. Por lo tanto, se puede ver que los cpubench sufren de *starvation*: se ejecutan primero, pero se planifican mucho tiempo después. Esto no solo nos confirma que hay *starvation* presente, sino que la implementación del MLFQ funciona ante la diferencia en la cantidad de ejecuciones.

Como consecuencia de las condiciones anteriores, vimos que por la naturaleza del proceso iobench, al ser "interactivo", requiere muy poco quantum en el CPU. Una vez realizado lo que necesita, se pone en estado *sleeping* hasta recibir el "input" esperado. Durante este tiempo, los únicos procesos que se encuentran en *RUNNABLE* son los cpubench. Entonces, son rápidamente planificados por el MLFQ y, hasta no terminar de ejecutarse, usan la totalidad de su tiempo de quantum. Durante este tiempo, los iobench pueden haberse puesto en *RUNNABLE*, pero esto no quita el hecho de que los cpubench sufran *starvation*.

Estas diferencisa ante planificación de proceso IO-bound y CPU-bound evidencia que, si bien el MLFQ es efectivo en priorizar según cantidad de ejecuciones y tipo de proceso, aún es propenso al starvation de procesos CPU-bound en algunos casos. Para mejorar este comportamiento, sería útil una implementación con colas de prioridad o exploración de métricas adicionales, lo cual permitiría un balance más justo entre procesos interactivos y de CPU, favoreciendo el "fairness" en el tiempo de CPU asignado a cada tipo de proceso.
