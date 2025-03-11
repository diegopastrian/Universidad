ot- Pesos livianos! son muchos datos y las partículas no pueden ser tan pesadas. Además se necesitan muchas partículas. NO puedo hacer datos muy complejos pero igual debo tener cantidad razonable para tener una distribución probabilística. **Estimo el estado y corrijo con las mediciones.**
#### Filtros de Kalman

Algoritmo utilizado para estimar el estado de un sistema dinámico en tiempo real a partir de una serie de mediciones ruidosas. 
Los uso cuando quiero intuir el valor de la variable( Ejemplo : posición X ).
Importante: propiedad markoviana, toda la información anterior se concentra en mi estado anterior.
	
Ecuaciones del modelo:
$$
(1)  x_k = a_{x_{k-1}} + B_{u_{k-1}} + w_{k-1}
$$
$$
(2)  z_k = h_{x_k} + v_k
$$
$w_{k-1}$ y $v_k$ son ruido en el modelo. Las formulas se refieren a: 
		(1) Dinámica del sistema ( estado, predictora )
		(2) Distribuciones (mediciones, correctora)
Miro el estado real y las mediciones. En base a esas dos campanas de gauss, puedo decidir donde podría estar. 
 - Multimodal -> particulas
La $K_k$ (Multiplicador de Kalman) es la clave. Configura el algoritmo y define qué tiene más importancia que otra cosa. ¿Me dirijo por la estimación o la medición?                                                              
## MLE

- Se trabaja con una muestra de los datos. 
- control: probabilidades + primera parte filtros (monte carlos, particulas)
 
 
## Algoritmos

###### IA: Rama de la computación que persigue simular, en maquinas (o sistemas), la inteligencia humana.

##### Aprendizaje:
- Proceso que conduce a la adquisición de conocimiento, asociado a un dominio particular.
- Dicho proceso sigue una metodología.
- Pueden haber factores externos (o no).
- Se pueden implementar algoritmos que automaticen y/o emulen este proceso de aprendizaje.
- La efectividad de resultados por algoritmos es MEDIBLE (calcular error).
- Poca intervención humana es valorable.

Modelos se resumen en aprendizaje:
- supervisado
- no supervisado
- semi supervisado
- reforzado

Y las orientaciones de los algoritmos:
- Clasificación
- Predicción

Clustering: agrupar.
### Algoritmo K-means

Centroide: Punto que no necesariamente es un dato, que sí puede representar a un grupo de datos.

K promedios. Agrupación de datos bajo lo que se llama un cluster. Algoritmo NO SUPERVISADO. Trabaja sobre datos N dimensionales. No es probabilístico. Hiperesfera dictaminada por el punto más lejano con centro en el centroide inicial.

- Colocar K puntos en el espacio de datos representado por objetos a ser clasificados (centroides iniciales).
- Asignarle a cada objeto un grupo, representado por el centroide más cercano.
- K grupos. Se recalcula la posición del centroide del grupo.
- Se repiten pasos 2 y 3 hasta que centroides no cambien de posición.
#### GMMS

Mezclas de Gausseanas.  Se ve como si fuese una extensión de K-means (Al usar distribuciones, existe componente probabilistica). Pero K-means es rigido a la hora de asignar grupos. Se puede categorizar datos con cierta incertidumbre. 
Volumen N-Dimensional con gausseanas en distintas dimensiones.  
###### EM:
- Adivinar ubicaciones (Centroides, Mu) y formas de grupos (Dada por la mezcla de las gaussianas).
- E: Para cada dato, encuentro pesos que codifiquen la probabilidad de pertenencia a cada grupo.
- M: Para cada grupo, actualizo ubicación, normalizo y forma basado en datos.

#### Mean shift:

- Usa la moda. No se especifica el K, el algoritmo determina cuántos cluster.
- Necesita función $N(x)$ para calculo de vecinos. Vecindad.
- Ventana probabilística o Kernel: $K(x,x')$. Ventana deslizante. Grupo de puntos cercanos según los cuales yo evalúo algo. Compara sacando una característica sobre una zona. 
- Los centroides migran hacia los datos. Tiene lógica ya que aquí se deducen los K. 
Entonces :
Quien está cerca? -> Función M(x): Promedio ponderado.
Con este M(x), saco el x. Para K(x) Se ocupa la media y la desviación estandar.

#### DBSCAN

"Si hay más de N puntos dentro de un radio d alrededor mío, entonces, es una región densa."
HACE UNA PASADA POR TODOS LOS DATOS. 
- Outlayer: lejos de una región densa y que no pertenece a una. No tiene N vecinos.
- Encontrar los puntos a distancia menor de D del punto actual. Se propaga como un "virus".
Cada punto evalúa dentro de esa distancia D.
![[Pasted image 20241011140019.png]]

#### Clustering aglomerativo gerárquiico (AHC).

- A partir de los datos contruyo el arbol que define los clusters. Algoritmo Constructivo.
- Conceptualmente es un chiste.
- Matriz distancia. A medida que agrego un nodo(AB: distancia a-b) al árbol, entonces se borran A y B agregando AB. 

#### Regresión lineal.

- Método de predicción: Tendencia de los datos observados que permite efectuar predicciones.
- Los otros tenían etiquetas discretas, en cambio la prediccion contiene etiquetas continuas. 
- Se supervisa que las tendencias se guíen por respuestas correctas.
- Variables Y: dependientes (etiqueta) / X: independientes(Caracteristicas).
- Minimizar suma diferencias al cuadrado entre valores predecidos/reales (error mínimo).
###### Datos:
Y conocidos continuos. Datos N-Dimensionales. Yo consultaré sobre datos cuyo 'Y' no se conoce, en base a la tendencia se obtiene.

- Contiene parámetros:
	- x: Variable de los datos
	- y: Etiqueta asignada a variable x
	- Relación x-y = y = ax+b
	- función de hipótesis: $H_0 =\theta_0 + \theta_1x$. Estos $\theta$ se actualizan hasta converger a lo largo del algoritmo cambiando la recta. 
	- Función de costo basada en error cuadrático medio.
	
- Gradiente descendiente: A más alto, más aprendizaje entre los puntos. Se busca para $teta_i$ . Se actualizan tales valores. Encontrar mínimo de la función en base a $\alpha$.  
- Se busca escoger el mejor $\alpha$ (tasa de aprendizaje). Son los pasos a dar. Qué tan rápido llego al valor mínimo:

Desventaja: Que sea lineal da una limitación sobre la flexibilidad del modelo.
#### Regresión lineal univariada.

Método de predicción.

- $y = ax+b$
- Rinde mejor con metrica P respecto a tarea T, es decir, con P puedo medir el desempeño. 
- Función de costo:
	$J(\theta_0, \theta_1) = \frac{1}{2m} \sum_{i=1}^{m} \left( h_{\theta}(x^{(i)}) - y^{(i)} \right)^2$
	
	Corresponde a  un "promedio". Busco calcular un error, quiero minimizarlo. 
	
- Cuando hay supra (superindice) se habla de un ejemplo. Uno de los datos con su respuesta correcta:
	- Existen m ejemplos donde cada uno de ellos tiene una entrada $x^{(i)}$ y una salida $y^{(i)}$.
	- $h_{\theta}(x^{(i)})$ es lo cálculado, predicción hecha por el modelo para el $i$-ésimo ejemplo $x^{(i)}$. 
- Como se busca minimizar J, se saca el gradiente y se igual a 0 **(Descenso por gradiente)**, algoritmo iterativo para minimizar $J(\theta_0, \theta_1)$.
	- $\theta_i = \theta_i - \alpha \frac{\partial}{\partial \theta_i} J(\theta_0, \theta_1)$ **->** Regla de actualización general para el descenso por gradiente: 
		- $\alpha$ corresponde a tasa de aprendizaje, controlando la magnitud del paso que se da por iteración.
		- $\frac{\partial}{\partial \theta_i} J(\theta_0, \theta_1)$ mide como cámbia el valor de J al modificar $\theta$.
	Se debe actualizar simultaneamente ambos $\theta$ usando el gradiente.
	- El cálculo del gradiente se realiza en base a:
		- $\frac{\partial}{\partial \theta_0} J(\theta_0, \theta_1) = \frac{1}{m} \sum_{i=1}^{m} \left( h_{\theta}(x^{(i)}) - y^{(i)} \right)$
		- $\frac{\partial}{\partial \theta_1} J(\theta_0, \theta_1) = \frac{1}{m} \sum_{i=1}^{m} \left( h_{\theta}(x^{(i)}) - y^{(i)} \right) x^{(i)}$ 
		Para el gradiente respecto $\theta_0$ se calcula sumando los errores de las predicciones $h$ respecto a valores reales $y$. Para el gradiente respecto a $\theta_1$ es lo mismo pero se multiplica por la entrada $x$.  
	- $\theta_0 := \theta_0 - \alpha \frac{1}{m} \sum_{i=1}^{m} \left( h_{\theta}(x^{(i)}) - y^{(i)} \right)$ **->** Actualización de $\theta_0$ 
	- $\theta_1 := \theta_1 - \alpha \frac{1}{m} \sum_{i=1}^{m} \left( h_{\theta}(x^{(i)}) - y^{(i)} \right) x^{(i)}$ **->** - Actualización de $\theta_1$ 
##### Regresión lineal Multivariada

- Lo mismo pero con **n** variables. 

Error: distancia
#### Regresión Logística

- Se busca un resultado binario. Sigue siendo continuo pero se aplica a clasificaciones.
- Rango entre 0 y 1 que sirve para clasificar algo, sigue siendo regresión ya que existen valores continuos. 
- One vs All: Técnica para lidiar con más clases. Por cada etiqueta, se entrena una regresión logística. 
	- Por ejemplo: Tengo clases 1, 2 y 3. Se aplica regresión logística. Cada regresión indica si el dato es 1 o 0, en base a la probabilidad más alta.
- Función de hipótesis: Sigmoide.
- Función de costo para 1 valor: Depende la etiqueta. Si y=1, si y=0.
- La función de costo está dada por error logarítmico, no por diferencia. 
- Descenso por gradiente: Los $\theta$ se actualizan restándose por su gradiente de la función de costo. 
- También hay un $\alpha$.
![[Pasted image 20241024200923.png]]



## SVM y KNN

Similitudes presentes:
- clustering -> KNN
- regresión -> SVM
### K-Nearest Neighbors (KNN)

Algoritmo de **aprendizaje supervisado** que se basa en la cercanía en distancia de los datos. Sobre los K vecinos más cercanos se realiza una votación, el algoritmo es sensible a K y se recomienda que sea impar.
- La idea es aplicar una votación sobre vecinos más cercanos, ya sea para:
	- **Votación** para aplicar una **clasificación** al dato siendo procesado mediante la moda.
	- Calcular **promedio** para una **predicción** referente a la etiqueta.

El proceso para ejecutar el algoritmo:
###### Proceso para ejecutar el algoritmo KNN
- Cargar los datos.
- Inicializar el valor del parámetro K.
- Leer el dato a procesar (Q).
- Por cada ejemplo (X) en el conjunto: 
	- Calculo distancia **d** entre **Q** y **X** (generalmente euclidiana).
	- En un listado L, se almacena d y su referencia a X.
- Se ordena L ascendentemente por d.
- Se eligen las K primeras entradas.
- Recuperar las etiquetas Y correspondientes a los X
- Si se desea clasificar a Q, se retorna la moda de los Y.
- Si se desea predecir Q, se retorna la media de los Y.

Aumentar mucho a K / disminuir mucho a K -> Menor variabilidad en las respuestas

### Support Vector Machine (SVM)

Algoritmo (típicamente de aprendizaje supervisado) de clasificación/predicción que es similar a la **regresión**. Encuentra un **hiperplano** que logra diferenciar la clasificación de sus datos, buscando que esté a la mayor distancia de los datos de clases distintas (Maximiza el margen entre grupos). Esto ayuda a que sea más fácil trabajar con datos nuevos. 
$Hiperplano: h_{\theta}(x) = \theta\cdot x + b$ 

$\text{SVM:} \begin{cases} y = 1 & h_\theta(x) \geq 1 \\ y = 0 & h_\theta(x) \leq -1 \end{cases}$  , $h_{\theta}(x)$ es el valor de la proyección del dato sobre el hiperplano.

- **Support Vectors**: Datos más cercanos al hiperplano buscado. 
- Los datos se dividen en $y=1$ como clase positiva, $y=-1$ como clase negativa.

## Redes neuronales

Toman como referencia a las redes de neuronas en el cerebro. 

### Tipos de redes neuronales

#### MLP

ANN de primera generación compuesta por perceptrones. Usan entre una y dos capas escondidas. La salida se hace mediante una aproximación de funciones. La cantidad de capas utilizadas depende de lo que se busque.
Una red muy compleja se aproxima a una única capa.
Back propagation.

#### CNN

Imagenes, videos (los frames son imágenes). Trabaja con los pixeles.

Tipo más frecuente de redes que compone el Deep Learning. Tipo base de DNN. Se componen por un conjunto heterogeneo de neuronas organizadas por capas que cumplen una funcion especifica
Se puede interpretar la funcionalidad de cada capa. Se diseñan las redes de acuerdo a funcionalidades necesarias.
- Por detrás se procesan volúmenes de datos plasmandose en pesos. 
- Las relaciones estan preservadas gracias al diseño de la arquitectura. 
- **Convolution Layers**: Procesan los datos de entrada usando kernel/filtro para extraer características importantes. Son patrones específicos en los datos. (Stride, dirigir movimiento. Padding, agregar relleno a la salida). Realiza una matriz a partir de los datos entrantes y el filtro/kernel.

- **Pooling Layer**: Buscan reducir la dimensionalidad de los datos. Trabajan con un tamaño de ventana, se resume la región obtenida de la matriz en base a caracteristicas dominantes e invariantes. Elimina el ruido, puede usar MAx Pooling o Average Pooling.

- **Fully connected Layer**: un MLP que clasifica la data obtenida de capas anteriores. Cada neurona tiene Conexión con TODAS las salidas de la capa previa. La data se aplana(transformacion lineal) y se procesa, usa reemplazo de funciones de activacion (relu, softmax)

#### RNN

Mismo formato que las ANN vistas. Se diferencia en su recurrencia. Permite procesar secuencias y tener **memoria**. Trabaja con datos secuenciales.
- Cada salida en un momento dado depende de la entrada y los estados anteriores.
- Mismas caracteristicas que MLP. 
- Se adapta con Backpropagation **through time**
- Escala muy mal a largas secuencias, explosión y desaparición gradiente.
Ejemplo: traducir.

**LSTM**

- Las unidades Long Short Term Memory LSTM, tienen mecanismo más sofisticado para el almacenamiento. Retienen secuencias más largas al mantener error más constante.
Ejemplo: retiene secuencias más complejas. 
Agrega secuencias de olvido (cosas que no importan). MUcho más complejas que RNN
#### GAN

Dos ANNS (generalmente tipo CNN, entrenadas mutuamente.) se enfrentan. Generadora intenta "engañar" a la Discriminadora. 
- Discriminadora: Clasifica X hacia una etiqueta Y.
- red Generadora: A partir de Y intenta reproducir valores de X.

#### AE

Clase ANN de tipo generativa. Se codifica una entrada obteniendo una representacion comprimida. Se decodifica para obtener representacion aumentada del dato ingresado. Se asemeja a GAN al usar datos nuevos, pero emplea un elemento que trabaja sobre el mismo dato ingresado.
- Sirve para eliminar ruido al entender a reconstruir caracteristicas esenciales.
- Sirve para generar datos realistas. 

#### SOM

Se basan en la localidad de función del cerebro. Aprendizaje no supervisado.
- Toma datos de entrada y organiza los datos en mapa bidimensional
- Cada punto representa una neurona
- La neurona cuya representacion es mas parecida al dato de entrada. Se ajustan los pesos en base a eso.

### ANN tecnologías actuales.

#### KAN
- B-Splines: operan de cierto modo de no causar overfitting.

#### Redes Transformers 

- Para texto. Problemas de olvido y costo significativo en entrenamiento.
- Mecanismo de atención: Consideran palabras claves sin importar distancia. Mejora performance.
- Embedding: Texto en tokens -> valor numerico (captura significado semantico palabras)
- Bloque transformer: Corazón de modelo. Transforma y procesa data.
- Probabilidades de salida: Capas lineales y softmax para realizar predicciones del siguiente token.

**Embedding layer**: Se divide el texto en tokens, cada token se representa en vector, se codifica la info de la posición, se suman las codificaciones de token.

**Transformer block**: Mecanismo de atencion hace que el modelo se enfoque en partes relevantes para capturar relaciones y dependencia en datos. El vector de embedding se transforma en vectores:
- Query (representación vectorial que describe lo que se busca en los datos. Se compara con los vectores key para determinar que parte de la info es mas relevante)
- Key: Describe el contenido de la info de entrada. Es como una etiqueta para la entrada, la query se compara con los key. Puntuacion de similitud para determinar la atención 
- Value: Representa la info a usar en la salida. No afecta puntuacion, pero se ponderan segun pesos calculados.
Luego se aplica self-attention masking, permite que el modelo genere las secuencias enfocandose en lo relevante evitando el acceso a tokens futuros (asegurarse que el modelo no vea info futura mientras predice el sgute token).
Puntuación de atención(Dado por producto punto entre matrices query y key),
masking (prediccion secuencial se oculta info futura estableciendo puntuacion de atencion a valor extremadamente bajo) , softmax(puntuacion de atenciono se convierte en probabilidad)
softmax: Se transforma todo en probabilidad 
SE pasa todo por MLP para mejorar capacidad representacional. 


### Tácticas de eliminación de overfitting

Overfitting (sobre ajuste) es un enemigo. -> en redes neuronales MLP (input / output) sabemos qué queremos procesar y qué salida se espera. Pero, entremedio hay capas intermedias y no se sabe cuántas. 

- ejemplo:
	- capa inicial: 2 neuronas
	- capa intermedia: 3000 neuronas
	- capa final: 4 neuronas
¿Para qué necesito 3000 si solo tengo 2 entradas y 4 salidas? Si entreno se tendrán simplemente algunas con conexiones funcionando mientras otras estarán vacías. Se está sobre-entrenando este modelo pues solo algunas neuronas dan la respuesta, aprendiendo lo más importante de esos datos entrenados sin generalizar.
Entonces, el Overfitting también ocurre cuando el modelo es muy complejo.

- Los pesos se determinan por $Y = \theta^T x$, Si me concentro mucho en un peso, entonces eso afecta al costo, lo que se magnifica por un cuadrado. En resumen, Si una conexión tiene demasiado peso, entonces el costo aumenta.
- SVM: es un castigo cuando hay valores muy cercanos a lo que son los datos.

El **underfiting** sucede cuando un modelo es demasiado **simple**. En lugar de generalizar, el modelo va a memorizar los datos.

## Repaso
control 3: SVM, knn, ann 1 y 2.

- Etiquetas continuas -> predicción
- Etiquetas discretas -> clasificación

##### K-means:

Trabaja con **DISTANCIA**. K promedios. Los K centroides (puntos representantes) se posicionan en el espacio y se mueven hasta una convergencia (ya no hay más movimientos). Se generan **HIPERESFERAS** desde el centroide hasta el dato más lejano.  

- Se le asigna a los datos un centroide en base a su distancia.
- Se mueve el centroide en base al promedio de sus datos asociados.

Es simple, se puede implementar rápido.
##### GMM:

Los puntos tienen cierta probabilidad de pertenecer a algún grupo o no. Existen gaussianas.
##### Mean Shifts:

Función de vecindad $N(x)$ y kernel $K(x)$. Los centroides no son un parámetro, pues estos se calculan en el algoritmo mismo en base a la ***densidad*** de los datos. Detecta clusters con formas arbitrarias según la densidad.
- $N(x)$ permite calcular respecto de un punto una ventana para así ver la densidad de la población en ese radio.
	- $K(x)$ va a calcular el peso de cada punto. Este peso se utiliza para ajustar el centroide hacia las regiones más densas. 


Es más lenta y rigurosa que K-means.
##### DBSCAN:

Distancia y región densa. En base a esto, se infectan los vecinos y existen outliers.
#### AHC:

Algoritmo de arbol creando relaciones en base a distancias. 

##### KNN:

K se eligen y se recomienda que sea impar.  