Para comprender la seguridad en el acceso a una API FHIR, primero es útil visualizar cómo funciona el proceso. Este diagrama ilustra el flujo de autenticación y autorización utilizando un token, asegurando que solo usuarios puedan interactuar con el servidor FHIR.
<br>

**ACA IRA LA IMAGEN DE LA SEGURIDAD**
<br>

A continuación, se muestra el diagrama de secuencia que detalla cada uno de los pasos involucrados en este proceso.
<br>

<div align="center" >
  {% include Seguridad.svg %}
</div>
<br clear="all"/>

Ahora, se explicará paso a paso cómo se maneja la autenticación y autorización mediante el uso de un token para acceder a una API FHIR. A continuación, se describen los pasos necesarios para solicitar, validar y utilizar un token para acceder a los recursos FHIR de manera segura.
<br>

**Paso 1:** Solicitud de la llave (Token)
<br>
El primer paso en el proceso de autenticación es la solicitud de un token. Esta solicitud generalmente se realiza mediante una petición HTTPS desde la aplicación cliente al servidor de autorización, proporcionando las credenciales necesarias (como el client ID y el client secret) para obtener el token.
<br>

**Paso 2:** Entrega una llave (Token)
<br>
El servidor de autorización valida las credenciales proporcionadas por el cliente y se la entrega una apigateway.
<br>

**Paso 3:** Envio del recurso más la llave (Token)
<br>
Con el token en mano, entra a la URL de la apigatewat, esta por medio de una función de token introspect evalua que el token entregado. 
<br>

**Paso 4:** Envia el recurso más la llave 
<br>
La API FHIR recibe la solicitud junto con el token. Antes de procesar la solicitud, la API verifica la validez del token para asegurarse de que el cliente tiene los permisos necesarios para acceder al recurso solicitado.
<br>

**Paso 5:** Responde si estos corresponden entre si o no corresponden
<br>
La API FHIR valida el token y comprueba que los permisos incluidos en el token son suficientes para acceder al recurso solicitado. Lo cual puede resultar como una validación exitosa o no exitosa.

**Paso 6:** Manejo de tokens no válidos.
<br>
Si el token no es válido o no tiene los permisos necesarios para acceder al recurso, la API responde con un mensaje de error. La aplicación cliente debe manejar este error, informando al usuario que no tiene acceso y evitando que la solicitud progrese
<br>

**Paso 7:** Acceso al servidor FHIR con un token válido
<br>
Si el token es válido y tiene los permisos necesarios, la API FHIR permite que la solicitud progrese y el recurso solicitado es accedido o modificado según corresponda. De esta manera, se asegura que solo los clientes autorizados pueden interactuar con el servidor FHIR.
<br>
Este proceso de autenticación y autorización mediante tokens es crucial para mantener la seguridad y privacidad de los datos en un entorno FHIR, garantizando que solo usuarios y aplicaciones legítimas puedan acceder a los recursos FHIR.
<br>