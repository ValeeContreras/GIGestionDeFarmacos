### Casos de uso del proyecto
El proyecto implica la generación de recetas médicas por parte del prescriptor, cada una detallando los medicamentos recetados. Este enfoque se implementa mediante la definición de un "agrupador de prescripciones", que se utiliza en el proceso de prescripción. Por lo tanto, el repositorio incluye servicios que permiten diferenciar una receta de las prescripciones individuales contenidas en ella.
<br>
Actualmente, la generación de una receta desde el prescriptor incluye el detalle de cada fármaco prescrito. Este concepto se implementará a través de un agrupador de prescripciones. En consecuencia, el sistema de repositorio proporcionará servicios para diferenciar la receta de las prescripciones individuales.
<br>
El diagrama de secuencia correspondiente es el siguiente:
<br>

<div align="center" >
  {% include Secuencia.svg %}
</div>
<br clear="all"/>

### Casos de uso

#### Caso de uso 1:Crear/Guardar Prescripcion

Este caso de uso describe la generación de una Receta con una o múltiples Prescripciones generadas durante una cita medica. La Receta generada se envía al Repositorio y queda disponible. Es necesario tener la siguiente información:
* Nombre del pacinte
* Medicamento
* Prestador que genera la prescripción
* Dosage

<div align="center" >
  {% include C1.svg %}
</div>
<br clear="all"/>

##### Operación
El envío de la receta se hace por medio de la operación **POST**, sobre el recurso RequestGroup. 
<br>
```
POST [URL_Base]/RequestGroup
```
<br>

#### Caso de uso 2: Modificar Prescripción
Este caso nos presenta la capacidad de realizar cambios en una prescripción, estos errores hacen referencian a:
* Errores tipograficos
* Dosage
* Medicamento
* Periodo en el cual se realizan las repeticiones
* Periodo Máximo en el cual se realizan las prescripciones
* Entre otros

<div align="center" >
  {% include C2.svg %}
</div>
<br clear="all"/>

##### Operación
Modificar una prescripción se hace de por medio de la operación **PUT**, sobre la identidicación del recurso RequestGroup. Se considera para este caso armar el recurso RequestGroup completo con las modificaciones a realizar para luego actualizar
<br>
```
PUT [URL_Base]/MedicationRequest/[id]
```
<br>

#### Caso de uso 3: Cambio de estado de la Prescripción
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
  {% include C3.svg %}
</div>
<br clear="all"/>

##### Operación 
Cambiar el estado de una prescripción se hace de por medio de la operación **PUT**, sobre la identidicación del recurso RequestGroup.
<br>
```
PUT [URL_Base]/MedicationRequest/[id]
```
<br>

#### Caso de uso 4: Lectura del Fármaco
Este caso de uso se desarrolla en el momento en que el ususario puede acceder a la vizualización de sus prescripciones para revisar el historial y detalles de sus recetas. 

<div align="center" >
  {% include C4.svg %}
</div>
<br clear="all"/>

##### Operaciones
Se utiliza el metodo **GET** para poder acceder a la información  de las prescripciones y sus detalles. Quedando la siguiente transaccion:

1.- Lectura con el identificador del paciente de las Recetas:
<br>

```
GET [URL_Base] RequestGroup?patient=Patient.identifier={identifier}
```