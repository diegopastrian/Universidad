# Sistemas de Telefonía Celular P2.

## **Telefonía celular Análoga**
### AMPS

- Primer sistema celular de EEUU
- Desarrollado en el 70, uso comercial en el 83.
- Reutilización de 7 celdas. Admite sectorización (emplea celdas de 3 sectores) y división.

#### Radioenlace 

- Ocupa FDMA (acceso al medio por frecuencias)
- Cada canal tiene un BW de 30 KHz
- Rango de frecuencias:
	- Hacia atrás: 824-849 MHz (25 MHz)
	- Hacia delante: 869-894 MHZ (25 MHz)
- Son 832 ($\frac{25000}{30}=833$, se considera frecuencia de guarda en los extremos de la banda) canales en total 
	- 416 canales para cada operador (21 de control que monitorean 18 canales, 395 para operar).
#### Funcionamiento 

- La estación base transmite continuamente un canal de control **hacia adelante**. La estación base monitorea constantemente a los usuarios enganchados a ella.
- El movil examina un limitado número de canales, se engancha a la mejor señal.
- Los usuarios acceden al canal de **control hacia atrás** con un **protocolo de contienda** en canal común.

Suponiendo que un móvil A desea hacer una llamada:
- A hace petición de llamada por el canal de control hacia atrás.
	- MIN: Identificación del movil.
	- ESN: Electronic serial number.
	- SCM: Station class mark.
	- Número del destinatario.
- Todo esto se envía al MSC (Mobile Switching Center), Conmutación de llamadas.
	- MSC verifica los datos, conecta al abonado a la PSTN (red telefonica publica conmutada), asigna un par de canales RF a la llamada y asigna el correspondiente SAT(tono único para verificar estado de la llamada) y VMAC (controlar potencia).
	
En caso de necesitar un handoff (cambio de celda):

- MSC decide efectuar handoff, decide nueva estación base y reservar par de canales de RF. Asigna SAT y VMAC. Se envía la información a la estación base. 
- La estación base transmite los datos en el canal de voz a través de Wideband Data Signaling. Se efectua el handoff. 

### ETACS

- Sistema celular Europeo desarrollado a mediados del 80. Virtualmente idéntico a AMPS.
- Cambia el ancho de banda del canal de RF, también el rango de frecuencias del enlace.
- Cambia el número de canales RF por enlace, tasa de transmisión de datos y la modulación de voz.

### N - AMPS 

- Deriva de AMPS, desarrollado por motorola. 3 veces la capacidad de AMPS, usa canales de RF de 10 kHZ.

## **Telefonía celular Digital**
### USDC 

- Tecnicas de modulación digital.  Mayor capacidad de usuarios que AMPS.
- Diseñado para compartir con AMPS:
	- Espectro de frecuencias, reutilización de frecuencias, estaciones base.
- Es de 2G.
#### Radioenlace

- Sistema TDMA / FDD (acceso al medio por ranuras de tiempo). En cada canal para aumentar capacidad. Cada canal se divide en 6 ranuras temporales, a diferencia de AMPS que todo el canal se usa para un usuario.
	- 3 Usuarios full rate: ocupa dos canales.
	- 6 Usuarios Half rate: ocupa un canal.

- 84 canales de control, 42 AMPS y 42 USDC. 
- Mayor tasa de transmisión que AMPS (10 kbps, en AMPS no hay al ser analógica).

#### Señales de supervisión

##### CDVCC

- 12 bits por ranura de tiempo.
- Similar a SAT.
- Si hay error, desconecta al usuario y libera la ranura de tiempo.
##### SACCH

- 12 bits por ranura de tiempo.
- Canal lógico lento y asociado que transmite información de control crítica para mantener la calidad y estabilidad de las conexiones activas en sistemas celulares. Es clave para tareas como el ajuste de potencia, la sincronización y la gestión del handoff.

### GSM

- Sistema inalámbrico de 2G, norma paneuropoea introducido al mercado en 1991.
- Es el primer sistema que especifica:
	- Arquitectura de red, modulación digital y servicios.
- Sus servicios son:
	- Telefonía, datos y servicios suplementarios ISDN.
- Acceso al medio por TDMA. 
- **SIM:** Dispositivo de memoria, número de identificación del abonado, redes y paises accesibles por el usuario, numeros secretos.
- SIM + PIN: permite activar el servicio desde cualquier teléfono GSM.

#### Arquitectura de la red:

- BSC controla cientas estaciones base, administra Handover y gestiona asignación de recursos.
- El nucleo principal es la MSC. Las BSC se conectan a este nucleo, el cual se encarga de establecer las conexiones en las llamadas y además enrutar el tráfico hacia redes externas. 
- El OMC se encarga de monitorear y mantener el rendimiento de la red.
- El MSC se conecta con redes externas como el PSTN, Data network y ISDN.
- HLR contiene la base de datos principal que almacena información permanente del abonado.
- VLR contiene la base de datos que almacena información temporal de usuarios visitantes en la región del MSC correspondiente.
- AUC es el centro de autentificación que permite proteger la comunicación y asegurarla.
- externos:
	- PSTN (telefonia fija)
	- Redes de datos (internet y otros servicios)
	- ISDN (red digital avanzada)

#### Radioenlace:

- Usa TDMA
- Bandas de resguardo de 100 kHz.
- 124 Canales RF duplex de comunicación por enlace. Cada uno se llama ARFCN y es compartido por 8 usuarios en distintos tiempos. Cada usuario utiliza una única ranura de tiempo por trama. 
- Rango de frecuencias:
	- Hacia atras: 890 - 915 MHz
	- Hacia delante: 935 - 960 MHz
trama: conjunto de ranuras de tiempo.

- Canal físico: Una ranura de tiempo específica dentro de un ARFCN. 
- Canal lógico: tipo de información (7 TCH: voz,datos/ CCH: señalización/control).
	- TCH: voz, datos
		- Soporta 7 canales de tráfico. F full rate(info se envia en una ranura de tiempo, en cada trama) , H half rate (la info se envia en una ranura de tiempo, trama por medio).
	- CCH: 9 canales de control soportados. son hacia delante, enganche de los moviles, monitoreo de potencia de moviles en celdas vecinas.  Establecimiento de llamadas, asignacion canales de supervisión. Establecimiento de llamadas, asignación de canales de supervisión. PCH y AGCH son hacia adelante, RACH es hacia atras.

#### Funcionamiento

Estación movil monitorea los BCCH (canal de control hacia delante, broadcast a la celda. Identifica celda, red, estructura canales de control, disponibilidad canales) de estaciones base cercanas. Esto permite que el movil se asegure de siempre estar conectado a la celda adecuada.

- Movil monitorea BCCH de estaciones base cercanas y determina la mejor señal.
- Se sincroniza a la correspondiente estación base a través del FCCH(control hacia delante, ajusta frecuencia interna a la de la estacion base) y del SCH(control hacia delante, identifica BTS a través del BSIC.

Si el movil quiere hacer una llamada:
- Petición de llamada por el RACH(random access chanel)
- Estacion base responde por el AGCH (instruye al movil a operar en canal fisico) asignando SDCCH 
- el movil cambia al canal fisico asignado por AGCH. Este es el SDCCH (canal de control bidireccional, señalizacion al establecer llamada. Al asignar TCH, se libera)
- el movil espera el primer SACCH, cada SDCCH tiene un SACCH (control bidireccional lento, asociado a cada TCH. mismo canal fisico, ditinto tiempo.)
- movil envia datos de autentificacion y validacion en el sdcch
- el centro de conmutacion movil verifica datos y conecta al abonado a la pstn. 
- Por el SDCCH la estacion base asigna nuevo canal fisico a estacion movil.
- el movil cambia a un nuevo arfcn ya nueva ranura de tiempo segun asignacion del sdcch
- se produce el establecimiento de la conexion por el thc y su correspondiente sacch
- el sdcch es liberado

si llaman al movil:
- el msc instruye a estaciones base para efectuar broadcast por el PCH (canal de control hacia delante, servicios de paging a usuarios de la celda)
- el movil confirma la recepcion del mensaje por el RACH (rrandom access )
- estacion base asigna sdcch a traves del agch 
- movil cambia al canal fisico asignado por agch
- movil espera el primer sacch hacia delante, tiene un sdcch asociado.
- el movil envia datos de autentificacion y validacion en sdcch
- centro de conmutacion movil verifica datos, conecta al abordado a la pstn
- por el sdcch la estacion base asigna nuevo canal fisico
- el movil cambia a nuevo arfcn y nueva ranura de tiempo segun sdcch
- se produce el establecimiento de la conexion por el tch y sacch
- sdcch es liberado 