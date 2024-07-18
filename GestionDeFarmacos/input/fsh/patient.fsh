Profile: Paciente
Parent: Patient 
Title: "Paciente"
Description: "Este Perfil del paciente ha sido desarrollado para cubrir las necesidades de Agenda para APS."

* name 1..*
  * ^short = "Nombre asociado al paciente" 
  * ^definition = "Patient.name: Un nombre asociado con el individuo."
  * family 1..1
    * ^short = "Primer Apellido del paciente"
    * extension contains http://hl7.org/fhir/StructureDefinition/humanname-mothers-family named SegundoApellido 0..1
   
* identifier 1..1 
* identifier ^short = "Listados de Id de Paciente. De poseer una CI con RUN vigente, este DEBE ser ingresado"
* identifier ^definition = "Este es el listado de Identificaciones de un paciente. Se procura como R2 el RUN, pero en caso de no existir ese identificador se debe ocupar otro nacional u otro otorgado por país extranjero"
* identifier ^comment = "En caso de que el paciente posea una CI con número RUN válido, este debe ser ingresado como identificador, independiente de que tenga otros identificadores, los cuales también pueden ser ingresados. La identificación implica el ingreso del tipo de documento, el país de origen de ese documento y ev valor del identificador"
* identifier.extension MS
* identifier.use MS
* identifier.use ^definition = "Se definirá este uso siempre como \"official\" debido a que cualquier ID presentado para motivos de este perfil deb ser de este tipo"
* identifier.use ^comment = "Se definirá como official pues en una primera etapa solo se considerarán los identidicadores en esa categoría. Para una segunda etapa se abrirá este elemento para cualquier clase de identificador"
* identifier.type MS
* identifier.type from https://hl7chile.cl/fhir/ig/clcore/ValueSet/VSTiposDocumentos (extensible)
* identifier.type ^short = "Tipo de documento de Id (Extensible)"
* identifier.type ^definition = "Se define como tipo de documento de Id, aquel definido en el Sistema de Codificación V2-0203 de Hl7. Este sistema es extensible. Para pacientes sin documeto local deben especificar el de origen. Pacientes sin Id, deben usar el código MR = Local Medical Record, es decir numero del registro clínico abierto en el establecimiento"
* identifier.type ^comment = "De haber RUN, este se debe usar. De haber Run temporal, se debe usar ese identificador. Pacientes sin identificador Chileno deben usar su CI o Pasaporte de origen. Pacientes sin identificación se debe registrar con el numero de registro clínico generado en el recinto de salud"
* identifier.type ^binding.description = "Value Set de Tipos de Documentos y CI Nacionales"
* identifier.type.extension ^short = "País de Origen del Documento de Id"
* identifier.type.extension ^definition = "Se usa esta extensión para agregarle al tipo de documento el país de origen de este"
* identifier.type.extension contains https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/CodigoPaises named paises 0..1 MS
* identifier.type.coding MS
* identifier.type.coding.system MS
* identifier.type.coding.system ^short = "Sistema de identificación de tipos de documentos"
* identifier.type.coding.system ^definition = "Sistema mediante el cual se obtienen los códigos para un determinado tipo de documento"
* identifier.type.coding.system ^comment = "En la URL del sistema se describe el set de códigos. Por ejemplo si se desea usar Cédula de identidad el código es NNxxx en donde xxx corresponde al identificador del país según la norma iso3166-1-N. Dado lo anterior si fuera Chile, el tipo de documento sería NNCL. En el Caso de Usar un Pasaporte este no requiere identificar país de origen dado que este es un elemento adicional, por lo que independiente del país el código será PPT según el VS indicado"
* identifier.type.coding.code MS
* identifier.type.coding.code ^short = "Código de Tipo de Documento"
* identifier.type.coding.code ^definition = "Código de Tipo de Documento"
* identifier.type.coding.display MS
* identifier.type.coding.display ^short = "Glosa del Código Documento"
* identifier.type.coding.display ^definition = "Glosa del Código Documento"
* identifier.value ^short = "Número o valor de id"
* identifier.value ^definition = "Número o valor de identificación"

* birthDate 1..1
  * ^short = "La fecha de nacimiento del individuo. En el formato (YYYY-MM-AA)." 
  * ^definition = "Patient.birthDate: La fecha de nacimiento del individuo."

Instance: EjemploPaciente
InstanceOf: Paciente
Usage: #example
Title: "Ejemplo Paciente"
Description: "Aca esta el ejemplo del paciente"
* name.family = "Valentina Daniela"
* name.given = "Contreras"
* identifier.value = "20706399-1"
* birthDate = "2001-02-10"