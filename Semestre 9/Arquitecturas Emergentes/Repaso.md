
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

| Cuenta       | Hosts Requeridos (H) | Bits de Host (n) | CIDR Calculado | Hosts Disponibles ($2^n-2$) |
| ------------ | -------------------- | ---------------- | -------------- | --------------------------- |
| Cuenta1-Dev  | 1500                 | 11               | /21            | 2046                        |
| Cuenta1-Prod | 1500                 | 11               | /21            | 2046                        |
| Cuenta2-Dev  | 800                  | 10               | /22            | 1022                        |
| Cuenta2-Prod | 800                  | 10               | /22            | 1022                        |

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