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
**Espacio de búsqueda continuo**: $x_{1} \in [0,1]$

### Interval Branch & Bound
- **Aproximaciones de punto**
  - Las computadoras no tienen precisión infinita decimal, por lo que se usan aproximaciones de punto flotante.
  
- **Solución óptima**
  - Si existe una solución óptima, esta se encuentra en un **intervalo de precisión arbitraria**.
  - Esto quiere decir que la solución está dentro de un intervalo determinado por la precisión deseada.

- **Árbol de búsqueda**
  - Cada nodo del árbol tiene un valor límite superior (UB) y uno inferior (LB).
  - En función de esos límites, el método va descartando ciertas ramas del árbol.

#### Bisección
- **Definición**: Dividir el dominio de algunas variables por la mitad para crear dos nuevos nodos.
- **Métodos heurísticos**:
  - **Largest-first**: Elige el dominio más grande.
  - **Round-Robin**: Va en orden.
  - **Smear-Based**: Mide el impacto de las variables en el problema.

#### Filtrado
- **Eliminación de valores**:
  - Se eliminan desde los bordes del intervalo aquellos valores que no son parte de alguna solución.
  - También se eliminan nodos que con seguridad no ayudarán a encontrar un mínimo más pequeño que el actual.

#### Upper Bounding
- En cada nodo, se buscan soluciones factibles y mínimos locales.
- **Métodos de búsqueda**: En general, se utilizan métodos de búsqueda locales debido al costo computacional.
  - En el área: Uso de técnicas iterativas de búsqueda local y metaheurísticas como:
    - Simulated Annealing
    - PSO (Optimización por enjambre de partículas)
    - Paralelización con threads.

#### Selección de Nodo
- Elegir un nodo y procesarlo con los métodos anteriores.
- **Métodos heurísticos**: Como por ejemplo, el **minLB**.
- **Mejora**: Feasible Diving (minLB + Búsqueda en profundidad).
- **En el área**: Técnicas de aprendizaje por refuerzo para seleccionar la heurística más adecuada (hiperheurísticas).

### Beam Search
- **Técnica incompleta.**
- Adaptación de la búsqueda en árbol: Solo los nodos más prometedores se consideran.
  
#### ¿Cómo se eligen los $W$ mejores?
- Depende del problema.
- **Greedy**: Llega a una solución evaluando qué tan prometedora es la solución parcial.
- **Doble refuerzo**: Se puede incrementar el valor de $W$ para buscar más opciones.

### Monte Carlo Tree Search (MCTS)
1. **Selección:**
   - Se busca un nodo prometedor dentro del árbol de búsqueda.
   - La evaluación de "prometedor" depende del problema específico.
1. **Expansión:**
   - Se selecciona el siguiente paso a tomar. Este paso se elige aleatoriamente, similar a Monte Carlo.
1. **Simulación:**
   - Se simula el camino a seguir según la elección hecha en la expansión.
   - Se realiza la retropropagación (backpropagation) para actualizar la información del árbol.
1. **Evaluación:**
   - Si el camino resulta ser malo, el nodo pierde relevancia y se considera menos prometedor.
   - La retropropagación convierte a los nodos más prometedores en futuros candidatos a explorar.

Este proceso permite explorar el árbol de manera eficiente, favoreciendo las decisiones más prometedoras con el tiempo.

### A* (A-estrella)

- **Algoritmo legendario de IA** utilizado en planificación de caminos.
- Combina **heurísticas** y **búsqueda de menor camino** para encontrar la ruta más eficiente.

#### Funcionamiento:
- A* es un algoritmo del tipo **"best-first"**, donde cada nodo se evalúa mediante la fórmula:
  $$f(v) = h(v) + g(v)$$
  Donde:
  - **f(v)**: Función de evaluación del nodo.
  - **h(v)**: Heurística, estimación de la distancia restante hasta el objetivo. **No debe sobreestimar**.
  - **g(v)**: Costo acumulado desde el nodo inicial hasta el nodo actual.

#### Explicación de las funciones:
- **h(v)** (heurística): Estima la distancia restante al objetivo. Es importante que no sobreestime el valor real para evitar soluciones incorrectas.
- **g(v)** (costo acumulado): Es la distancia recorrida desde el nodo inicial hasta el nodo actual.

#### Propiedades:
- A* balancea entre el **costo del camino recorrido** (g(v)) y la **estimación de la distancia al objetivo** (h(v)), asegurando que siempre encuentra el camino más corto y eficiente.

## 