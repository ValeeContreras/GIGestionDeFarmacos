Entender la seguridad, primero podemos encontrar un diagrama que especifica el paso a paso de como funciona:
<br>

ACA IRA LA IMAGEN DE LA SEGURIDAD
<br>

A continuacion podemos observar lo mismo pero en un diagrama de secuencia:
<br>

<div align="center" >
  {% include Seguridad.svg %}
</div>
<br clear="all"/>

<br>
**Paso 1:** Se solicita una llave (Token)
<br>
**Paso 2:** Entrega una llave (Token)
<br>
**Paso 3:** Envio del recurso más la llave (Token)
<br>
**Paso 4:** Envia el recurso más la llave 
<br>
**Paso 5:** Responde si estos corresponden entre si o no corresponden
<br>
**Paso 6:** En el caso de que no corresponda el token con el recurso, se devuelve a la aplicación y no deja que entre
<br>
**Paso 7:** En el caso de que si corresponda el token con el recurso, deja pasarlo a la API F y asi poder entrar al servidor FHIR
<br>