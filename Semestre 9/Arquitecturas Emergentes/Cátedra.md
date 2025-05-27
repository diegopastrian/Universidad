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
### CMMI
5 Niveles de madurez. 

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
## 14 de Abril
### VPC
**Vpc**: servicio relacionado a lo teleco en la nube

![[Pasted image 20250414174125.png]]

- **Nube de AWS**
	- Cuenta específica, diagramado con su ID, descripción para saber donde se hace el despliegue.
	- Conv
	- Es el equivalente en google cloud al proyecto
	- **VPC**: Red lógica donde se realiza:
		- El direccionamiento
		- Definiciones de subnet
			- Redes públicas y privadas
			- Dentro de subnet: *Instancias de cómputo*
				- Por detrás de cada instancia de cómputo hay una subnet
				- No se puede crear sin una configuración de red.
				- Se necesita una IP privada. Opcionalmente IP pública.
			- Primera ip: .1 para gateway, puerta de enlace al internet.
		- Rangos de ip asignables

![[Pasted image 20250414174730.png]]

- Private internet gateway

#### AWS Direct Connect
![[Pasted image 20250414175119.png]]

- Subnet pública:
	- Recursos a los que todas las personas acceden, por ejemplo el sitio web de la tienda.
		- Capa de frontend
- Subnet privada:
	- Imposible de acceder desde afuera.
	- No llegan ataques acá
- VPC: subredes pueden comunicarse entre sí. Podría incluir instancias de amazon EC2 que usen bdd que están en subred privada.
### Componentes importantes
#### ACL: Access Control List

Servicio AWS que es un firewall virtual que trabaja en las capas del modelo OSI para controlar tráfico entrante y saliente. Referencia hacia la subnet
- Una cuenta AWS por defecto viene con ACL.
- Reglas específicas
	- Aceptar rango de IP
	- Aplicar una Whitelist
		- Políticas de bloquear todo excepto esta lista.
	- Aplicar una Blacklist
		- Políticas de aceptar todo excepto esta lista.

#### Security Group

Componente de tipo Firewall. Referencia hacia la instancia de cómputo.
- Firewall de todas las capas del modelo OSI.
- Deniega tráfico entrante y permite todo el tráfico saliente.
- Se pueden agregar reglas personalizadas.
- Hacia una o más instancias de cómputo.
Tanto ACL como SG son firewalls.

#### Filtrado de paquetes

Las ACL realizan un filtrado de paquetes sin estado.
- No recuerdan nada, comprueban paquetes que cruzan el borde de la subred en cada sentido: entrada y salida.
- Los grupos con seguridad realizan filtrado de paquetes **con estado**.
	- De acuerdo a la metadata del paquete, hace un recordatorio de la decisión y deja pasar al paquete.
	- Permiten la salida por defecto.

![[Pasted image 20250414180057.png]]

#### DNS
- Entrega el dominio de un sitio en base a su IP.
- Para el url corresponde a la ip externa del gateway 
- Ruta 53: permite administrar hacia dentro de mi account todos los dominios que yo necesite para saber exactamente a qué ip o subnet enviar una consulta a resolver mi plataforma.
![[Pasted image 20250414180823.png]]
- App Load Balancer:
	- Distribuir la carga.
	- Revisa cuanta carga esta llegando.
-  Cloudfront: dependiendo de dónde hago la consulta geográficamente, hace el envío a una distinta ip.
- Autoscaling:
	- Énfasis en su símbolo con las flechas hacia adentro
	- Escalamiento horizontal.
	- Necesita cantidad mínima de instancias (en la imagen son 3)
		- Se tienen clones con distintas ip de instancias. Esto pasa ante muchos clientes usando la pagina.
		- Tengo un trigger de la concurrencia 
		- h_max: maxima cantidad de clones. 
	- Para calcular la cantidad de ips en la subnet se necesita considerar las máquinas clones. Cada instancia tiene ip diferente, pero 

#### Tarea

▪ ¿Cuáles son los nombres y principales características de las capas del Modelo OSI?
▪ ¿Qué es una MAC Address, cuál es su propósito, cómo se presenta y cuántos bits la conforman?
▪ ¿Qué es una IP Address, cuál es su propósito y cuántos bits conforman la versión 4 y versión 6?
▪ ¿Cuáles son los rangos públicos y privados de IP Address Clase A, Clase B y Clase C?
▪ ¿En qué consiste un proceso de direccionamiento?
▪ ¿Cuál es el propósito de los conceptos: Subnetting, CIDR & VLSM?
▪ ¿En qué consiste un proceso de enrutamiento?
▪ ¿Cuáles son los criterios para el funcionamiento de los protocolos: RIP, OSPF & EIGRP?
▪ ¿Cuál es el propósito de: DHCP, DNS, FTP, NTP, HTTP, SMTP, POP3, IMAP, VLAN, VPN?

Diapositivas en canva hasta antes de clase 5, documentación en los laboratorios del taller numero 1, normativas y estandares 

- 1. Caso de estudio: qué parametros considerar, que kpi
- 2. describir UML: para este caso describir una vista usando uml. Ser capaz de diagramarlo.
- 3. Preguntas de alternativa. Marco teórico.

## Clase 15 de Mayo
### Repaso materia anterior.
#### Capas del modelo OSI
- **Capa Física:** [Bits] El medio de comunicación (Medios ópticos, inalámbricos, alámbricos)
	- Ópticos: Presencia (o no) de luz
	- Alámbricos: Diferencia de voltaje
	- Inalámbricos: Modulación de la señal
- **Capa de enlace:** [Tramas] Distingue el dato, controlando enlace fiable. 
	- MAC adress: ID físico
	- Switch
- **Capa de red:** [Paquetes] Administrar y destinar los datos
	- IP: ID lógico
- **Capa de transporte:** [TPDU] Garantizar la entrega (confiabilidad).
	- TCP/UDP
	- Número de puerto
- **Capa de sesión:** [SPDU] Reglas de comunicación establecidas entre emisor y receptor.
- **Capa de presentación:** [PPDU] Acordar formato de los datos.
- **Capa de Aplicación:** [APDU] Conectividad a nivel de Software.
### IPS
- **Rangos de Clase :**
	- **Clase A:**
	    - **Público:** 1.0.0.0 a 126.0.0.0
	    - **Privado:** 10.0.0.0 a 10.255.255.255
	- **Clase B:**
	    - **Público:** 128.0.0.0 a 191.255.0.0
	    - **Privado:** 172.16.0.0 a 172.31.255.255
	- **Clase C:**
	    - **Público:** 192.0.0.0 a 223.255.255.0
	    - **Privado:** 192.168.0.0 a 192.168.255.255
- **Direccionamiento**
	- Proceso de cálculos y definiciones para contar con asignaciones base de red, rangos asignables, direcciones de broadcast y cumplimiento de normativas internas.
- **Enrutamiento**
	- Dirección Base
	- Máscara de Subred
	- Rango IP Asignable ($H_{Max}= 2^n -2$)
	- Dirección de difusión

**Estimación para VPC**:

Estándar PCI, compliance y no compliance.
- \#EC2
- \#RDS 
- \#EKS -> Pods y nodos
- \#ECS
- \#Lambdas
- \#Load Balancer
- \#Endpoints
El Hmax es el dato que ya tenemos, siendo n la incógnita. 
Cuentas: Dev, QA, Prod. 
## Ejemplo de Direccionamiento VPC

**Dirección Base:** `172.16.0.0`

### Enunciado del Problema y Requisitos

| Cuenta        | Hosts Requeridos (H) | Bits de Host (n) | CIDR Calculado | Hosts Disponibles ($2^n-2$) |
|---------------|----------------------|------------------|----------------|--------------------------|
| Cuenta1-Dev   | 1500                 | 11               | /21            | 2046                     |
| Cuenta1-Prod  | 1500                 | 11               | /21            | 2046                     |
| Cuenta2-Dev   | 800                  | 10               | /22            | 1022                     |
| Cuenta2-Prod  | 800                  | 10               | /22            | 1022                     |

---

### Resultado de la Estimación y Asignación de Direcciones

**Dirección Base General:** `172.16.0.0`

| Red para | Nombre Lógico | Dirección de Red | CIDR  | Rango de IPs Asignables         | Dirección de Broadcast | Máscara de Subred | Hosts Útiles |
| -------- | ------------- | ---------------- | ----- | ------------------------------- | ---------------------- | ----------------- | ------------ |
| C1d      | Cuenta1-Dev   | `172.16.0.0`     | `/21` | `172.16.0.1` - `172.16.7.254`   | `172.16.7.255`         | `255.255.248.0`   | 2046         |
| C1p      | Cuenta1-Prod  | `172.16.8.0`     | `/21` | `172.16.8.1` - `172.16.15.254`  | `172.16.15.255`        | `255.255.248.0`   | 2046         |
| C2d      | Cuenta2-Dev   | `172.16.16.0`    | `/22` | `172.16.16.1` - `172.16.19.254` | `172.16.19.255`        | `255.255.252.0`   | 1022         |
| C2p      | Cuenta2-Prod  | `172.16.20.0`    | `/22` | `172.16.20.1` - `172.16.23.254` | `172.16.23.255`        | `255.255.252.0`   | 1022         |
|          |               |                  |       |                                 |                        |                   |              |
Partiendo de C1d: 172.16.0.0, tiene máscara de 21. Por ende:
172.16. { 00000**000** }.0 -> 172.16.{00001**000**}

### Ejercicio
**Dirección Base:** `10.0.0.0`

| Red para | Nombre Lógico  | Dirección de Red base | H   | CIDR  | Rangos de IP                |
| -------- | -------------- | --------------------- | --- | ----- | --------------------------- |
| Ad       | Argentina-Dev  | `10.0.0.0`            | 300 | `/23` | `10.0.0.1` - `10.0.1.254`   |
| AQA      | Argentina-QA   | `10.0.2.0`            | 300 | `/23` | `10.0.2.1` - `10.0.3.254`   |
| Ap       | Argentina-Prod | `10.0.4.0`            | 300 | `/23` | `10.0.4.1` - `10.0.5.254`   |
| CD       | Chile-Dev      | `10.0.6.0`            | 90  | `/25` | `10.0.6.1` - `10.0.6.126`   |
| CQA      | Chile-QA       | `10.0.6.128`          | 90  | `/25` | `10.0.6.129` - `10.0.6.254` |
| CP       | Chile-Prod     | `10.0.7.0`            | 90  | `/25` | `10.0.7.1` - `10.0.7.126`   |

2^n -2 = H
n = log(H+2)S
2,4,8,16,32,64,128,256,512
H:300 -> n=9
H:90 -> n=7

10.0. { 0000000**0** }. 0 -> 10.0.2.0
10.0.4.{ 0**0000000** } ->10.0.4.128
10.0.{000000101}.{0**0000000**}