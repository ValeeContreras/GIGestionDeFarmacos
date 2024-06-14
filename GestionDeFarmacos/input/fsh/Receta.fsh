Profile:        RecetaCl
Parent:         RequestGroup
Id:             RecetaCl
Title:          "Receta"
Description:    "Este Perfil utiliza este recurso como un contenedor de Prescripciones, de tal forma de poder ser utilizado como formato de Receta electrónica con los fármacos indicados por el clínico durante un acto de indicación farmacológica."

* groupIdentifier MS
  * value MS
* status and intent and subject MS
  * reference and display MS
* authoredOn MS

* groupIdentifier 1..1
* groupIdentifier ^short = "Identificador agrupador que debe ser el mismo con el cual se identifican las prescripciones en el acto clínico. El identificador debe ser del tipo NanoId"
* groupIdentifier ^definition = "Este número vincula el contenedor con todos los fármacos prescritos durante la atención del paciente. Este hará el uso de Receta y el grupo de fármacos con misma identificación grupal. El formato debe ser el de un NanoId"
* groupIdentifier.value ^short = "Identificador de grupo"

* status 1..1
* status ^short = "draft | active | on-hold | revoked | completed | entered-in-error | unknown"
* status ^definition = "El estado de la receta se describe como activa (aún no ha sido dispensada) o completada (se dispensó). En caso que las prescripciones no se dispensen entonces la receta pasa a estado cancelada"
* status ^comment = "Es válido hacer uso solo de los estados active y completed. En el caso que la receta ha sido recién creada esta se generá con estado **active**. Al momento de dispensar todos las prescripciones, la receta pasa a estado **completed**. Si esta nunca es dispensada se usa el código de **cancelled**"

* intent 1..1
* intent ^short = "proposal | plan | directive | order | original-order | reflex-order | filler-order | instance-order | option"
* intent ^definition = "Dado que la receta siempre sera creada para receta y enviada al repositorio Central entonces el estado se debe forzar a order"
* intent = #order
* intent ^comment = "Debe ser siempre order"

* subject only Reference(Patient)
* subject 1..1
* subject ^short = "Información acerca del paciente al cual se le ha indicado la receta"
* subject.reference ^short = "Referencia al recurso del paciente al cual se le genera la receta"
* subject.display ^short = "Nombre del paciente al cual pertenece el recurso que está referenciando"

* authoredOn 1..1
* authoredOn ^short = "Fecha y hora cuando la receta fue generada. Formato YYYY-MM-DDThh:mm:ss+zz:zz, ej: 2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17-05:00 or 2017-01-01T00:00:00.000Z"
* authoredOn ^short = "Fecha y hora cuando el medicamento fue dispensado. Se debe especificar en formato de fecha según HL7. YYYY-MM-DDThh:mm:ss+zz:zz, ej. 2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17-05:00 or 2017-01-01T00:00:00.000Z."
* authoredOn ^comment = "No soporta formato 24 hrs"

* basedOn ^comment = "Campo el cual se debe agregar la referencia hacia los medicamentos que se incluyen en esta receta. Con medicamentos incluidos, se hace refencia a los medicamentos agregados dentro del elemento \"contained\""
* basedOn ^short = "Referencia a las prescipciones que contiene la receta"
* basedOn 0..* MS
* basedOn only Reference(PrescripcionRecetaCL)

Instance: EjemploReceta1
InstanceOf: RecetaCl
Usage: #example
Title: "Ejemplo Receta 1"
Description: "Aca esta el ejemplo de la recera N°1"
* groupIdentifier.value = "z4fxajxh2kdkock9pvsp"
* status = #active
* intent = #order
* subject = Reference(Patient/EjemploPaciente)
* authoredOn = "2021-06-12T17:31:00Z"


Instance: EjemploReceta2
InstanceOf: RecetaCl
Usage: #example
Title: "Ejemplo Receta 2"
Description: "Aca esta el ehemplo de receta N°2"
* groupIdentifier.value = "z4fxajxh2kdkock9pvspN2"
* status = #draft
* intent = #order
* subject = Reference(Patient/EjemploPaciente)
* authoredOn = "2024-06-13T17:48:00Z" 


/*
Instance: medicationrequest-2
InstanceOf: RecetaPrescripcionCl
Usage: #inline
* identifier.type.coding.code = #Id_Local
* identifier.type.coding.display = "Identificación Local"
* identifier.system = "http://recetaelectronica.minsal.cl/validar_tipo_receta"
* identifier.value = "10101011"
* identifier.assigner.display = "CESFAM COQUIMBO"
* status = #completed
* intent = #order
* category.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-category"
* category.coding.code = #outpatient
* groupIdentifier.value = "z4fxajxh2kdkock9pvsp"
* medicationReference.reference = "Medication/Medicamento#1028"
* subject = Reference(https://api-receta.minsal.cl/v2/Patient/3254156114) "FELIPE MAURICIO MANCINI RUIZ-TAGLE"
* requester = Reference(https://api-receta.minsal.cl/v2/Practitioner/3253825513) "JUAN JOSÉ ORTEGA CALLEJAS"
* authoredOn = "2021-08-15T17:31:00Z"
* note.text = "Al paciente se le indicó lo tome 2 veces al día"
*/