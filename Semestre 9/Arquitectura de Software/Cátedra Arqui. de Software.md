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