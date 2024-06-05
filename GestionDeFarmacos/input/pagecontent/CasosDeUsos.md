### Casos de Usos
Esta guía de implementación es diseñada para el uso de datos  en la Gestión de Fármacos enfocados en la Atención Primaria de Salud (APS).
<br>

<div align="center" >
  {% include DiagramaSecuencia.svg %}
</div>
<br clear="all"/>

**Caso de uso 1:** Crear/Guardar Prescripcion
<br>
INFORMACION
<div align="center" >
  {% include DS1.svg %}
</div>
<br clear="all"/>
<br>

**Caso de uso 2:** Modificar Prescripcion
<br>
Este caso nos presenta la capacidad de realizar cambios en una prescripción, estos cambios pueden ser:
* Secuencia
* Frecuencia
* Periodo en el cual se realizan las repeticiones
* Periodo Máximo en el cual se realizan las prescripciones
* Errores tipograficos
* Entre otros

<br>
<div align="center" >
  {% include DS2.svg %}
</div>
<br clear="all"/>
<br>

**Caso de uso 3:** Cambio de estado de la Prescripcion
<br>
Este caso nos presenta la capacidad de realizar cambios del estado de una prescripción, estos cambios de estados son:
* active
* on-hold
* cancelled
* completed 
* entered-in-error
* stopped 
* draft
* unknown
<div align="center" >
  {% include DS3.svg %}
</div>
<br clear="all"/>
<br>

**Caso de uso 4:** Leer Fármaco
<br>
INFORMACION
<div align="center" >
  {% include DS4.svg %}
</div>
<br clear="all"/>
<br>