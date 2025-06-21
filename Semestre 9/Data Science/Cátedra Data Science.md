## 6 de Marzo 
La ciencia de datos es utilizar grandes vólumenes de datos para solucionar problemas. Encontrar patrones y tendencias y ayudar en la toma de decisiones de un negocio.
- Esta engloba 
- Campo interdisciplinario que usa técnicas específicas de las estadisticas y la ciencia de computación para sistematicamente extraer conocimiento de los datos.|

## 10 de Marzo
Aprendizaje reforzado: Los datos retroalimentan al modelo para que siga ajustándose.
### Frameworks
Formas de ordenar el trabajo.

- **KDD:** Knowledge Discovery in Databases. Enfocado en los datos.
	- Selección de datos.
	- Procesamiento. Limpiar y preparar la data.
	- Transformación. Se refiere al formato de la data.
	- Data mining. Usar algoritmos que permiten descubrir patrones, relaciones o tendencias en los datos.
	- Evaluación/Interpretación. 
	
- **OSEMN:**
	- Obtain: Obtener la data
	- Scrub: Limpieza de la data
	- Explore: explorar patrones y tendencias significativas.
	- Model: Se construye el modelo que permite predecir.
	- Interpret: Análisis de resultados. 
	
- **CRISP-DM**: Enfocado en el problema.
	- Business Understanding: Definir objetivos del negocio.
	- Data Understanding: Recopilar datos iniciales.
	- Data Preparation: Limpiar datos.
	- Modeling: Crear modelo.
	- Evaluation: Analizar resultados.
	- Deployment: Implementar modelo en un entorno real.
	
- **ML-Life Cycle:**
	1->2->3->4->5->1 ...
	- Project Scope
	- Data Preparation
	- Model Development
	- Model Deployment
	- Model Monitoring and maintenance

Hay veces donde datos son insuficientes y eso requiere devolverse al comienzo.

### Roles en la industria.

- **Data scientist**
	- Encargado de todo el flujo, análisis de un proyecto ML. Recibe la data para sus análisis desde los Data Engineer y lo entrega al cliente con su interpretación.
	
- **Data Architect**
	- Arma el stack tecnológico y arquitectura de soluciones técnicas de Machine Learning. Escasos.
	
- **Data Engineer**
	- Entra en la parte inicial de un proyecto. Provee a los DS de datos necesarios para desarrollar el proyecto. Mantiene pipeline y datos en explotación. Se encarga del deployment de modelos en producción.
	
- **Statistician**
	- Matemáticos y no informáticos. Suelen trabajar con el resto del equipo.
	
- **Data Science Manager**
	- Hacer hablar y trabajar a todo el resto de personajes. Suele ser un DS con más experiencia con formación en administración de equipos.

- **Machine Learning Engineer**
	- Modelador de ML.
	  
- **Data Analyst**
	- Realizar análisis que no requieran de un modelo ML. Encargado de la visualización en Dashboards o proveer datos al resto de la organización.
	  

## 13 de Marzo

### Obtención de Datos en Frameworks de Data Science
#### Fuentes de datasets: **-5 décimas proyecto**
- Kaggle
- UCI Machine Learning Repo.
- AWS
#### Fuentes Nacionales Gubernamentales: **+0 puntos Proyecto**
#### Crear o diseñar fuentes de datos propias: **+5 décimas proyecto**
- WebScrapping
- BDD de la Empresa/institución
- Cámara en su bolsillo

## 17 de Marzo
### Tipos de Datos
- Datos **Categóricos**:
	 Valores que representan etiquetas, categorías o grupos.
	- *Ordinales*: Tienen orden o jerarquía.
		- Por ejemplo: nivel de educación, nivel de satisfacción
	- *Nominales*: No tienen un orden específico.
		- Por ejemplo: color favorito, nacionalidad.
- Datos **Numéricos**:
	  Valores que representan cantidades o medidas.
	- *Continuos*: Pueden tomar cualquier valor en un rango.
	- *Discretos*: Valores enteros.

### Problemas con los Datos
#### Datos Faltantes:
- **Missing Completely At Random (MCAR):**
	- Data perdida distribuida de forma uniforme, por ende no se relaciona con otras variables del dataset.
	- *Posible solución:*
		- Eliminar observaciones (Eliminar la fila completa)
		- Imputar una medida de tendencia central (Media, Mediana, Moda)
- **Missing at Random (MAR)**:
	- Datos sesgados, la data perdida no se distribuye de forma aleatoria.
	- Por ejemplo: IQ Score por edad, de los 25 a 31 años no hay datos (no se realizó preguntas a tales edades).
	- *Posible solución:*
		- Imputar usando la info. de las otras variables.
			- Máxima Verosimilitud
			- KNN
- **Missing NOT at Random**:
	- Datos faltantes por razones relacionadas con el valor mismo de al variable
	- Data perdida difiere sistemáticamente de datos observados y es no-ignorable.
	- *Posible solución:*
		- Marcado AD-HOC
		- Depende...
		- Encontrar más data.

#### Datos incorrectos
- **Datos fuera de rango (OOR)**:
	- Dato falso, incorrecto. El outlier es un dato REAL.
	- Observaciones imposibles que se dan porque están fuera del espacio definido para la variable.
	- Edades negativas, o muy grandes.
	- *Diagnóstico:*
		- Umbral de máximo/mínimo teórico
	- *Solución:*
		- Tratar como un missing value
		- Imputación iterativa (LGBM - K-NN)
- **Data Ruidosa**
	- Para imágenes:
		- Blur
		- Frequencial
		- Sobre/bajo exposición
		- Gausiano
	- De una imagen muy ruidosa se puede llegar a una real mediante IA.
	- Se entrena el modelo con imagen para ensuciarlas.
 - **Inconsistencia de Formato**
	 - Excel como un problema.
	 - Se diagnostica con la caída del código.
	 - *Solución:*
		 - Diccionarios
		 - Jugar con Python
#### Datos inútiles
- Features completamente concentrados
- Outliers unidimensionales y multidimensionales
- Skewed numerical features
- Colinealidad entre features
- Information Leakage
- **Features 100% concentrados**
- Aquellas variables que no contienen información relevante deben ser eliminadas del dataset.
	- Ejemplo: En el caso de la tabla, la universidad no tiene sentido porque no aporta información relevante respecto a las notas.

| **Alumno** | **Universidad** | **Horas de Estudio** | **Notas** |
| ---------- | --------------- | -------------------- | --------- |
| Diego      | UDP             | 12                   | 70        |
| Tobias     | UDP             | 10                   | 70        |
| Jorge      | UDP             | 8                    | 65        |
| Iván       | UDP             | 9                    | 66        |
| Renato     | UDP             | 4                    | 40        |

- **Outliers unidimensionales y multidimensionales**
	- Son datos atípicos.
	- No son datos inútiles. En algunos casos es exactamente lo que se busca.
	- Diagnóstico unidimensionales:
		- Visual con boxplots
		- IQR
	- Posible solución:
		- Eliminar la variable
		- Mantener y tener cuidado con las normalizaciones (ej. min_max_scaler).
## 20 de Marzo
#### Datos inútiles
- **Features concentrados**: Eliminar variables sin información relevante.
- **Outliers**: Datos atípicos, pueden ser útiles. Diagnóstico con **boxplots** y **IQR**. Posibles soluciones: eliminar o mantener con precaución (ej. **min-max scaler**).
- **Skewed numerical features**: Proximamente...
- **Colinealidad**: Variables independientes muy correlacionadas entre sí.
- **Information Leakage**: Datos que comprometen el modelo.

### Features 100% concentrados
Eliminar variables que no aportan información relevante (Ej. universidad en la tabla siguiente).

| **Alumno** | **Universidad** | **Horas de Estudio** | **Notas** |
| ---------- | --------------- | -------------------- | --------- |
| Diego      | UDP             | 12                   | 70        |
| Tobias     | UDP             | 10                   | 70        |
| Jorge      | UDP             | 8                    | 65        |
| Iván       | UDP             | 9                    | 66        |
| Renato     | UDP             | 4                    | 40        |

### Outliers
Son datos atípicos que no siempre son inútiles. Se pueden diagnosticar con **boxplots** o **IQR**. 
Posibles soluciones: 
- Eliminar la variable.
- Mantener y normalizar con **min-max scaler**.

### Multicolinealidad
Ocurre cuando variables independientes están correlacionadas. Correlación no implica causalidad. El coeficiente de correlación está en el rango $[-1, 1]$. La fórmula es:

$$
P_{xy} = \frac{\text{desviación}(xy)}{\text{desviación}(x) \times \text{desviación}(y)}
$$

**-1** indica correlación negativa perfecta, **1** correlación positiva perfecta y **0** ninguna correlación.
- Características muy correlacoinadas entre sí. 
Si dos variables muy correlacionadas están presentes, no se sabrá a cuál echarle la culpa del resultado final de tal dato.

### Information Leakage
En un modelo supervisado, $Y = F(x) + E$, si hay información que se pasa de las $x$ al $Y$ hay info. Leakage.
- Presencia de info. no disponible en el mundo real.
- Esta información "filtrada" puede hacer que el modelo tenga un rendimiento artificialmente alto durante la fase de entrenamiento, pero cuando se aplica en datos nuevos (de prueba o reales), el rendimiento del modelo se degrada significativamente.
- **Overfitting**

## 24 de Marzo

## 27 de Marzo

## 31 de Marzo
### Transformación de los datos
- Preprocesamiento:
	- Borrar filas, limpieza
- **Transformación**:
	- Se agrega información nueva.
#### Variables categóricas nominales
- Al modelo no le sirven estas variables
- De color a:
	- Categoria única Color: green, red, black, orange
	- One hot encoding. Categorías green, red, black, orange. Toman valores [0,1]
		- Puede dropear algun color, debido a [0,0,0,1]. Dummy encoding
	- No supervisado
#### Variables categóricas ordinales
- Original encoding: poor,good,very good, excellent
- Ordinal encoding: 1,2,3,4.
- Target encoding, modelo supervisado: Usar la info que tengo para ocupar el mejor número posible para el modelo. Está dado por una fórmula. Se traduce la palabra a un número que el modelo asocia mejor para acortar la Y.

#### Variables numéricas
- Transformaciones típicas en variables numéricas:
	- Distribuciones asimétricas
	- Normalización y escalamiento
		- Estandarización

#### Feature Engineering
- Crear nueva data.
	- Goods: lo que busco
	- Bads: Lo que no busco
- WOE & IV:
	- WOE: $log(buenos/malos)$ Mide diferencia de proporción
		- Supongamos que tenemos una variable categórica "Edad" (con categorías "Joven", "Adulto", "Mayor") y queremos calcular el WOE para cada categoría con una variable de clasificación binaria ("compró" = 1, "no compró" = 0).
		- Calcular buenos: '1s' y malos: '0s'
		- calcular WOE
	- IV: Determina si una variable 
- Catboost Encoding
- Ser su propio jefe:
	- Uno puede transformar las variables.

### En datos inútiles:
- Atributos numéricos de alta asimetría
	- Box-Cox: transformación para arreglar asimetría
	- Yeo-Johnson. Usan logaritmos ambas

## 7 de Abril
### Machine Learning
- **Supervisado**
	- Clasificación
	- Regresión		
	- Forecasting
- **No Supervisado**
	- Clustering
	- Dimensionality Reduction
#### Modelos supervisados
##### Clasificación
- Diseñado para asignar etiquetas en función de sus características.
- El **límite de decisión** marca el límite para tomar la decisión de la etiqueta a asignar.
- Lineal/No lineal: Tiene que ver con la forma del límite de decisión.
**Random Forest**
- Construye múltiples árboles de decisión aleatorios y combina predicciones para mejorar precisión y reducir sobreajuste.
**Decision Trees**
- Algoritmos de aprendizaje supervisado. Clasificación o regresión.
- Gini index vs Entropy
	- Medidas de impuridad o desorden en un dataset. El arbol de decisión minimiza esto o maximiza la ganancia de info para una mayor precisión en la predicción.
**Gradient Boosting**
- Basado en árboles de decisión, cada árbol aprende de los errores del anterior.
	- Se denominan modelos ensamblados.
##### Regresión
## 14 de Abril
##### Forecasting
 **Series de tiempo**
- Analizar y predecir *Datos Secuenciales*.
- Sus usos:
	- ¿Cómo los meteorólogos predicen el clima?
	- Economía
- Se diferencia de la regresión en que un Y depende de otros Y.
	- Necesito saber del pasado para predecir el futuro.
	- Dada F(x) ->  X: Datos Y del pasado
	- $Y = F(Y_{t-1})$
- **Estacionariedad**
	- Media y varianza se mantiene constante
	- No hay tendencia ni estacionalidad.
	- Autocorrelación constante.
		- Oscilaciones random. 
		- Puntos que se mueven mucho de la tendencia
![[Pasted image 20250414132621.png]]
- Test:
	- Dickey-Fuller:
		- Hipotesis nula: Existe una raíz unitaria en serie temporal y no es estacionaria
		- Hipotesis 1: No existe raiz unitaria en serie temporal y esta es estacionaria
	- KPSS:
		- Hipotesis nula: datos estacionarios
		- Hipotesis 1: Datos no son estacionarios

**Componentes**

Estas series corresponden a la suma de:
- **Tendencia:** Regresión lineal sobre el resultado. Positiva o negativa a lo largo del tiempo.
- **Estacionalidad:** Patrones que se repiten en intervalos fijos dentro de una serie de datos.
- **Ruido:** Información impredecible de los datos que se escapa de conceptos como la tendencia y estacionalidad.

![[Pasted image 20250414133633.png]]

| Modelo                                   | Características Principales                                     | Limitaciones                                                 |
|------------------------------------------|-----------------------------------------------------------------|-------------------------------------------------------------|
| Moving Average (MA)                      | Captura fluctuaciones a corto plazo y suaviza datos             | No modela tendencias ni estacionalidad                     |
| Autoregressive (AR)                      | Usa valores pasados para predecir el futuro                     | No modela ruido aleatorio de manera eficiente            |
| Autoregressive Moving Average (ARMA)     | Captura patrones a corto y largo plazo en series estacionarias | No maneja datos no estacionarios                          |
| Autoregressive Integrated Moving Average (ARIMA) | Maneja datos no estacionarios con diferenciación           | No modela estacionalidad explícitamente                   |
| Seasonal ARIMA (SARIMA)                  | Extiende ARIMA para incluir patrones estacionales              | Puede ser complejo de ajustar por la cantidad de parámetros |
| Exponential Smoothing (SES, Holt-Winters) | Suaviza datos y captura tendencias y estacionalidad de manera flexible | No maneja relaciones entre múltiples variables           |
| Vector Autoregression (VAR)              | Captura relaciones entre múltiples series de tiempo            | Necesita muchas observaciones para ajustar bien el modelo |
| Machine Learning (RNN, LSTM)             | Capta patrones no lineales y dependencias a largo plazo       | Requiere grandes volúmenes de datos y potencia computacional |

- MA: Depende de los Y anteriores
- AR: Depende de los E pasados (errores)
- ARMA: Combinación de ambos.
- ARIMA: 
	- AR+**I**+MA:
		- I: Proceso de diferenciación. Sirve para hacer la serie de tiempo estacionaria.
			- Elimina la tendencia
			- AR y MA asumen serie de tiempo estacionaria.

#### Modelos no supervisados


## Clase 12 de Mayo

Silueta: A más cercano a 1, mejor. 
- Calinsky Harabaz: Métrica que más grande mejor.

### Machine Learning no supervisado: Dimensionality Reduction
- Afecta en la multicolinealidad
- **PCA**
	- Técnica de reducción dimensional que transforma un conjunto de variables correlacionadas en otro conjunto de variables no correlacionadas.
	- Es el más utilizado.
	- Lineal
	- Busca un eje
- LDA
	- Lineal
	- Encontrar ejes para encontrar la máxima separación  entre ambos
- T-SNE
	- Distributed sothcastic neighbor embedding
	- No lineal
- **CNN**
	- No lineal
	- Encoder
		- Convolucional2D( algo ,Relu)
		- Pooling(...)
		- Convoluc(...)
		- Pooling( ... )
		- Flatter( ) -> Entrega algo compacto
	- Decoder


# Clase 8 de Mayo
El **Aprendizaje no supervisado** se utiliza para:
- Clustering
- Reducción dimensional
- Reglas de asociación
## Clustering
No existe un target para este tipo de modelo. Algunos modelos típicos:
- K-MEANS
- Hierarchical clustering
- DBSCAN
- Neural Network Clustering
### Validación del modelo
Claramente al no haber un Y, necesita medir la calidad del modelo de cierta forma.
**Método del codo**
- Se calcula el WCSS para diferentes valores de "k".
- WCSS: Suma de distancias al cuadrado de cada punto al centroide.
- Se busca el codo, el punto de inflexión o codo donde agregar un nuevo cluster no es una disminución significativa en el WCSS.
![[Pasted image 20250621153147.png]]
**Silueta**
- Silhoute score: Mide qué tan bien está cada objeto dentro de su propio cluster comparado con otros. Evalúa qué tan bien está asignado cada punto a su cluster, comparando qué tan "cómodo" está en su grupo versus qué tan "cerca" está del grupo vecino.
	- Calcula la "bondad de ajuste", comparando distancia de un mismo cluster con la distancia entre clusters diferentes.
	- cohesión interna vs distancia al grupo vecino más cercano.
	- Promedio de distancia con puntos del mismo cluster VS centroide de grupo vecino más cercano.
- Interpretación:
	- Valor cercano a 1: Punto bien agrupado. Su distancia a otros puntos de su cluster es menor que la distancia a los puntos de otros clusters.
	- Valor cercano a 0: Cerca del límite entre dos clusters.
	- Valor cercano a -1: Posiblemente se asignó al cluster incorrecto
- El **Gráfico de siluetas** permite visualizar que tan bien formados están los clustrs. Si hay un grosor similar y valores negativos. La linea roja representa la puntuación de silueta promedio de las muestras.
![[Pasted image 20250621153608.png]]

# Clase 12 de Mayo
El **Aprendizaje no supervisado** se utiliza para:
- Clustering
- Reducción dimensional
- Reglas de asociación
## Reducción dimensional
Modelos típicos:
- **PCA**
	- El objetivo de PCA es tomar un conjunto de datos con muchas variables (dimensiones) y encontrar un nuevo conjunto de variables (llamadas **Componentes Principales**) que son "mejores" en el sentido de que capturan la mayor cantidad de información posible.
	- Maximiza la varianza total de los datos.
	- **Scree Plot**: ¿Con cuántos componentes quedarnos? Esto depende de cuanta información da cada componente. Se puede elegir por un metodo del codo, o por porcentaje acumulado. 
	![[Pasted image 20250621163533.png]]
- **LDA**
	- Reducir dimensiones y MAXIMIZAR diferencia entre clases. Necesita saber a qué clase es cada dato (supervisado).
	- Maximiza la distancia entre el centro de distintas clases.
	- Minimiza la varianza dentro de cada clase. 
- **T-SNE**










# Clase 15 de Mayo
- Materia faltante
### Overfitting / Underfiting
- Problema de la forma en que ataco el problema: data train != data test
- **Cross Validation**
	- Iterar sobre el mismo dataset, agarrando distintos pedazos de tal dataset para el testeo en cada iteración.
	- De esto se obtiene un Average Perfomance (Es lo que se puede confiar).
	- cross_vall_score, cross_val_score(model,X,Y,CV=5).
	- **Alto Sesgo**: Underfitting
	- **Alta varianza:** Overfitting

Existe un trade-off entre sesgo y varianza. **CURVA DE VALIDACIÓN**.
- X: Grado de Complejidad del modelo.
	Mientras más complejo sea el modelo o más se ajuste a los datos de prueba, claramente el modelo no tendrá buena validación pero funcionará perfecto para los datos de prueba. En algún punto, existe un mejor rendimiento para los datos de entrenamiento.
![[Pasted image 20250621165654.png]]


- **Learning Curve**
	- X: Cantidad de datos del dataset 
	- Mientras más datos, el modelo es más resistente al overfitting! El punto óptimo podría perdurar y soportar mucha más complejidad del modelo.
	![[Pasted image 20250621170854.png]]
	- Una vez alcanzada la convergencia no sirve agregar más datos. 
- Validation curve vs learning curve


# ? de ?
## Under y OverFitting.
### Overfitting
- Resampling
	- Se eligen subconjuntos random de los datos originales
- Modelo Complejo
	- Disminuir parámetros (tamaño)
- Alta varianza del modelo
	- Utilizar validación cruzada
	- Técnicas de regularización (Lasso y Ridge)
	- Técnicas de ensamblado
	- validación cruzada
	- Entrenar modelo con suficientes datos.
### Regularización
La regularización es una técnica que **penaliza al modelo por tener coeficientes grandes
- Previene Overfitting
- Selección de variables
- Maneja la Multicolinealidad
- Sesgo-Varianza tradeoff:
	- Se introduce sesgo para reducir la varianza.
![[Pasted image 20250621182000.png]]
La linea azul representa un modelo muy complejo, la verde el modelo regularizado. Los datos de entrenamiento tienen un poco más de sesgo. 
#### Fórmula
1. **Función de Pérdida Original (J = MSE):** El objetivo del modelo es encontrar los coeficientes (w) que minimicen esta función de error.
    
2. **Función de Pérdida Regularizada (J = MSE + α·C):** Ahora el objetivo es doble:
    
    - Minimizar el **MSE** (el error de ajuste).
        
    - Minimizar la **Complejidad C** (el tamaño de los coeficientes).
        
3. **El papel de Alpha (α):** Es el **hiperparámetro de regularización**. Es el "dial" que nosotros, como científicos de datos, movemos para controlar el equilibrio.
    
    - α = 0: Sin regularización. El modelo solo se preocupa por el MSE y probablemente sobreajustará.
        
    - α muy grande: La penalización es tan fuerte que el modelo se preocupará más por mantener los coeficientes pequeños que por ajustarse a los datos. Los coeficientes se acercarán a cero, y el modelo será muy simple (alto sesgo), probablemente subajustando.

### Formas de regularizar
- L1: Lasso
- L2: Ridge