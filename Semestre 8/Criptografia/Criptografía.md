## Clase 26 Agosto

- Vemos imágenes iguales con distinto peso y distinto hash. (Esteganografía, esconder el mensaje), podemos observar que también a una imagen se le puede agregar código. 
#### Hash

-  Tengo una entrada a la cual la paso por una función y obtengo una salida. UNIDIRECCIONAL, no reversible!
- Debe ser resistente a colisiones, es dificil que H(A) = H(B)

- ###### Código de Redundancia Cíclica:
	- Verificar integridad de datos en transmisión
	- CRC de 32 bits muy extendido
	- 1101 -> $x^3 + x^2 + 1$
	- Polinomio Generador CRC-32 (0x104C11DB7): 
	- $$
x^{32} + x^{26} + x^{23} + x^{22} + x^{16} + x^{12} + x^{11} + x^{10} + x^8 + x^7 + x^5 + x^4 + x^2 + x + 1
$$
