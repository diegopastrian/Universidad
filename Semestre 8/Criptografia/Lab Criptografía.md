Proxy: Intermediario entre cliente-servidor (BURP)
Todas las peticiones del browser van a pasar por el proxy y recién se van a internet:
- La idea es tener la capacidad de que lo que pase por el browser se capture en burp. 
- Al capturarlo podría modificarlo.
Flujo : Browser -> internet.

Ahora, necesitamos que pase por el servidor proxy y luego redireccionar el tráfico a la red WAN.

firefox: ajustes -> buscador: proxy (configuraciones) -> dice sin proxy-> config manual donde usamos nuestra ip (proxy corre de forma local) (puerto 8080)

servidor proxy rechaza conexiones: todo está quedando en el burp, necesito cambiarlo
descargué los certificados
ver certificados (ajustes)
en personas, importar el archivo descargado
![[Pasted image 20240830092104.png]]![[Pasted image 20240830093029.png]]tuve la capacidad de interceptar, y al apretar forward, lo envié a la internet. Esto es porque el intercept está on. 
-- 
Ataque de fuerza bruta

# 11 Octubre

- Salt: puede ser nombre, token dinamico, id base datos, todo depende de las políticas de negocio de la empresa. Un hash erroneo podria llevar a un hash colission. 
1- ver la petición al inspeccionar la red

### Cifrado simétrico

###### DES: 
Usa la misma clave para cifrar y descifrar los datos. Fue uno de los primeros estándares amplios para protección de datos. Uno de los primeros estándares amplios para protección de datos. Fue reemplazado por otros algoritmos. 

###### AES:
AES256 es el estandar. Se estima que hasta el 2030. 

#### Cifrado asimétrico

Más seguro que simétrico. Usa un par de llaves.