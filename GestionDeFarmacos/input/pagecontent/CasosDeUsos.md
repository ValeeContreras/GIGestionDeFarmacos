### Casos de uso del proyecto
El proyecto implica la generación de recetas médicas por parte del prescriptor, cada una detallando los medicamentos recetados. Este enfoque se implementa mediante la definición de un "agrupador de prescripciones", que se utiliza en el proceso de prescripción. Por lo tanto, el repositorio incluye servicios que permiten diferenciar una receta de las prescripciones individuales contenidas en ella.
<br>
<br>
Actualmente, la generación de una receta desde el prescriptor incluye el detalle de cada fármaco prescrito. Este concepto se implementará a través de un agrupador de prescripciones. En consecuencia, el sistema de repositorio proporcionará servicios para diferenciar la receta de las prescripciones individuales.
<br>
El diagrama de secuencia correspondiente es el siguiente:
<br>

<div align="center" >
  {% include DiagramaSecuencia.svg %}
</div>
<br clear="all"/>


### Casos de uso

#### Caso de uso 1:Crear/Guardar Prescripcion
Este caso de uso describe la generación de una Receta con una o múltiples Prescripciones generadas durante una cita medica. La Receta generada se envía al Repositorio y queda disponible.

<div align="center" >
  {% include DS1.svg %}
</div>
<br clear="all"/>

##### Operación
El envío de la receta se hace por medio de la operación POST, sobre el recurso RequestGroup. 
<br>
POST [URL_Base]/RequestGroup/
<br>

#### Caso de uso 2: Modificar Prescripcion
Este caso nos presenta la capacidad de realizar cambios en una prescripción, estos cambios pueden ser:
* Secuencia
* Frecuencia
* Periodo en el cual se realizan las repeticiones
* Periodo Máximo en el cual se realizan las prescripciones
* Errores tipograficos
* Entre otros

<div align="center" >
  {% include DS2.svg %}
</div>
<br clear="all"/>

##### Operación
Modificar una prescripción se hace de por medio de la operación PUT, sobre la identidicación del recurso RequestGroup. Se considera para este caso armar el recurso RequestGroup completo con las modificaciones a realizar para luego actualizar
<br>
PUT [URL_Base]/RequestGroup/[id]
<br>

#### Caso de uso 3: Cambio de estado de la Prescripcion
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

##### Operación 
Cambiar el estado de una prescripción se hace de por medio de la operación PUT, sobre la identidicación del recurso RequestGroup.
<br>
PUT [URL_Base]/RequestGroup/[id]
<br>

#### Caso de uso 4: Lectura del Fármaco
Este caso de uso se desarrolla en el momento en que el paciente quiere obtener información respecto a sus recetas/prescripciones.

<div align="center" >
  {% include DS4.svg %}
</div>
<br clear="all"/>

##### Operaciones
*Aca estaran las operaciones GET