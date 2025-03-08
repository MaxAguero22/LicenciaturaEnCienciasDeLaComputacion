# Laboratorio 1 - MyBash
---
El siguente repositorio contiene el codigo pertinente al Laboratorio 1 de Sistemas Operativos 2024 del grupo 18. 
Se ha codificado un shell al estilo de bash (Bourne Again SHell) llamado mybash. El programa tiene las siguientes funcionalidades generales:
- Ejecución de comandos en modo foreground y background
- Redirección de entrada y salida estándar.
- Pipe entre comandos


## Dificultades 
---
Durante el desarrollo de este proyecto, uno de los principales problemas que enfrentamos fue el manejo de procesos zombie. 
Para resolverlo, accedimos a la bibliografía que nos proporcionaron en la consigna del laboratiorio. 
Ahí encontramos una función que resultó ser útil, y decidimos adaptarla para que funcionara correctamente en nuestro código.

Gracias a esta adaptación, logramos que el sistema manejara mejor los procesos hijos, evitando que quedaran en estado zombie.

### La funcion que usamos (linea 63, execute.c):
---


```c
if(!pipeline_get_wait(apipe))
    {
            struct sigaction sigchld_action;
            memset (&sigchld_action, 0, sizeof (sigchld_action));
            sigchld_action.sa_handler = clean_up_child_process;
            sigaction (SIGCHLD, &sigchld_action, NULL);
    }
```

## Conclusión:
---
En general, nos pareció un proyecto bastante interesante. 
Una de las cosas que mas nos gusto fue el hecho de tener que desmenuzar el obfuscated. Hasta que nos dimos cuenta de cual era la contraseña,
estuvimos renegando un monton (mas de lo que nos gustaria admitir).

Algo que nos gustó mucho fue la forma en la que se utilizan los descriptores de archivo para manejar las entradas y salidas de los procesos. 
Definitivamente fue una parte del proyecto que nos abrio la cabeza bastante. Nos hizo renegar, pero tarde o temprano lo resolvimos.

