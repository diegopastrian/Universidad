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

## Clase 24 de Marzo

### Técnicas de resolución 

Hay dos tipos de técnicas incompletas.

#### - Constructivas
- No requieren  de solución inicial.
- Van construyendo la solución:
	- Asigna iterativamente valores a las variables del problema.
	- Manejan soluciones parciales.
	- A partir de la información disponible, se definen **reglas locales** (técnicas *greedy*, se toman decisiones en base a lo mejor del momento sin pensar a futuro).
##### Greedy
¿Qué se necesita para definirlo?
- Representación: Interpretar la estructura de la solución
- Función de evaluación / miope: Evalúa la opción a realizar.
Puede ser:
- **Determinista**: Llega siempre al mismo resultado a pesar de múltiples iteraciones del mismo algoritmo.
- **Estocástico**: No hay movimiento a la mejor solución, se asigna una probabilidad a las alternativas a partir de una función miope.

#### - Perturbadoras
- Requieren de una o más soluciones iniciales.
- Modifican una solución aplicando movimiento o función de vecindario.

### GRASP
Se basa en *Greedy*.
- un greedy estocástico y algoritmo de búsqueda local.
	- A. Búsqueda local: Se llega a solución, esa la mejoro localmente. Por ejemplo, Hill Climbing.
- En lugar de elegir la mejor alternativa con función miope, se hace ranking de las mejores alternativas y se asigna probabilidad a cada una. Así existe variabilidad en las soluciones.
- Al construir la solución, se mejora con búsqueda local. Si no mejora, se construye una solución nuevamente (Con otra combinación del paso 1).

##  Clase 27 de Marzo

### Metaheurísticas
- Encuentran soluciones aceptables a problemas difíciles en tiempos razonables.
- No garantizan encontrar óptimo global.
- **Exploración(Diversificación)**: Buscar zonas comprometedoras del espacio de búsqueda. 
- **Explotación(Intensificación)**: Centrar la búsqueda dentro de una región particular del espacio de búsqueda

#### Hill Climbing
- Solución única (O de trayectoria). Es una técnica de **explotación**.
- Es perturbativo: 
	- Comienza con una solución inicial (factible o infactible)
	- Esa solución se genera de forma aleatoria o con greedy.
	- Con *operadores de movimiento* se mejora dicha solución.
- Entonces, FO mide la calidad de la solución.
- Se necesita uno (o más) movimientos para recorrer el *vecindario*
	- Criterio para seleccionar variable a modificar
	- Criterio para elegir valor para tal variable a modificar
- Con operadores de movimiento, se mejora tal solución.
#### Hill Climbing Mejor-Mejora
- Inicializar una solución a partir de criterio heurístico o aleatorio.
- Mientras no se cumpla el criterio de parada (No hay mejora, tiempo, iteraciones...)
	- Generar vecindario a partir del movimiento elegido y conservar mejor solución del vecindario como solución actual
- Mostrar solución + Valor FO + tiempo

#### Hill Climbing Alguna-Mejora
- El vecindario de una solución puede ser muy grande.
- En tal caso, solo se genera el vecindario hasta el punto de encontrar la primera solución que mejore la actual.
#### Hill Climbing con Restart
- Puede estancarse en óptimos locales.
- Recomenzar algoritmo con nueva solución cuando se quede estancado.
- Desventaja:
	- Pérdida de información valiosa durante la búsqueda.
- ¿Qué pasa si utilizo este método creando la solución inicial con un greedy determinista?

#### Escapar de óptimos locales
- Además del restart, otra forma es aceptar soluciones que empeoren la calidad de la solución actual.
- El problema es que se puede entrar a un ciclo.
	- Solución: *Tabú Search*
## Clase 31 de Marzo
### Tabu Search

La lista tabú almacena movimientos prohibidos, en cada iteración se elige el mejor movimiento factible no-tabú. 
- Esta lista se actualiza en forma de FIFO.
- Su largo controla la memoria del proceso de búsqueda.
	- corta -> controla áreas reducidas 
	- larga -> controla áreas grandes
- Restricciones tabú: Restringe la busqueda al clasificar ciertos movimientos como prohibidos para evitar caer en soluciones recientemente generadas.
- Criterio de aspiración: Liberar en la búsqueda por medio de función de memoria 

**Pseucódigo**:
Proceso Tabu Search  
	sol-actual = Inicialización  
	lista-tabú = Vacía  
	Mientras (No se cumpla el criterio de parada) Hacer  
		Seleccionar la mejor solución no tabú del vecindario y almacenar como  
		sol-actual, actualizar lista tabú  
		Si (fo(sol-actual) es mejor que fo(mejor-sol))  
			mejor-sol = sol-actual  + tiempo 
	Fin Mientras  
Fin Proceso Tabu Search

Exploración y explotación en TS
- explotar/Intensificar: búsqueda local (elementos de hill-climbing)
- exploracion/diversificación: A través de la lista tabú
- Balance estático: a través del tamaño de la lista tabú.  
	- Lista tabú larga: gran diversificación y poca intensificación.  
	- Lista tabú corta: gran intensificación y poca diversificación. 
primer movimiento importante.
lista tabu permite no mover hacia el mismo lugar
![[Pasted image 20250331120821.png]]
![[Pasted image 20250331121017.png]]
en iteración 3-4 a pesar de estar en lista tabú por criterio de aspiración, como la FO queda mejor que nunca se hace igual el swap (5,4)

## Clase 03 de Abril

### Simulated Annealing

- Incorpora estrategia para impedir óptimos locales.
- Permite movimientos a soluciones que empeoren la FO. Se comienza con "temperatura alta".
	- Soluciones que empeoren la FO pueden ser aceptadas con mayor probabilidad que más tarde cuando la "temperatura disminuye"
	- Soluciones que mejoran la FO siempre son aceptadas.

- **Probabilidad de aceptación**
	- Distribución de Boltzmann:
$$P(temperatura,sol_{nueva},sol_{actual}) = e^{\triangle_{obj}/ T}$$  $$\triangle_{obj} = -|sol_{nueva} - sol_{actual}|$$
	- Valor negativo, siempre implica empeoramiento en la calidad de las soluciones.
	- La temperatura (parámetro), determina la probabilidad de aceptación de soluciones que no mejoran la solución actual.
	- A cierta temperatura, varios intentos de nueva solución son explorados.
	- Cuando se alcanza un estado de equilibrio, temperatura disminuye gradualmente.

- Entonces, ese cálculo sería la probabilidad de tomar una solución que empeora la FO. Hasta que haya condición de equilibrio, 
- ![[Pasted image 20250406195515.png]]
- Ingredientes:
	- HC (representación, evaluación, operadores de vecindario)
	- Función de probabilidad de aceptación (Boltzmann)
	- Temperatura inicial y final.
	- Proceso de enfriamiento
- **Aceptación de movimientos**
	- La probabilidad de aceptar un movimiento que no mejora la solución actual sería
	- $P(\triangle_{obj},T)>R$
	- R: Número aleatorio entre [0,1].
- **Estado de equilibrio**
	- Antes de bajar la temperatura, se requieren ciertas iteraciones para explorar soluciones sobre la temperatura actual  hasta alcanzar un *estado de equilibrio*. 
	- Un número suficiente de movimientos debe ser aplicados. ¿Pero cuantas iteraciones sobre una misma T?
		- **Estático:**
			- Número fijo de iteraciones sobre cada T
			- Por ejemplo, explorar el 20% de la vecindad.
		- **Adaptativo**:
			- La cantidad de iteraciones se ajusta en función de los resultados obtenidos a la temperatura actual.
			- Se puede usar la diferencia del mejor valor $f_h$ y el peor $f_l$ de la FO.
			- $F\_ = 1- e^{- (f_{h}-f_{l}/f_{h})}$ 
			- Y el numero de iteraciones para la siguiente temperatura seria:
				$L = L_{B} + [L_{B}*F\_]$, $L_B$ número de iteraciones definido previamente.
			- Si la diferencia entre $f_h$​ y $f_l$​ es grande, F−F_{-}F−​ será mayor y se explorarán más iteraciones, ya que hay mayor variabilidad en la calidad de las soluciones.
			    - Si la diferencia es pequeña, el sistema está relativamente "estable", y se requieren menos iteraciones antes de bajar la temperatura.

## 7 de Abril
**Algoritmos de Trayectoria**
### ILS
- Solución inicial + Local search
- Perturbo esa solución (movimiento), se hace local search.
- En caso de ser mejor que la inicial, ahora esta queda como la mejor.
- Parecido a GRASP

### LNS
- Destroy and repair.
	- Destroy: Destruye estocásticamente parte de la solución
	- Repair: Reconstruye la parte destruida, el vecindario es definido como las soluciones a las cuales se puede llegar a partir de dicha nueva (incompleta) configuración. Se puede usar método heurístico.
- Así, se podría llegar a algo mejor. 

### Metodología experimental
Toda propuesta debe ser validada de manera cuantitativa, resolución de N instancias, mostrar resultados, comparar con el *estado del arte* y analizar.
- Mencionar características de la máquina utilizada, realizar todos los experimentos en las *mismas condiciones*.
- Validación a través de:
	- Benchmarks de la comunidad, generalmente de distinta dificultad.
	- Generar benchmarks
		- Ser cuidadoso en cómo se muestran los resultados. Porque pueden ser sesgados.
- Cuántas veces se debe ejecutar cada benchmark?
	- Depende, determinista : 1 vez. Estocastico: ?
	- Tests estadísticos -> t-test, wilcoxon, etc.