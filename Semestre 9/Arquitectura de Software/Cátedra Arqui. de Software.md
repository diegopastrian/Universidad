## 7 de marzo

**¿Qué es la arquitectura de Software?**
Definir componentes organizados que permitan satisfacer requerimientos funcionales del cliente. Relaciones de comunicación entre componentes. -IEEE
El diseño general del sistema genera problemas estructurales. 
- Definir la estructura (componentes).
	- Componente: Código que implementa un requerimiento funcional.
- Especifica la comunicación entre componentes.
- Plantea requerimientos funcionales.
- Plantea requerimientos no funcionales.
	- Restricciones técnicas.
	- Restricciones de negocio.
	- Atributos de calidad.
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

### Arquitecturas de Software Genéricas
- Deben satisfacer los RF
#### Diseño de Software
- **Fase 0**: Analizar contexto.
	- Requerimientos funcionales y no funcionales
	- Ambiente Operacional
	- Restricciones
- **Fase 1**: Estructuración
	- Identificar componentes y relaciones.
	- Descompone el sistema en un conjunto de componentes.
	- Utiliza un **diagrama de bloques** que muestra la estructura del sistema.
	- Indica flujo de datos entre componentes.
	- Muestra interfaces proveidas por sistema.
	- **Interfaz**: conjunto de métodos y funciones que definen cómo interactúan los diferentes componentes o sistemas entre sí
- **Fase 2**: Modelo de control
	- Comportamiento componentes
- **Fase 3**: Descomposición modular
	- Diseño detallado

#### Modelos de estructuración
- **Cliente servidor**
	- Cliente != Usuario.
	- *Cliente* es un proceso que pide algo. El usuario utiliza este proceso para solicitar servicio al servidor. 
	- Un *servidor* es un proceso que responde algo. Ofrecen servicios específicos. Satisfacen RF.
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