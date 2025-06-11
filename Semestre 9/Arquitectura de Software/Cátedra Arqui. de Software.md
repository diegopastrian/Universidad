## 7 de marzo

**¿Qué es la arquitectura de Software?**
Definir componentes organizados que permitan satisfacer requerimientos funcionales del cliente. Relaciones de comunicación entre componentes. -IEEE
	
El diseño general del sistema genera problemas estructurales. 
- Definir la estructura (componentes).
	- Componente: Código que implementa un requerimiento funcional.
- Especifica la comunicación entre componentes.
- Plantea **requerimientos funcionales**.
- Plantea **requerimientos no funcionales**.
	- Restricciones técnicas.
	- Restricciones de negocio.
	- *Atributos de calidad*.
		- Performance
		- Escalabilidad
		- Mantenibilidad
		- Confiabilidad
		- Seguridad
		- Interoperabilidad
		- Portabilidad
		- Soportabilidad
		- Verificabilidad
- Abstracción del sistema.
- Tiene distintas vistas:
	- Lógica
	- Proceso
	- Física
	- Desarrollo

**Arquitecto de Software:**
- Habilidades de diseño
- Conocer la tecnología
- Administrar el riesgo
- Promover buenas prácticas de dev
- Puente de comunicación entre equipos dev
- Interfaz cliente/equipo técnico
***
## 11 de marzo
### Requerimientos no funcionales

- **Performance** 
	- Sistema debe tener pocos componentes -> menos relaciones entre componentes.
	- Operaciones críticas concentradas en uno o dos componentes.
	- Disminuir la comunicación entre componentes.
	- Bajo uso de la red y operaciones de entrada/salida.

-  **Escalabilidad**
	- Componentes auto-contenidos
	- Componentes con bajo acoplamiento
	- Crecimiento horizontal
		- Definiendo más instancias de mis componentes
-  **Mantenibilidad**
	*Poder ingresar nuevos requerimientos funcionales sin afectar a los ya implementados.*
	- Componentes auto-contenidos
	- Especificación detallada
	- Componentes reemplazables
	- Evitar datos compartidos
- **Seguridad**
	- A nivel *USUARIO*
		- Autenticación
		- Autorización
			- ¿Qué puede hacer el usuario?
		- Perfilamiento
			- Crear el perfil detallado del usuario(permisos)
	- A nivel *DATOS*
		- Encriptación
		- Integridad
		- No repudio
			- El emisor del mensaje no puede desconocer la acción
			- Firma digital
			- Encriptación{Datos+Hash+Firma digital} -> Más tiempo de procesamiento
## 18 de Marzo

### Soa (Service oriented Architecture)

SOA es una Arquitectura orientada a servicios.
-  Requerimientos | Servicios
-  Arriba los usuarios, abajo quienes satisfacen sus requerimientos.
-  **Servicios:**
	-  Reciben una transacción.
	- Son **independientes** e interactúan entre sí
	-  Estos resuelven los requerimientos funcionales.
	-  Se comunican mediante protocolos.
![[Pasted image 20250318150528.png]]
Si falla el bus, existe un problema.

### Requerimientos no funcionales

- **Confiabilidad**
	- Tiempo en el que el sistema está *disponible*.
	- Sistema es confiable si está SIEMPRE disponible / si se cae, se recupera en el menor tiempo posible.
	- Componentes redundantes:
		- Componentes que hagan lo mismo.
		- En SOA, si IP1 cae, IP2 sigue activo.
	- Facil migración de componentes.
	- Bajo acoplamiento.
	- Control distribuido.
	- Operación activo-activo o activo-pasivo.
		- Activo-Activo:
			- Ambos procesan, si se cae uno el otro que sobrevive sigue procesando.
			- La falla no es de notar (a menos que ambos caigan).
		- Activo pasivo:
			- Dos instancias, una procesa y la otra espera que la copia principal se caiga.
	- 99,999%: Porcentaje de operativididad que tiene que tener un sistema para considerarse confiable (8 horas caido al año).
	
- **Integrabilidad**
	- Integración con otros sistemas.
		- Por ejemplo: autenticación con Google, métodos de pago
- **Portabilidad**
	- Independencia de plataforma.
	- (Según Giadach, no existe).
		- Una VM adecua tal programa para cada SO.

## 21 de Marzo
### Requerimientos no funcionales
- **Soportabilidad**
	- Diagnóstico y corrección de incidencias.
	- integración continua
	- Bitácora de procesos
	- Gestión de logs
	- Documentación actualizada
- **Verificabilidad**
	- Capacidad del sistema de comprobar su propio funcionamiento.

### Arquitecturas de Software Genéricas
- Deben satisfacer los RF
#### Diseño de Software
- **Fase 0** **: Analizar contexto.**
	- Requerimientos funcionales y no funcionales
	- Ambiente Operacional
	- Restricciones
- **Fase 1** **: Estructuración**
	- Identificar componentes y relaciones.
	- Descompone el sistema en un conjunto de componentes.
	- Utiliza un **diagrama de bloques** que muestra la estructura del sistema.
	- Indica flujo de datos entre componentes.
	- Muestra interfaces proveídas por sistema.
	- **Interfaz**: conjunto de métodos y funciones que definen cómo interactúan los diferentes componentes o sistemas entre sí
- **Fase 2** **: Modelo de control**
	- Comportamiento de los componentes
	- Cómo interactúan los componentes 
	- Establece como actúan frente a operaciones de entrada
- **Fase 3** **: Descomposición modular**
	- Diseño detallado más específico

#### Modelos de estructuración
- **Cliente servidor**
- **Arquitectura Orientada a Servicios (SOA)**
- **Modelo de Capas**
- **Modelo Repositorio**
- **Objetos distribuidos**
- **Arquitectura Cloud**

## 28 de Marzo
### 🏦 Ejercicio SOA: Pequeño Banco

#### Definición de las transacciones de cada servicio:
![[Pasted image 20250328144508.png]]
#### Especificación de interacciones entre servicios:
- **Servicio de Giros** ➝ `Consulta de Saldos`
- **Servicio de Depósitos** ➝ `Consulta de Datos`
- **Servicio de Transferencias**  
  - `Consulta de Datos`
  - `Giros`
  - `Depósitos`

⚠️ **Punto único de falla**: Todos los servicios dependen del mismo servicio, lo que puede generar vulnerabilidades en el sistema.
### Modelo Cliente / Servidor
	Cliente != Usuario.
- **Cliente** es un proceso que pide algo. El usuario utiliza este proceso para solicitar servicio al servidor. 
- Un **servidor** es un proceso que responde algo. Ofrecen servicios específicos. Satisfacen RF.
- **Ventajas**
	- Proceso Distribuido
		- No necesariamente cliente y servidor estarán en la misma máquina.
	- Datos distribuidos
	- Escalable
- **Desventajas**
	- Datos no compartidos
	- Administración de datos en cada Servidor
	- Performance deteriorizada
		- Puede depender de la red y la distancia física.
	- No hay registro centralizado de servicios
		- Servicios distribuidos, no hay pnto único de control.
### SOA

#### Bus de servicios
- Punto local de la arquitectura SOA
- Gestiona transacciones que recibe
- Administra clientes y servicios conectados.
- Su ubicación física es un contenedor docker y acepta conexiones en el puerto 5000
- Se da cuenta que un servicio se fue por protocolos no recibidos ¿POR QUE?
#### Estructura de transacciones
Al bus le llega:
- Transacción de requerimiento: (Entra al bus)
   Largo | Servicio (ID) | Datos del requerimiento
- Transacción de respuesta del servicio: (Sale del servicio)
- Transacción de respuesta del bus: (Sale del bus)
  Largo | Servicio (ID) | ST | Datos de la respuesta
	- El ST: status transacción (OK, NK)

Por qué se ocupa el largo? 
- Si llega una misma operación separada en distintas transacciones, no sé donde comienza una ni donde comienza la otra. ¿Donde termina la transacción?
- TCP/IP: Receptor debe volver a armar mensaje largo. Debe saber si algún bloque se perdió, con el largo sé cuanto debo recibir, si no recibo todo ese largo entonces se sabe que hubo algún problema.
#### Servicio
- Proceso que implementa una o más funcionalidades
- Se conecta al bus y se identifica como servicio mediante transacción **sinit**
![[Pasted image 20250328151927.png]]
- Queda activo esperando transacciones

#### Cliente
- Proceso que implementa interfaz de usuario
- Se conecta al bus
- Envía transacción de requerimiento
- Espera la respuesta del bus
![[Pasted image 20250328152858.png]]

## 1 de Abril
### Ejercicio
Loto: Se escogen 6 números del 1 al 51. Se apuesta a que ellos sean los ganadores.
- Se pide desarrollar un sistema que permita:
	- Ingresar las apuestas de los jugadores
	- Ingresar los números ganadores
	- Ver el premio obtenido por apuesta

![[Pasted image 20250401144957.png]]

- Se tiene un medio de almacenamiento (BDD por ejemplo) para el sistema
- Se deben definir interfaces
### Programación de SOA 
- Bus debe estar activado.
- El servicio se debe activar
	- Transacción sinit
- El cliente se conecta al bus al puerto x.
	- Está en un bucle infinito que permite al usuario definir transacción a realizar
	- La diferencia con un servicio es que se identificó frente al bus.
- El cliente manda una transacción: *00016***servi**Hello World
	- Si el bus detecta que el servicio no existe, cancela la transacción. (ServiNKHelloWorld)
	- En caso contrario, serviOKReceived.

### Modelo de Capas
Conjunto de capas de Software que ofrecen servicios específicos.

- Cada capa tiene **interfaz claramente definida** y aporta en lo que le corresponde al procesamiento de la transacción.
	- **interfaz**: Conjunto de métodos y funcionalidades que definen cómo interactuan distintos componentes.
- Comunicación entre componentes de capas vecinas.
- Desarrollo independiente de las capas.

- **Ventajas** 
	- Desarrollo Incremental
	- Flexible
	- Mantenible
- **Desventajas**
	- Dificil estructuración
	- Dependencias cruzadas
	- Baja performance
		- Para resolver un requerimiento se debe cruzar capas ida y vuelta. 
		- Esto agrega latencia.

#### Ejercicio Modelo de Capas
Sistema de banco:
- Consulta de saldo de cuenta.
- Depósito en cuenta.
- Giro desde una cuenta.
- Transferencia entre cuentas.

![[Pasted image 20250401153927.png]]
- Transferencia: No me interesa consultar saldo.

![[Pasted image 20250401154600.png]]
- Problema: ¿Qué pasa si el usuario quiere conocer su saldo?
 ![[Pasted image 20250401154743.png]]
 Se generan **componentes fantasmas** sin utilidad! De tan solo 4 componentes se generan 14 componentes. También un cliente puede realizar un giro y un depósito sin una tranferencia de por medio.

## 4 de Abril
### Modelo de repositorio
Útil si hay gran cantidad de datos a ser compartidos por varias apps.
- Gestión centralizada de datos
- Almacenamiento centralizado
El Modelo puede ser Pasivo y/o proactivo.
- **Pasivo**:
	- Los componentes no interactuan de manera activa entre sí. Aplicaciones consultar el repo. al necesitar acceso a los datos.
	- Los datos no son modificados automáticamente por el sistema. Requieren acción de consulta o actualización desde cliente o componente para ser utilizados.
- **Proactivo**:
	- Los cambios en los datos son gestionados activamente desde el repositorio. Permite a otros sistemas acceder a la información más reciente de forma eficiente.
	- Centraliza el control, asegurando que modificaciones y acceso a datos se manejen de manera organizada.
Se centra en el almacenamiento de datos en un repositorio central. 

- **Ventajas**
	- Modo eficiente de compartir los datos
	- Administración centralizada de los datos
	- Seguridad, escalabilidad, mantenibilidad
- **Desventajas**
	- Dificil cambio del modelo de datos
		- El modelo se basa en una estructura de datos centralizada, por ende componentes del sistema dependen de tal estructura. Si se quiere modificar el modelo, todos los componentes deben ser actualizados también.
	- Política centralizada de administración
		- Toda la administración de datos está centralizada en un único repositorio. Si no está bien gestionado puede generar cuellos de botella. Todos los sistemas dependientes a él se verían afectados.
	- Punto único de falla
		- Si falla el punto central, todos los demás componentes se verían afectados.
- Este modelo es útil cuando se necesita gestión eficiente de datos compartidos por múltiples aplicaciones o módulos, con control centralizado sobre los datos.
### Objetos Distribuidos
Objetos distribuidos a través de distintos nodos o máquinas de una red. Interactúan a través de una infraestructura de comunicación, como **ORB**.
- **Objetos**: Unidades de software que encapsulan tanto datos como funcionalidades. Cada uno provee y recibe *servicios*.
	- Al ser enviado, debe ser *serializado*. Al ser recibido debe ser *deserializado*.
		- *Serialización*: Convertir objeto en un formato que pueda ser almacenado o enviado por la red.
- **ORB**: *(Object Request Broker)* middleware que facilita la comunicación entre objetos distribuidos.
	- Objetos invocan métodos de otros objetos a través de este.
	- Maneja localización de objetos, comunicación de mensajes y gestión de invocaciones remotas.

**Ventajas**
- Diseño Flexible.
- Fácil agregar objetos.
- Configuración dinámica.
- Escalabilidad, mantenibilidad.
**Desventajas**
- Compleja construcción.
	- Interoperabilidad entre sistemas.
	- Comunicación remota de objetos.
- Bajo rendimiento.
	- Latencia de red
	- Serialización y deserialización (Costoso)
## 8 de Abril

### Arquitectura Cloud
- Externalización de servicios computacionales
	- Infraestructura - IaaS
	- Plataforma - PaaS
	- Aplicación - SaaS
- Recursos elásticos (Pay what you use)
\**Profesor opina que esto va a acabar y existirá algo más*

**Ventajas**
- Servicios ubicuos (en cualquier parte del mundo)
- Reducción de costos*
	- ¿Realmente es un costo reducido?
- Disponibilidad, escalabilidad, elasticidad
- Flexibilidad, Movilidad.
**Desventajas**
- Dependencia de ente externo
	- Seguridad
	- Confidencialidad
	- Conectividad

## 4 de Mayo
### Modelos de Control 
#### Control Centralizado
Un componente controla la ejecución del sistema. 
- **Modelo Call-Return**
Única entidad o punto de control (el "centro") que toma todas las decisiones importantes y coordina las actividades de todas las demás partes del sistema. Piensa en ello como el cerebro de una operación.
- Es simple, predecible, rígido, testeable, bloqueante, complejo manejo.
	- Simple: Se tiene una lista de tareas a ejecutar
	- Rígido: No se puede cambiar, ya se especificó de tal manera.
	- Predecible: Se sabe cómo se va a ejecutar el proceso.
	- Bloqueante: Parte del sistema debe esperar a que la operación termine para continuar con las otras.
- Ya no se usa, No sirve para sistemas interactivos.
- **Modo administrador**
	Si la malla es compleja podría haber un problema. Se usa en programas no interactivos (Procesos de cuadratura, cálculo, procesos con cierta lógica).
	- No bloqueante
	- Coordinación de diferentes procesos
	- Lógica centralizada
	- Posible cuello de botella

#### Control basado en eventos
- Control descentralizado
- Control No bloqueante 
- *No es rígido*: Son cosas  que ocurren en instantes distintos
- Manejan eventos generados externamente
	- **Transmisión múltiple**.
		- Usan modelo Publicador-Suscriptor
			- Suscriptores procesan los eventos emitidos
		- Componentes distribuidos
			- Publican servicios
			- Gatillan eventos
			- Suscriben eventos
		- *Ventajas*
			- Activación descentralizada de componentes
			- Distribución de componentes
			- Evolución simple
				- Nuevos  suscriptores o publicadores se pueden agregar sin afectar al resto
		- *Desventajas*
			- Respuesta incierta
				- ¿Qué componente responderá? ¿Cuándo?
			- Varios manejadores del mismo evento
				- Si varios componentes quieren modificar el mismo recurso basado en el evento, qué ocurre entonces?
	- **Manejador de interrupciones**.
		- **Interrupción**: Evento urgente que requiere atención inmediata
		- La diferencia es que es de alta prioridad.
		- Manejador para cada tipo de interrupción
		- Sistemas en tiempo real (sistema de control de un avión).
		- Manejador para cada tipo de interrupción 
			- Tiene que haber alguien suscrito para responder a ese evento
		- No bloqueante
		- Procesamiento paralelo
- Cada componente se administra, no hay nadie que controle si no que el control lo realizan todos. 
### Descomposición modular
Dividir componentes en módulos más pequeños y manejables.
- Componentes divididos en módulos
- Posibilita visualizar el modelo de control
- Modelo de objetos
- Modelo de flujo de datos
#### Modelo de Objetos
Conjunto de clases débilmente acopladas. Cambios en una clase -> Impacto mínimo en otras.
- Interfaces bien definidas
- Identifica atributos y métodos
- Objetos creados a partir de las clases
- Coordinación de operaciones entre objetos
#### Modelo de flujo de datos
Sistema descompuesto en **procesos funcionales**. Cada proceso es responsable de transformar datos de entrada en datos de salida.
- Descomposición en procesos funcionales
- Transformación de entradas en salidas
- Dependencia entre procesos
	- La salida de uno puede ser la entrada de otro.
- Flujo predeterminado
- Adecuado para procesos batch
	- Se procesan gran cantidad de datos sin interaccion de user.
### Arquitecturas de Dominio Específico. 
- Modelos específicos para un dominio.
- **Arquitecturas genéricas**
	- Generalización de sistemas reales
	- Se realizan mediante el análisis de sistemas existentes
	- Son como una plantilla
- **Arquitecturas de referencia**
	- Idealización de una arquitectura específica
	- Estudios del dominio de una aplicación
	- Estándar de facto en su dominio
		- se considera buena práctica aunque no sea oficial

## Clase ??? de Mayo: Patrones de Arquitectura
### Patrones de Arquitectura
**Es una solución de diseño a una necesidad. Se caracteriza por:**
- Ser un esquema genérico
	- Es una base moldeable y adaptable al problema a solucionar
- Probado
	- No es algo nuevo, es algo hecho, probado y documentado
- Recurrente
	- Es común utilizar el patrón para resolver el problema.
Y este especifica y está hecho de:
- **Componentes**
	- Piezas o bloques de construcción
- **Responsabilidades**
	- Qué hace cada pieza?
- **Relaciones**
	- Como se relacionan las piezas?
**Ventajas**
- Organización de los componentes
- Separación de las responsabilidades
- Facilitación del trabajo en equipo
- Reducción de erorres
- Reutilización de componentes
- Uso de estándares
**Desventajas**
- Curva de aprendizaje
- Complejidad técnica
- Rendimiento limitado
- Uso de herramientas externas
#### Descripción de un patrón
- **Nombre**
- **Contexto**
	- Situación específica o escenario que da origen a la necesidad del patrón. Describe el ámbito de la necesidad y situaciones que la originan de forma detallada y general. Puede ser dificil de precisar.
- **Requerimiento**
	- Fuerzas presentes en el contexto. Necesidad que el patrón busca resolver. Define lo que se debe solucionar, considerando fuerzas presentes en contexto como propiedades requisitos y restricciones.
- **Solución**
	- El esquema propuesto para abordar el requerimiento. Busca balance entre las fuerzas identificadas.
		- Estructura: Componentes y sus relaciones
		- Comportamiento: Cómo se organizan e interactúan los componentes para cumplir con la solución.
#### Clasificación de los patrones
##### Patrones Simples
Algunos ejemplos de patrones simples:
###### Capas: 
	 Estructura aplicaciones descomponiendolas en tareas con distintos niveles de acción.
- **Contexto**: Sistemas jerárquicos estructurados con diversos niveles de acción
- **Problema**: Organización inadecuada genera problemas de escalabilidad y mantenibilidad
- **Solución**: 
	Estructuración en esquema multi-capa. Capa base con nivel de abstracción más bajo. Avanzar capa a capa usando servicios de la capa inmediatamente anterior. Componentes estructurados en módulos relacionados.
	- La capa K se relaciona con la K-1, no hay otras dependencias.
	- Cada capa se integra por distintos componentes, los que pueden interactuar entre si pero quedan acoplados.
	- Cada capa expone interfaz con sus servicios a proveer. El comportamiento puede ser top-down o bottom-up.

**Implementación**:
- Determinar el número de capas segun el nivel de abstracción
- Asignar responsabilidades a cada capa
- Especificar servicios ofrecidos 
- Definir estructura 
- Especificar su interfaz
- Especificar método de comunicación
Algunos componentes de una misma capa pueden quedar acoplados ()
###### Tubos y filtros: 
	-Estructura Aplicaciones en Actividades(filtros) para procesar flujos de datos, actividades unidas por tubos.
- **Contexto**: Procesar flujos de datos.
- **Requerimiento**: 
	- Descomponer el procesamiento en una serie de actividades(filtros) conectados por tubos que transforman input en output(entregados en tubo), transformaciones independientes.
- **Solución**:
	- Tubos(pipes):
		- Conecta origen de datos con un filtro.
		- Conecta filtro con filtro.
		- Conecta filtro con salida de datos.
		- Esquema de procesamiento FIFO.
	- Filtros:
		- input ->transformación-> output
		- flujo que solicita y entrega datos.
		- filtros independientes
			- Estado NO COMPARTIDO
			- desconocen el resto de filtros
			- activos o pasivos
**Implementación**:
- Dividir el sistema en secuencia de procesos ordenados e independientes
- Definir el formato de los datos transmitidos por los tubos.
	- Rendimiento o Flexibilidad?
- Especificar el procesamiento de cada filtro
- Construir los filtros
- Definir esquema manejo de errores
**Ventajas**:
- Arquitectura flexible
- No requiere de archivos intermedios
- Filtros reutilizables
- Procesamiento paralelo
- Construcción independiente
**Desventajas**:
- Información no compartida
- Conversión de datos
	- ineficiencia
- Errores pueden afectar el flujo de procesamiento
Los comandos de Linux se implementan en un esquema de filtros. Pipe conecta la salida estándar de un proceso con la entrada del siguiente, es fácil estructurar una secuencia de comandos como si fueran uno solo.
###### Pizarrón
Útil si no hay solución completa y múltiples sistemas aportan su conocimiento.
- **Contexto**: Dominio en el que no hay una solución completa.
- **Problema:** 
	- Conocimiento parcial de la solución
	- Cada solución requiere diferentes paradigmas
	- El problema abarca muchas especialidades
	- No es factible una solución completa
	- Hay soluciones parciales que cubren parte del problema
	- m´dulos aportan parcialmente a la solución
	- Cada sistema contribuyente usa sus datos en diferentes representaciones
- **Solución**:
	- Conjunto de sistemas independientes que cada uno se especializa en una parte del problema y que trabajan colaborativamente. 
	- Comparten datos a través del Pizarrón.
	- Controlador centralizador coordina la ejecución de los sistemas.
	- Genera soluciones parciales que pueden ser desechadas.
	- Sistemas no se comunican directamente.
	- Almacenamiento centralizado de la info.
	- Diccionario de datos del contenido del pizarrón
	- Sistemas especializados independientes leen y escriben en pizarrón
	- Monitoreo centralizado del estado del problema
	- Decisión centralizada de las acciones a seguir basado en el progreso
	- Determinar si solución es aceptable o insoluble.
**Ventajas**
- Arquitectura flexible
- Procesamiento paralelo
- Construcción independiente
- Integración de sistemas colaborativos
**Desventajas**
- Información no compartida directamente
- Conversión de datos 
	- Es ineficiente
- Controlador complejo y posible cuello de botella
- Sobrecarga
Algunos ejemplos de este sistema son sistemas de IA, reconocimiento de texto/voz/imágenes, soporte a la toma de decisiones (diversos sistemas de análisis de datos), sistemas ETL. 
###### Repositorio
Grandes cantidades de datos que deben de ser compartidos. Capa intermedia entre las apps y los datos.
- Separa la lógica del negocio de las fuentes de datos -> independencia de datos.
- Implementa operaciones CRUD basado en esquemas lógicos.
- Interfaz común de acceso a los datos.
**Ventajas**
- Arquitectura flexible
- Independencia de Datos
- Desarrollo independiente
- Reutilización, modularidad, paralelismo
**Desventajas**
- Sobrecarga en los procesos
- Agrega capa adicional (disminuye eficiencia)
- Riesgo de acoplamiento entre componentes 
##### Para Sistemas interactivos
###### Modelo Vista Controlador (MVC)
El sistema se divide en tres partes:
- **Modelo**: Datos y funcionalidad esencial 
- **Vista**: Comunicación con el usuario
- **Controlador**: Controla cambios al modelo
Así, se tiene que:
- **Interfaz de  usuario:** Controlador + Vista
- **Lógica del negocio:** Controlador+ Modelo
El controlador desacopla la vista del modelo -> Flexibilidad, mantenibilidad y adaptabilidad 
- **Contexto**: Sistemas interactivos con interfaz flexible
- **Problema**: 
	- Interfaz con distinta representación
		- Texto, iconos, gráficos, listas
	- Paradigmas de ingresos diversos
		- Digitación: cajas de texto
		- Selección: checkbox, iconos
		- Ingreso mixto
	- Interfaz cambiante
	- Funcionalidad nueva implica modificar la interfaz
	- La información se presenta en múltiples formatos.
- **Solución**: 
	- **Comunicación (VISTA):**
		- Envía requerimientos del usuario
		- Recibe datos del modelo y los despliega al usuario
	- **Administración (CONTROLADOR):**
		- Define el comportamiento del sistema
		- Recibe eventos y solicita servicios al modelo
	- **Procesamienot (MODELO):**
		- Provee funcionalidad provista por las vistas
		- Encapsula el manejo de los datos.

**Implementación**
- Separar la funcionalidad de la interacción del usuario
- Diseñar e implementar el modelo, las vistas, los controladores, relación vista/controladores.
**Ventajas**
- Modelo soporta múltiples vistas
- Flexible, mantenible, adaptable
- Frameworks implementan MVC
**Desventajas**
- Modelo acoplado con vistas y controladores
- Vistas sin acceso a datos (ineficiencia)
- Complejidad
###### Presentación Abstracción Control (PAC)
Estructura jerárquica de agentes cooperativos. Múltiples agentes que coordinan. Provee la funcionalidad de la aplicación, Agente es responsable de parte de la funcionalidad.
Bajo acoplamiento entre agentes (independencia entre agentes).
- **Presentación**: Interfaz
- **Abstracción**: Funcionalidad
- **Control**: Comunicación por agentes
Segmentar el sistema en subsistemas especializados.
- **Contexto**: Sistemas interactivos desarrollados utilizando agentes
- **Problema:
	- Estructurar un sistema interactivo mediante agentes funcionando en forma integrada
	- Generar interfaces flexibles de usuario  
	-  Separar la presentación de la funcionalidad  
	- Bajo acoplamiento 
	- Agentes con interfaces propias de comunicación  
	- Agentes con estado y datos privados  
	-  Trabajo cooperativo de los agentes
- **Solución**
	- Definir estructura jerárquica con 3 niveles de agentes
		- Alto nivel
		- Bajo nivel
		- Intermedio: Relaciona agentes de bajo nivel
	- Cada agente responsable de una parte de la funcionalidad y se componen de:
		- Presentación: LLo visible
		- Abstracción
		- Control
**Implementación:
- Definir la funcionalidad central de un sistema
- Estructurar la jerarquía de agentes
- Definir e implementar cada agente
		- Funcionalidad, interfaz, modelo de datos, mecanismo de control
**Ventajas
- Asigna responsabilidades específicas
- Funcionamiento independiente
- Soporta multitarea
**Desventajas
- Sistema Complejo
- Baja eficiencia
- Complejo mecanismo de control

- **MVC:** Es centralizado. Ideal para una aplicación simple como la pastelería. Tienes **UN** Modelo, **UN** conjunto de Vistas y **UN** conjunto de Controladores. Es como un restaurante con un chef, camareros y una cocina.
    
- **PAC:** Es distribuido. Ideal para sistemas complejos que se pueden descomponer en partes que funcionan de forma semi-independiente pero que necesitan colaborar. Como nuestra conferencia o un sistema operativo con diferentes agentes para la red, el video, el sonido, etc.
##### Adaptables

##### Para Sistemas distribuidos
