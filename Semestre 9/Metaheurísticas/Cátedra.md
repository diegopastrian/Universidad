## Clase 6 de Marzo
Con info del pasado tomo decisiones para resolver el problema. Mirar hacia el futuro (dada solución parcial, que efecto hay en solución futuras.)
- **A star**
- MCTS

- **Heurística**: Función que evalua posibles decisiones y se toma la mejor. Solamente observa lo del momento sin ver más allá. (NO hay aprendizaje) Hechas para un problema en particular.
	- Necesita más tiempo y recursos al ser una técnica **completa**.
	- Árboles.
- **Metaheurística**: Más general, se puede aplicar más allá al no fijarse únicamente en la foto del momento. Pertenecen a un grupo de técnicas llamadas *incompletas*.
	- Busca soluciones aproximadas.
	- NP-Hard: Problema muy complejo que por complejidad necesita de la metaheurística para poder resolverse (estos no son determinísticos en tiempo polinomial).

##### Tipos de problemas:

- **Problemas Combinatoriales**: Optimización y satisfacción con restricciones. Las variables toman valores discretos.
- **Problemas Continuos**: Las variables son "infinitos" 
- **Sin restricciones**: (ejemplo: Gradiente descendiente en funciones de costo).

## Clase 10 de Marzo

**Soluciones**:
- Exactos/completos: Mejor solución Posible
- MH/Incompletas:: Buena solución.

**Modelamiento**:
- Variables (con dominio definido)
- Restricciones
- Función objetivo 
**Espacio de búsqueda**
- Cantidad de soluciones posibles (factibles o infactibles)
## Clase 13 de Marzo
### Repaso CSP:
Problema de **Satisfacción de Restricciones**.
- Ejemplo:
	- N-Reinas: Problema famoso y muy utilizado para probar técnicas de IA. 
		En un tablero NxN, N reinas de tal manera que no se ataquen entre ellas.

### Proceso de búsqueda
- Búsqueda Completa:
	- Se explora espacio de búsqueda del problema de manera **exhaustiva y ordenada**.
	- El proceso termina cuando:
		- Se encuentra solución o todas (CSP), la óptima (COP)
		- Se demuestra que no existe solución
		- Se agotan recursos computacionales
		- Hay un timeout
#### Árbol
##### Elementos presentes:
- **Estado inicial**: nodo raíz, ejemplo: tablero vacío sin reinas.
- **Estado**: Nodo que repersenta la "foto" del momento de búsqueda. Nodos no-hoja representan soluciones incompletas.
- **Acciones**: A partir de un estado, que conjunto de acciones se pueden realizar. Estas podrían tener costo asociado, generan nodos hijos.
- **Nodos hojas**: Si cumplen con las restricciones del problema, serían soluciones.
#### Backjumping: 
- Problema:
	- La primera asignación es incompatible con todas las decisiones posteriores.
	- Se generan nodos innecesarios en búsqueda (Thrashing)
- Solución: Técnicas Look-Back 
	- Hacer saltos hacia atrás más eficientes (Backjumping)
	- Salta a una variable responsable del bloqueo
	- No enumera algunas asignaciones parciales que no conducen a posible solución
##### Backjumping dirigido por conflictos (CBJ):
- Salta a variable responsable del bloqueo.
- No enumera algunas asignaciones parciales que no conducen a la solución
- Para cada variable 
- Ejemplo, imaginando como un árbol las decisiones tomadas:
	- En las reinas, ubico la primera reina.
	- **Conjunto conflicto**, variable que bloquea a las demás de tomar cierto valor. Se toma la más variable prematura si dos variables chocan en lo mismo.
	- **Vacío de dominio**: No puedo asignarle un valor a una variable.
	- **DeadEnd**: Camino sin salida, no se puede hacer nada más por ese camino.
	- En ese caso, me devuelvo al paso anterior y cambio esa variable para cambiar las variables que están siendo bloqueadas. (Reduzco la cantidad de asignaciones que no me llevarán a una solución).

## Clase 17 de Marzo

### Forward Checking

- Esta técnica mira hacia **Adelante**.
- Reducir los dominios de las variables que aún no tienen un valor. -> Disminuye el **trashing**.
- Hay más checkeos: Se realizan más pruebas.
- Se podría combinar con otros algoritmos.
	- Por ejemplo con CBJ: Se reduce el dominio hacia adelante, al llegar a un deadend, se hace el salto a la variable con conflicto. 
- Depende del tiempo de CPU.

### MFC: Lazy Forward Checking

Realiza lo mismo que Forward checking. Al encontrar el primer valor factible, inmediatamente continúa hacia la siguiente variable.
- Es un algoritmo completo.

### Orden de instanciación

El orden en el cual son instanciadas las variables afecta el tamaño del árbol de búsqueda.
 -> Desempeño del algoritmo de búsqueda.
 - **Heurísticas de selección de variable**: Procedimiento generalmente no costoso computacionalmente para seleccionar la siguiente variable a ser instanciada.
	 - En general están basadas en la premisa **fail-first** “Para tener éxito, se debe intentar primero en donde más probablemente se fallará”.
	 - Offline: Se realiza el proceso antes de la búsqueda.
	 - Online: Se realiza el proceso durante la búsqueda. te amo 
	 - **Ejemplos**:
		 - Seleccionar la variable con menor dominio.
		 - Seleccionar aquella con más restricciones.
- **Técnicas de Preproceso**:
	- Restricción BINARIA: tiene dos variables.
	- Restricción UNARIA: una variable.
	- Nodo consistencia: Para toda restricción unaria, los valores cumplen con la restricción.
		- **Ejemplo:**
			- *Restricciones*:
				- $x_2$ > 1
				- $x_1 + x_2$ > 5
			- *Dominio variables*:
				- $x_1 : \{2,3,4,5,6\}$
				- $x2: \{0,1,2,3\}$

## Clase 20 de Marzo 
Espacio de búsqueda continuo: $x_{1} \in [0,1]$
### Interval Branch & Bound
- Aproximaciones de punto
- Computadoras no tienen precisión infinita decimal -> aproximaciones de punto flotante.
-  Si hay solución óptima, esta se encuentra en un **intervalo de precisión arbitraria**.
	-  Esto quiere decir que la solución se encuentra en tal intervalo.
- Cada nodo del árbol tiene un valor limite superior(UB) y uno inferior(LB). En función de esos límites, el método va descartando ciertas ramas del árbol.

**Bisección**
- Dividir el dominio de algunas variables por la mitad. Se crean dos nuevos nodos.
- Solo hay métodos heurísticos para esto. Ven información parcial del problema para elegir la variable a bisectar
	- *Largest-first:* Dominio más grande
	- *Round-Robin:* Van en orden
	- *Smear-Based:* Miden el impacto de las variables en el problema

**Filtrado**
Elimina desde los bordes del intervalo, valores que no son parte de alguna solución.
- Tambien pueden eliminarse nodos que con seguridad no ayudarán a encontrar un mínimo más pequeño que el actual.

**Upper bounding**
- En cada nodo busca soluciones factibles, mínimos locales.
- En general se utilizan métodos de búsqueda locales por el costo computacional.
- *En el área*: Uso de técnicas iterativas de búsqueda local y metaheurísticas como: Simulated Annealing, PSO y paralelización con threads.

**Selección de nodo**
- Elegir alguno de los nodos y procesarlo con los métodos anteriores.
- Al igual que con bisección, se utilizan métodos heuristicos. Por ej minLB.
- Mejora de lo anterior, FeasibleDiving (minLB + Búsqueda en profundidad)
- *En el área:* Técnicas de aprendizaje por refuerzo para seleccionar la heurística más adecuada (hiperheurísticas)

### Beam Search
- Técnica incompleta.
- Adaptación de búsqueda de árbol: solo los nodos más prometedores se consideran.
- **¿Cómo se eligen los $W$ mejores?**
	- Depende del problema. 
	- **Greedy:** Llega a una solución, evaluando qué tan prometedora es esta solución parcial.
	- Doble refuerzo.