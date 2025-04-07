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
	- En caso contrario, serviOKReceived

### Modelo de Capas
Conjunto de capas de Software que ofrecen servicios específicos.

- Cada capa tiene interfaz claramente definida y aporta en lo que le corresponde al procesamiento de la transacción.
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
dasjkdsajdsajl
### Modelo de repositorio
Útil si hay gran cantidad de datos a ser compartidos por varias apps.
- Gestión centralizada de datos
- Almacenamiento centralizado
Modelo Pasivo y proactivo.
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

## 7 de Abril

### Modelo de responsabilidad compartida

#### IAM
- Global, no específica de alguna región. 
- Administra usuarios que acceden a consola.
	- Para muchos servicios AWS se utiliza de forma predeterminada.
- Admite MFA (Multifactor Autenticator)
- Identidad Federada: Empleados de la empresa no necesitan tener usuario/contraseña aparte para acceder a la nube. 

- Usuario IAM
- Credenciales de usuario IAM
- Grupos de IAM
- Políticas de IAM
	- Versión: Versión del lenguaje de la política(fecha)
	- Efecto: La instrucción permite o deniega el acceso.
	- Acción
	- ?

### Cómputo como servicio
- Especificaciones de hardware
- Configuraciones lógicas: Ubicación de redes, reglas de firewall, autenticación y el sistema operativo a elegir
- Pasos a seguir:
	- Lanzar una instancia (VM)
		- Instancia AWS
		- Volumen: "Disco duro"
	- Crear imagen
	- Lanzar una instancia

#### Ciclo de vida
![[Pasted image 20250407181733.png]]

