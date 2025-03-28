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
