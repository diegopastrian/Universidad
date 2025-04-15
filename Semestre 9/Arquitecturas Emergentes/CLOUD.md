## 1 - Recorrido por los labs
- Cloud IAM: inspeccionar y modificar roles y permisos.
	- viewer
	- editor
	- owner
- APIS: interfaces de programación de aplicaciones que se pueden llamar directamente o por bibliotecas cliente 
	- Dialogflow: crea apps conversacionales
# 04 - Essential Google Cloud Infraestructure
## Introducción
### Introducción al curso
#### GCP:
- Open source software
- infraestructura, plataforma y software.
- GCP conecta más de 60 zonas. Red con fibra óptica
	- con más de 130 puntos de presencia
	- Abarca de Iaas a SaaS
- Se pueden crear apps globales y asistivas
- Google abrió servicios para dartelos empaquetados.
- Se puede crear en GCE una VM y instalarle MYSQL y usarla en un datacenter en tu computadora
- Pasar a base NSQL sin que requiera cambiar la capacidad
- Infraestructura TI: ciudad
- GCE: compute engine
	-  correr VM
	- IaaS solución
	- Flexibilidad
- GKE: Kubernetes:
	- ejecutar apps en nube
	- organizar el código en contenedores
- App Engine:
	- Ejecutar codigo en la nube sin preocuparse por la infraestructura.
	- Solo te enfocas en el código
- Cloud Functions:
	- Functions as a service
	- Sin servidores, ejecuta código en respuesta a eventos.
		- Estos eventos pueden darse una vez al dia o al segundo
	- solo se paga por tus servicios
- Cloud Run:
	- Plataforma de procesimiento para ejecutar contenedores sin solicitudes web
	- funciona sin servidores
		- Enfocarse en el desarrollo
	- Basado en Kubernetes
		- Permite mover trabajo entre entornos y plataformas
	- Knative based
	- aumentar o reducir la carga casi instantaneamente
### Interactúa con Google Cloud
Introducción a GCP. 
#### Cómo usar Google Cloud
Cuatro formas de interactuar con cloud:
- **Google Cloud Console**
	- Interfaz gráfica de la web.
	- Se puede ver máquinas virtuales por ejemplo
	- 
- **Cloud Shell** 
	- Acceder a consola de cloud.
	- Maquina virtual temporal con 5 GB de almacenamiento.
	- API interfaces
		- Se exponen para proporcionar acceso a servicios, optimizadas.
		- Funciones para administrar recursos
- **Cloud Mobile App**
	- Manejar recursos desde el celular
	- Ver métricas clave con gráficos
	- Alertas y administración de incidentes
	- datos de Facturación.
#### Introducción al lab
Trabajar con la consola de google cloud y cloud shell
- Explorar itnerfaz GCP 
- Crear bucket de almacenamiento
Entorno GUI: interfaz gráfica de usuario, google cloud console
Cloud shell: cli
La consola:

- Proporciona una forma rápida de realizar tareas.
- Te presenta opciones, en lugar de exigirte que las conozcas.
- Realiza validaciones en segundo plano antes de enviar los comandos.

Cloud Shell proporciona lo siguiente:

- Control detallado
- Una gama completa de opciones y funciones
- Una ruta de automatización a través de la escritura de secuencias de comandos

modificar .profile permite guardar variables y que no se pierdan al reiniciar el shell
#### lab 2
Usar GC Marketplace para implementar instancia de jenkins preconfigurada.
	Deployment manager -> permite deployar rapidamente software trayendo plantillas pre definidas

Deployment Manager es un servicio de Google Cloud que usa plantillas escritas en una combinación de YAML, Python y Jinja2 para automatizar la asignación de recursos de Google Cloud y ejecutar las tareas de configuración. También se crea una máquina virtual en segundo plano. Se usó una secuencia de comandos de inicio para instalar y configurar el software, y se crearon reglas de firewall de red para permitir el ingreso de tráfico al servicio.

admin ---
user
wk[s)3PgB4DN