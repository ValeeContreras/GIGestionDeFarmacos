Profile:        PrescripcionRecetaCL2
Parent:         MedicationRequest
Id:             RecetaPrescripcionCl
Title:          "Prescripción"
Description:    "Este Perfil describe la información contenida en la Prescripción de un medicamento"

* identifier MS
  * type MS
    * coding MS
      * system and code and display MS
  * system and value and assigner MS
    * display and reference MS
* status and statusReason MS
  * coding MS
    * system and code and display MS
  * text MS
* intent and category MS
  * coding MS
    * system and code and display MS
* medicationReference MS
  * reference and display MS
* subject MS
  * reference and display MS
* authoredOn and requester MS
  * reference and display MS
* recorder MS
  * reference and display MS
* groupIdentifier MS
  * value MS
* courseOfTherapyType MS
  * coding MS
    * system and code and display MS
* note MS
* priorPrescription
  * reference and display MS

* identifier 0..2
* identifier ^short = "Pueden ser 3 tipos de identificación de Receta: Id_Local| Id_Cheque| Id_Receta_Grafica"
* identifier ^definition = "La identificación local puede ser dada localmente, puede ser la de la Receta Cheque o la identificación dada al ser escaneada una receta a papel. En cualquir caso no pueden ir aparejadas una identificación de receta cheque con una de receta gráfica"
* identifier.type ^short = "Identifica el tipo de Prescripción códigos válidos Id_Local| Id_Cheque| Id_Receta_Grafica"
* identifier.type ^definition = "Se consideran 3 códgos externos al ValueSet dado la extensibilidad del binding"
* identifier.type.coding.system ^short = "Identidad del sistema de codificación"
* identifier.type.coding.system ^definition = "Identidad del sistema de codificación"
* identifier.type.coding.code ^short = "Símbolo o sintaxis definida en el sistema"
* identifier.type.coding.code from VSTipoPrescripcion (required)
* identifier.type.coding.display ^short = "Texto representativo del código"
* identifier.system ^short = "Namespace del identificador"
* identifier.system ^definition = "URL sobre la cual se determina el formato y procedencia del valor del identificador"
* identifier.value ^short = "Código Identificador"
* identifier.assigner.display ^short = "Organización en texto libre que dio el numero."
* identifier.assigner.display ^definition = "Organización en texto libre que dio el número identificador. DEBE ser informado en caso que la identificación sea de tipo Local"
* identifier.assigner.display ^short = "Nombre de la organización a la cual se hace la referencia"
* identifier.assigner.display ^short = "Nombre de la organización a la cual se hace la referencia"
* identifier.assigner.reference ^short = "Referencia a la organización que le dio el numero identificador"

* status from http://hl7.org/fhir/ValueSet/medicationrequest-status (required)
* status ^short = "active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown código del estado de la receta del medicamento prescrito  (requerido)"

* intent ^short = "proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option Intención para la cual es indicado el medicamento (requerido). Se Forzará siempre a order"
* intent from http://hl7.org/fhir/ValueSet/medicationrequest-intent (required)
* intent = #order

* statusReason 0..1
* statusReason ^short = "Este dato es Obligatorio condicional a que haya un cambio de estado de la Receta (R2). Es la razón por la cual se cambia el estado de la receta"
* statusReason.coding.system ^short = "Sistema de códigos a ocupar."
* statusReason.coding.code ^short = "Código relacionado al estado."
* statusReason.coding.code from VSStatusReason (extensible)
* statusReason.coding.display ^short = "Descripción del código."
* statusReason.text ^short = "Texto que representa el concepto. Si el código es #otra entonces debe describirse aquí la razón"
* statusReason.text ^definition = "Texto que representa el concepto. Si el código es #otra entonces debe describirse aquí la razón"

* groupIdentifier 1..1
* groupIdentifier.value 1..1
* groupIdentifier ^short = "Código identificador de grupo que debe ser el mismo con el cual se identificará el RequestGroup de la receta. Se genera como un NanoId."
* groupIdentifier ^definition = "Este número vincula el contenedor (RequestGroup) con todos los fármacos prescritos durante la atención del paciente (medicationRequest). Este hará el uso de Receta y el grupo de fármacos co misma identificación grupal. El formato debe ser NanoId."
* groupIdentifier ^comment = "El elemento groupIdentifier de los recursos MedicationRequest generados durante el mismo acto clínico deberán coincidir con el que se genere en el recurso RequestGroup. Este identificador debe ser generado como un valor NanoId."
* groupIdentifier.value ^short = "Identificador de grupo."
* groupIdentifier.value ^definition = "Identificador de grupo."

* category 0..*
* category ^short = "Tipo de Acto clínico en el cual se realiza la Prescripción."
* category ^definition = "Se reconoce según la tabla de Hl7 cual es el tipo de acto clínico en el cual se desarrollan las prescripciones"
* category.coding.system ^short = "Namespace para códigos"
* category.coding.system ^definition = "CodeSystem de donde pertenecen los códigos a usar"
* category.coding.code ^short = "Código relacionado"
* category.coding.code ^definition = "Código relacionado"
* category.coding.code from VSCodificacionCategoria (extensible)
* category.coding.display ^short = "Glosa del código"
* category.coding.display ^definition = "Glosa del código según su definición de la tabla de HL7"

* medicationReference 0..1
* medicationReference ^short = "Referencia al medicamento que se prescribe."
* medicationReference ^definition = "Referencia al medicamento que se prescribe, la cual se encuentra disponible en el //servicio de la TFC."
* medicationReference.reference ^short = "uri del recurso. Para el caso el repositorio se encuentra en \"https:////api-receta.minsal.cl/v2/Medication\""
* medicationReference.display ^short = "Descripción del fármaco, según definición TFC"

* extension contains ProdComercial named PComercial 0..1 MS
* extension ^short = "Determinación del medicamento en Producto Comercial"
* extension ^definition = "Determinación de un medicamento en Producto Comercial. Para eso esta extensión define una Referencia solo a un recurso de medication. "

* subject only Reference (Patient)
* subject ^short = "Referencia al paciente a quien se le prescribe"
* subject ^definition = "La referencia en este caso solo se hace sobre el paciente al cual se le prescribe el fármaco independiente que sea otra la persona que hace retiro de estos"
* subject.reference ^short = "Referencia al recurso del paciente. \"https://api-receta.minsal.cl/v2/Patient\""
* subject.display ^short = "Nombre paciente"

* authoredOn 0..1
* authoredOn ^short = "Fecha y hora en la cual fue prescrito el medicamento en formato YYYY-MM-DDThh:mm:ss+zz:zz"
* authoredOn ^definition = "Fecha y hora en la cual fue prescrito el medicamento en formato YYYY-MM-DDThh:mm:ss+zz:zz, e.j. 2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17-05:00 o 2017-01-01T00:00:00.000Z"

* requester 1..1    
* requester only Reference (Practitioner)
* requester ^short = "Referencia al Prescriptor"
* requester ^definition = "En este caso la referencia será sobre una persona que es Prescritpr  validado por la SIS"
* requester.reference ^short = "Recurso asociado al Prescriptor  \"https://api-receta.minsal.cl/v2/Practitioner\""
* requester.display ^short = "Nombre Prescriptor"

* recorder 0..1
//* recorder only Reference(PrestadorCL)
* recorder only Reference(Practitioner)
* recorder ^short = "Referencia a un sujeto, que será el que registra la receta"
* recorder ^definition = "En este caso la referencia será sobre una persona que es un prescriptor validado por la SIS"
* recorder.reference ^short = "Recurso asociado \"http://api-receta.minsal.cl/v2/Practitioner\""
* recorder.display ^short = "Nombre de quien registra la prescripción"

* courseOfTherapyType 0..1
* courseOfTherapyType ^short = "Expresa el patrón en la administración del medicamento"
* courseOfTherapyType ^definition = "La descripción del patrón general de la administración del medicamento al paciente."
* courseOfTherapyType.coding.system ^short = "Sistema de códigos a ocupar, se hará uso sel set de valores de hl7 MedicationRequest-course-of-therapy"
* courseOfTherapyType.coding.code from http://hl7.org/fhir/ValueSet/medicationrequest-course-of-therapy
* courseOfTherapyType.coding.code ^short = "Código relacionado con el patrón de administración"
* courseOfTherapyType.coding.display ^short = "Descripción del código"

* note 0..*
* note ^short = "Texto libre en donde se expresan las instrucciones de como el medicamento debe ser administrado"
* note ^definition = "Información adicional sobre la prescripción que no puede ser transmitida por los otros atributos."

* dosageInstruction only cl-dosage

* priorPrescription 0..1
* priorPrescription ^short = "Prescripción u orden a la cual esta reemplaza"
* priorPrescription ^definition = "Prescripción u orden a la cual esta reemplaza"
* priorPrescription.reference ^short = "Recurso MedicationDispense que se reemplaza."
* priorPrescription.reference ^definition = "Recurso MedicationDispense que se reemplaza."
* priorPrescription.display ^short = "Detalle de la orden o prescripción a la cual esta reemplaza."

/*
Instance : PrescripcionRecetaCL
Title : "Ejemplo Prescripción de Medicamento Oxycodone Vía Oral, una o dos tabletas al día cada 4 o 6 horas, para una solicitud según necesidad con pre-condiciones"
InstanceOf : RecetaPrescripcionCl  
Usage: #example
* identifier.system = "http://recetaelectronica.minsal.cl/validar_tipo_receta"
* identifier.value = "RNCheque-1232"
* status = #active
* intent = #order
* category.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-category"
* category.coding.code = #outpatient
* groupIdentifier.value = "tv829fxi21tqloo5fl2n"
* medicationReference.reference = "https://api-receta.minsal.cl/v2/Medication/Medicamento#1345"
* medicationReference.display = "Oxycodone"
* extension[ProdComercial].valueReference.reference = "https://api-receta.minsal.cl/v2/Medication/med#1257"
* extension[ProdComercial].valueReference.display = "Oxycontin MR"
* subject.reference = "https://api-receta.minsal.cl/v2/Patient/Paciente#2411224"
* subject.display = "Patricio Perez"
* authoredOn = "2021-06-12"
* requester.reference = "https://api-receta.minsal.cl/v2/Practitioner/PRestador#923421"
* requester.display = "Cecilia Ampuero"
* note.text = "Al paciente se le indicó que lo administrara durante comidas"

Instance: PrescripcionRecetaCL-2
Title: "Ejemplo de Prescripción de Hidroclorotizida + Valsartán, Prescrito dos veces al día Vía Oral, tragándoselo"
InstanceOf: RecetaPrescripcionCl
Usage: #example
* identifier.type.coding.code = #Id_Local
* identifier.type.coding.display = "Identificación Local"
* identifier.system = "http://recetaelectronica.minsal.cl/validar_tipo_receta"
* identifier.value = "10101010"
* identifier.assigner.display = "CESFAM COQUIMBO"
* status = #active
* intent = #order
* category.coding.code = #outpatient
* medicationReference = Reference(https://api-receta.minsal.cl/v2/Medication/1703591000167111) "Hidroclorotiazida 25 mg + Valsartán 160 mg comprimido"
* subject = Reference(https://api-receta.minsal.cl/v2/Patient/3254156114) "FELIPE MAURICIO MANCINI RUIZ-TAGLE"
* requester = Reference(https://api-receta.minsal.cl/v2/Practitioner/3253825513) "JUAN JOSÉ ORTEGA CALLEJAS"
* authoredOn = "2021-08-15T17:31:00Z"
* groupIdentifier.value = "64e51a53-97d3-44dc-bbfe-1c8697697763"
*/