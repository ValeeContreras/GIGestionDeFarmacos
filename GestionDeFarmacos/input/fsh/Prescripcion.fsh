Profile: PrescripcionRecetaCL
Parent: MedicationRequest
Id: PrescripcionRecetaCL
Title: "Prescripción"
Description: "Este Perfil describe la información contenida en la Prescripción de un medicamento"

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

* subject only Reference (Paciente)
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
* recorder only Reference (Practitioner)
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

* dosageInstruction only ClDosage

* priorPrescription 0..1
* priorPrescription ^short = "Prescripción u orden a la cual esta reemplaza"
* priorPrescription ^definition = "Prescripción u orden a la cual esta reemplaza"
* priorPrescription.reference ^short = "Recurso MedicationDispense que se reemplaza."
* priorPrescription.reference ^definition = "Recurso MedicationDispense que se reemplaza."
* priorPrescription.display ^short = "Detalle de la orden o prescripción a la cual esta reemplaza."


Instance: Ejemploprescipcion1
InstanceOf: PrescripcionRecetaCL
Usage: #example
* status = #active
* intent = #order
* medicationReference = Reference(Medication/medicamento1)
* subject = Reference(Patient/EjemploPaciente)
* requester = Reference(Practitioner/Prestador1)
* groupIdentifier.value = "7f5b95f78a375236d71f"
* note.text = "En caso de fiebre"
//* dosageInstruction = EjemploDosage BUSCAR COMO HACERLO

Instance: EjemploMedicamento
InstanceOf: Medication
Usage: #inline
Title: "Ejemplo Medicamento"
Description: "Ejemplo medicamento"
* id = "medicamento1"
* meta.profile = "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/CoreMedicamentoCl"
* identifier[0].use = #official
* identifier[=].system = "http://minsal.cl/semantikos/description-id"
* identifier[=].value = "1991971000167110"
* identifier[+].use = #official
* identifier[=].system = "http://minsal.cl/semantikos/concept-id"
* identifier[=].value = "840851000167103"
* code.text = "Tareg - D 160 / 25 comprimido recubierto (Novartis)"

Instance: EjemploPrestador
InstanceOf: Practitioner
Usage: #inline
Title: "Ejemplo Prestador"
Description: "Ejemplo Prestador"
* id = "Prestador1"
* name.given = "Sebastian Alberto"
* name.family = "Navarro"

/*
Instance: EjemploPrescipcion2
InstanceOf: PrescripcionRecetaCL
Usage: #example
* status = #active
* intent = #order
* subject = Reference(Patient/Paciente1) "María Carmen de los Angeles Del río"
* medicationReference = Reference(Medication/1690341000167110) "prednisona 20 mg comprimido"
* requester = Reference(Practitioner/3309267) "Maria Carmen De los angeles Del rio Gonzalez"
* groupIdentifier.value = "47g7a524age7b5a2cf0a"
* dosageInstruction.text = "Administrar 1 Comprimido cada 4 horas por 24 horas"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.period = 4
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #h
* dosageInstruction.timing.repeat.boundsDuration = 24 'h'
* dosageInstruction.route = CSViasAdmin#26643006 "vía Oral route (calificador)"
* dosageInstruction.method = CSMetodos#738995006 "Tragar (método de administración)"
* dosageInstruction.doseAndRate.doseQuantity = 1 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#comprimido "Comprimido"
* dispenseRequest.validityPeriod.start = "2022-08-19"
* dispenseRequest.validityPeriod.end = "2022-08-20"
* dispenseRequest.performer = Reference(Organization/8qj5s1ostjswt3r95vnv) "Centro de Salud Familiar Juan Pablo II (La Serena)"
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#outpatient "Outpatient"
* courseOfTherapyType = CSCodificacionPatron#seasonal "Por temporada"
* identifier.type = CSTipoPrescripcion#Id_Local "Id_Local"
* identifier.system = "https://innovaquidad.cl/integracion_minsal/idRecetaElectronica"
* identifier.value = "e815615ef9ee7afb52be"
* identifier.assigner.identifier.system = "https://api-receta.minsal.cl/v2/Organization/8qj5s1ostjswt3r95vnv"
* identifier.assigner.display = "Centro de Salud Familiar Juan Pablo II (La Serena)"
*/

/*
Instance: Ejemplo3-prescipcion
InstanceOf: PrescripcionRecetaCL
Usage: #example
* status = #active
* intent = #order
* subject = Reference(Patient/Paciente1) "María Carmen de los Angeles Del río"
* medicationReference = Reference(Medication/1683511000167113) "ácido alendrónico 70 mg comprimido y carbonato de calcio 1289 mg (calcio 500 mg) + colecalciferol 400 UI comprimido"
* requester = Reference(Practitioner/3309267) "Maria Carmen De los angeles Del rio Gonzalez"
* groupIdentifier.value = "51c6bcc8ga342820c9b9"
* dosageInstruction.text = "Administrar 1 Comprimido cada 1 semana por 1 año. Administrar el día Lunes"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #wk
* dosageInstruction.timing.repeat.boundsDuration = 1 'a'
* dosageInstruction.timing.repeat.dayOfWeek = #mon
* dosageInstruction.route = CSViasAdmin#26643006 "vía Oral route (calificador)"
* dosageInstruction.method = CSMetodos#738995006 "Tragar (método de administración)"
* dosageInstruction.doseAndRate.doseQuantity = 1 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#comprimido "Comprimido"
* dispenseRequest.validityPeriod.start = "2022-08-20"
* dispenseRequest.validityPeriod.end = "2023-08-20"
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#community "community"
* courseOfTherapyType = CSCodificacionPatron#continuous "Terapia continua a largo plazo"
//* extension[ProdComercial].url = "https://rme.hl7chile.cl/StructureDefinition/ProdComercial"
////* extension[ProdComercial].valueReference = Reference(Medication/1973011000167111)
* note.text = "Consumir a primera hora de la mañana, con el estómago vacío. Alimento luego de 1 hora de tomar el medicamento"


Instance: Ejemplo4-prescipcion
InstanceOf: PrescripcionRecetaCL
Usage: #example
* status = #active
* intent = #order
* subject = Reference(Patient/Paciente1) "María Carmen de los Angeles Del río"
* medicationReference = Reference(Medication/1667301000167110) "clonazepam 0,5 mg comprimido"
* requester = Reference(Practitioner/3309267) "Maria Carmen De los angeles Del rio Gonzalez"
* groupIdentifier.value = "61g5ge0c02769206396c"
* dosageInstruction.text = "Administrar 1 Comprimido cada 12 horas por 30 días"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.period = 12
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #h
* dosageInstruction.timing.repeat.boundsDuration = 30 'd'
* dosageInstruction.route = CSViasAdmin#26643006 "vía Oral route (calificador)"
* dosageInstruction.method = CSMetodos#738995006 "Tragar (método de administración)"
* dosageInstruction.doseAndRate.doseQuantity = 1 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#comprimido "Comprimido"
* dispenseRequest.validityPeriod.start = "2022-08-19"
* dispenseRequest.validityPeriod.end = "2022-09-18"
* dispenseRequest.quantity.value = 60
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#discharge "Discharge"
* courseOfTherapyType = CSCodificacionPatron#acute "Terapia a corto plazo (aguda)"
 

Instance: Ejemplo5-prescipcion
InstanceOf: PrescripcionRecetaCL
Usage: #example
* status = #active
* intent = #order
* subject = Reference(Patient/Paciente1) "María Carmen de los Angeles Del río"
* medicationReference = Reference(Medication/1667701000167114) "insulina humana NPH 1000 UI/10 mL (100 UI/mL) inyectable"
* requester = Reference(Practitioner/3309267) "Maria Carmen De los angeles Del rio Gonzalez"
* groupIdentifier.value = "825c1968g3621adgbc17"
* dosageInstruction.text = "Administrar 10 - 20 Unidades Internacionales cada 12 horas por 3 días"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.period = 12
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #h
* dosageInstruction.timing.repeat.boundsDuration = 3 'd'
* dosageInstruction.route = CSViasAdmin#26643006 "vía Oral route (calificador)"
* dosageInstruction.method = CSMetodos#740685003 "Inyección (método de administración)"
* dosageInstruction.doseAndRate.doseRange.low = 10 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#unidades-internacionales "Unidades Internacionales"
* dosageInstruction.doseAndRate.doseRange.high = 20 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#unidades-internacionales "Unidades Internacionales"
* dispenseRequest.validityPeriod.start = "2022-08-19"
* dispenseRequest.validityPeriod.end = "2022-08-26"
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#inpatient "Inpatient"
* courseOfTherapyType = CSCodificacionPatron#acute "Terapia a corto plazo (aguda)"
////* extension[ProdComercial].url = "https://rme.hl7chile.cl/StructureDefinition/ProdComercial"
////* extension[ProdComercial].valueReference = Reference(Medication/2034051000167119) "insulatard suspensión inyectable (Novo Nordisk)"
* note.text = "Administrar la cantidad según resultado de glucosa en sangre"

Instance: Ejemplo6-prescipcion
InstanceOf: PrescripcionRecetaCL
Usage: #example
* status = #active
* intent = #order
* subject = Reference(Patient/Paciente1) "María Carmen de los Angeles Del río"
* medicationReference = Reference(Medication/1669781000167113) "enalapril 10 mg comprimido"
* requester = Reference(Practitioner/3309267) "Maria Carmen De los angeles Del rio Gonzalez"
* groupIdentifier.value = "bcg7g47e8geabbd2590z"
* dosageInstruction.text = "Administrar 1 Comprimido cada 1 día por 1 año"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.timing.repeat.boundsDuration = 1 'a'
* dosageInstruction.route = CSViasAdmin#26643006 "vía Oral route (calificador)"
* dosageInstruction.method = CSMetodos#738995006 "Tragar (método de administración)"
* dosageInstruction.doseAndRate.doseQuantity = 1 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#comprimido "Comprimido"
* dispenseRequest.validityPeriod.start = "2022-08-19"
* dispenseRequest.validityPeriod.end = "2023-08-19"
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#community "community"
* courseOfTherapyType = CSCodificacionPatron#continuous "Terapia continua a largo plazo"
//* extension[ProdComercial].url = "https://rme.hl7chile.cl/StructureDefinition/ProdComercial"
////* extension[ProdComercial].valueReference = Reference(Medication/1965501000167112) "enalten 10 mg comprimido (Saval)"

Instance: Ejemplo7-prescipcion
InstanceOf: PrescripcionRecetaCL
Usage: #example
* status = #active
* intent = #order
* subject = Reference(Patient/Paciente1) "María Carmen de los Angeles Del río"
* medicationReference = Reference(Medication/1667741000167112) "hidroclorotiazida 25 mg + triamtereno 50 mg comprimido"
* requester = Reference(Practitioner/3309267) "Maria Carmen De los angeles Del rio Gonzalez"
* groupIdentifier.value = "bcg7g47e8geabbd2590z"
* dosageInstruction.text = "Administrar 1 Comprimido cada 1 día por 1 año"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.timing.repeat.boundsDuration = 1 'a'
* dosageInstruction.route = CSViasAdmin#26643006 "vía Oral route (calificador)"
* dosageInstruction.method = CSMetodos#738995006 "Tragar (método de administración)"
* dosageInstruction.doseAndRate.doseQuantity = 1 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#comprimido "Comprimido"
* dispenseRequest.validityPeriod.start = "2022-08-19"
* dispenseRequest.validityPeriod.end = "2023-08-19"
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#community "community"
* courseOfTherapyType = CSCodificacionPatron#continuous "Terapia continua a largo plazo"
//* extension[ProdComercial].url = "https://rme.hl7chile.cl/StructureDefinition/ProdComercial"
////* extension[ProdComercial].valueReference = Reference(Medication/2034171000167114) "hidroronol T comprimido (ITF - Labomed)"
* note.text = "Tomar en las mañanas"


Instance: Ejemplo8-prescipcion
InstanceOf: PrescripcionRecetaCL
Usage: #example
* status = #active
* intent = #order
* subject = Reference(Patient/Paciente1) "María Carmen de los Angeles Del río"
* medicationReference = Reference(Medication/1668191000167115) "ketorolaco 30 mg comprimido sublingual"
* requester = Reference(Practitioner/3309267) "Maria Carmen De los angeles Del rio Gonzalez"
* groupIdentifier.value = "f89ba220g4455d6891f7"
* dosageInstruction.text = "Administrar 0.5 - 1 Comprimidos cada 8 - 12 horas por 1 a 2 semanas"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.period = 8
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #h
* dosageInstruction.timing.repeat.periodMax = 12
* dosageInstruction.timing.repeat.boundsRange.low = 1 'wk' "wk"
* dosageInstruction.timing.repeat.boundsRange.high = 2 'wk' "wk"
* dosageInstruction.route = CSViasAdmin#37839007 "vía de administración por debajo de la lengua (calificador)"
* dosageInstruction.method = CSMetodos#738990001 "Administración (método de administración)"
* dosageInstruction.doseAndRate.doseRange.low = 0.5 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#comprimido "Comprimido"
* dosageInstruction.doseAndRate.doseRange.high = 1 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#comprimido "Comprimido"
* dispenseRequest.validityPeriod.start = "2022-08-19"
* dispenseRequest.validityPeriod.end = "2022-09-18"
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#community "community"
* courseOfTherapyType = CSCodificacionPatron#acute "Terapia a corto plazo (aguda)"
//* extension[ProdComercial].url = "https://rme.hl7chile.cl/StructureDefinition/ProdComercial"
////* extension[ProdComercial].valueReference = "Medication/1976661000167112"
* note.text = "Tomar según intensidad del dolor"
*/
