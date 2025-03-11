#### 7 de marzo

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
#### 11 de marzo
##### Requerimientos no funcionales

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
