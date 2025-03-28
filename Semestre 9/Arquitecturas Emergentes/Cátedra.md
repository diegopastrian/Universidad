Correo Profe: jorge.elliot@mail.udp.cl
#### 10 de Marzo

**Normas**

- Seguridad de Info.
- Continuidad de Resiliencia
- Gestión de Incidentes
- Gestión de riesgos.

En base a estas normas, una entidad certificadora certifica que la empresa cumpla con la norma y les da un check.

**Gestión de Servicios TI:**

- ITIL: Information Tech Infraestructure Library.

Requerimientos estratégicos:
- Las empresas o negocios tienen un **Rubro**:
	- Dinámica
	- Seguridad
	- Precisión
	- Rapidez
	- **Tiempos**

**Ciclo Deming:** Hago un checkeo interno ocupando opinión externa
Plan - Do - Check - Act (perfeccionar)

## Clase 13 de Marzo
### 4+1 View Model
Como una descripción arquitectónica. Se necesitan modelos para orientar la perspectiva del desarrollo.
- Modelo de vistas *Kruchten, Phillipe*: **"4+1 View Model"**. Basta con tener 5 perspectivas para poder describir una solución tecnológica.

	- **Vista lógica:** Donde puedo ver la estructura de las principales entidades participantes en mi solución tecnológica con sus respectivos atributos. -> Usuario final
		- Diagrama de Clases UML.
			![[Pasted image 20250313180559.png]]
	- **Vista de Desarrollo**: Describe principales componentes requeridas en tiempos de construcción (también presentes en tiempos de ejecución). -> Programadores.
		- Diagrama de Componentes UML.
			[Insertar Foto]
		
	- **Vista física**: Todo lo tangible. Infraestructura involucradas (VM, Servidores, etc). -> Ingeniero de Sistemas.
		- Diagrama de Despliegue UML.
			[Insertar Foto]
	
	- **Vista de Procesos**: Responde a la interacción de mis componentes arquitectónicos. Interacciones entre API, base de datos, etc.
		- Diagrama de Secuencia UML.
			- Representa orden a lo largo del tiempo.
			- Las funciones reciben dentro objetos, arrays, etc.
		
	- **+1: Escenario:** Delimita el alcance de la descripción arquitectónica.
		- Diagrama de Casos de Uso.
		![[Pasted image 20250313180207.png]]
			- Include: Dependencia obligatoria entre ambas funcionalidades.
			- Extend: Dependencia opcional. (Acumular puntos en compra).
			- 
		- A la izquierda están primarios, a la derecha secundarios. Los secundarios corresponden quienes no están pensados como destinatarios últimos de la solución.
			- Por ejemplo, APP: Conecta UDP. Primario: Estudiantes, Secundario: Soporte TI (aquí soporte tiene más poder que el estudiante en la app).

### algo
- Estandar IEEE-:
	- Lo mínimo que debería tener un documento que considera una planificación de un proyecto de ingeniería.

- Estandar IEEE-1471-2000:
	- Descripción arquitectónica del software.

**Bloque**

| Arquitecto     | Programador    |
| -------------- | -------------- |
| Atributo       | Variable       |
| Operación      | Función/Método |
| Actor          | Usuario        |
| Generalización | Herencia       |

- Rombo Blanco: Agregación. Dependencia débil.
- Rombo Negro: Composición.  Dependencia fuerte.

## 20 de Marzo
### ¿Dónde desplegar?

- **Mis dispositivos, en mis dependencias.**
	- On-premise: Mis dependencias, donde yo tengo acceso.
		- Cuántas concurrencias (solicitudes al mismo tiempo) soporta.
		- En este caso podría ser 8 concurrencias.
	- On-site
	- Data-center propio
- **Mis dispositivos, dependencias de terceros.**
	- Housing
		- Maquinas de mi propiedad en el data-center de mi proveedor.
	- Data-center proveedor.
		- Por ejemplo, se arrienda un piso en entel.
- **Externalizar en infraestructura de terceros.**
	- Cloud Provider
	- *IAAS* Infraestructure as a Service

### ¿Qué es la nube?
- La computación en la nube es una metáfora para referirnos a un modelo de consumo de tecnología en el cual se consumen infraestructuras o servicios por los cuales se paga su uso.
- Se consumen datacenters de terceros.
- Virtualización
#### Modelos de servicio cloud
- Saas
- PaaS
- IaaS
ServesLess: Sin servidor. No es necesario adecuar el SO si solo se ocupa una BDD, con esto se provee directamente el acceso a la base de datos. 
#### Modelo de responsabilidad compartida
"El proveedor es responsable de la seguridad de la nube, el usuario es responsable de la seguridad en la nube".
![[Pasted image 20250320180856.png]]

#### Principales servicios
- Computing
- Maquina Virtual en A

##   Clase 27 de Marzo
