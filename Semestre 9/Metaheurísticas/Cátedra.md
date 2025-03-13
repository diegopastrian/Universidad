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