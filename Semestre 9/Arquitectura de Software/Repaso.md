## Control 1
### Verdadero o Falso

1) *"La arquitectura de software define la estructura de un sistema, la comunicación entre componentes y el detalle de los procesos que debe realizar cada uno. El objetivo es traspasar a equipo de desarrollo como debe ser construido el sistema y cuales son los requerimeintos que hay que desarrollar"*
	- Esta afirmación es falsa: *"el detalle de los procesos que debe realizar cada uno"* Eso no es correcto, ya que se definen los requerimientos funcionales más no el detalle de los procesos a realizar cada uno.
	- *"El objetivo es traspasar a equipo de desarrollo **cómo** debe ser construido el sistema y cuales son los requerimientos que hay que desarrollar"* Arquitectura de software me responde el qué, no el cómo.

2) *"Los requerimientos funcionales deben dar satisfacción a las necesidades de procesamiento del cliente en relación al sistema que se va a desarrollar. Sin embargo, dependiendo de la arquitectura de software que se decida utilizar habrá que incluir en el diseño uno o más requerimientos no funcionales."*
	- La arquitectura se basa en los requerimientos funcionales. 
	- Los requerimientos **no define ni depende** de la arquitectura. NO necesariamente con una arquitectura X Son independientes los requerimientos de la arquitectura.
	- **Cliente** tiene un significado especial! Debería referirse al **USUARIO**.

3) *"La arquitectura cliente/servidor es escalable. Esto se logra porque basta con instanciar varias copias del mismo servidor para aumentar el rendimiento del sistema. Además, como la administración de los datos está en cada servidor, no es necesario preocuparse de la sincronización de los datos entre las copias del servidor."
	- Esto es falso: *"instanciar varias copias del mismo servidor para aumentar el rendimiento del sistema."* porque hay que considerar capacidad del servidor, distribución de la carga, entre otros.
	- Si tiene que existir una sincronización de los datos: Tiene que haber consistencia entre los servidores.
	- Lo único verdadero es considerar que Arquitectura Cliente/Servidor es escalable.

4) *"En la arquitectura de capas los componentes que ofrecen la misma funcionalidad se agrupan en capas de software de manera de concentrar en un mismo lugar la satisfacción de requerimientos similares. Así, por ejemplo, los componentes que administran los requerimientos de seguridad van a estar incluidos en la capa de seguridad del sistema. Lo mismo puede ocurrir en la capa de validación de datos. Entonces, si en el procesamiento de una petición de un usuario se requiere validar los datos, se va a invocar al componente de validación de la capa correspondiente."*
	-  No es necesario que estén en misma capa. Que estén en la misma capa o distinta no tiene relación, están donde el requerimiento lo necesite: pues necesito pasar por cada capa, que agrega algo adicional al procedimiento.
	- *"Entonces, si en el procesamiento de una petición de un usuario se requiere validar los datos, se va a invocar al componente de validación de la capa correspondiente."* No se invoca el componente como tal, se necesita pasar por todas las capas hasta llegar a esta. No puedo saltarme las capas.

5) *"El arquitecto de software es el encargado de recibir los requerimientos del cliente, organizarlos y entregarlos al equipo de desarrollo en la medida que los vaya recibiendo. De esta manera se logra agilizar el proceso de desarrollo."*
	- Indica cliente, debería ser Usuario.
	- En la medida que los vaya recibiendo: Necesito el diseño completo para pasarlo. No es algo que vaya construyéndose mediante el desarrollo.
	- No por entregar antes algo se agiliza el proceso de desarrollo.

6) *"Los requerimientos no funcionales corresponden a los atributos de calidad que se desea incluir en el sistema. Así, por ejemplo, si el requerimiento del usuario es que el sistema sea portable, bastaría escoger una arquitectura de software que ofrezca esa característica. Lo mismo ocurriría con cualquiera de los otros requerimientos no funcionales."*
	- Una arquitectura no implica un requerimiento no funcional.
	- No ocurriría lo mismo con cualquiera de los otros requerimientos no funcionales.

7) *"En la arquitectura cliente/servidor, tanto el procesamiento, como los datos, están distribuidos en varios componentes. Esto posibilita que el sistema sea escalable, ya que no hay dependencia entre ellos. Sin embargo, surge la necesidad de sincronización de los datos que son administrados en cada servidor, pues un cambio en los datos debe ser replicado a los otros servidores con el fin de mantener la consistencia de los datos."*
	- Este párrafo es ***correcto***!

8) *"La arquitectura de capas posibilita desarrollar el sistema de forma incremental. Para poder utilizar esta característica es haber definido las interfaces de todas las capas del sistema, de manera que cada componente sepa cómo invocar al componente de la capa que requiera, independientemente de si ese componente ya haya sido desarrollado o no."*
	- Todo es correcto salvo que se necesita definir **todas** las capas del sistema. Solamente es necesario definir las capas vecinas 
	- La capa que requiera: Siempre que sea la vecina.

