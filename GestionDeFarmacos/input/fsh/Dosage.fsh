Profile: ClDosage
Parent: Dosage
Id: cl-dosage
Title: "CL Dosage"
Description: "Dosage medicamento"

* sequence 0..1 
  * ^short = "Secuencia de administracion del medicamento"
  * ^definition = "Indica el orden en el que se deben aplicar o interpretar las instrucciones de dosificación."

* text 0..1
  * ^short = "Instucciones en texto libre"

* patientInstruction 0..1
  * ^short = "Instrucciones adicionales orientadas al paciente"
  * ^definition = "Instrucciones adicionales orientadas al paciente"

* timing 0..1
  * ^short = "Administración del medicamento en temporalidad"
* timing.repeat.frequency 0..1
  * ^short = "Cantidad de repeticiones"
  * ^definition = "El número de veces que se debe repetir la acción dentro del periodo especificado. Si frequencyMax está presente, este elemento indica el límite inferior del rango permitido de la frecuencia."
* timing.repeat.period 0..1
  * ^short = "Período en el cual se realizan las repeticiones"
  * ^definition = "Período en el cual se realizan las repeticiones"
* timing.repeat.periodMax 0..1
  * ^short = "Periodo máximo en el cual se realizan las repeticiones"
  * ^definition = "Periodo máximo en el cual se realizan las repeticiones"
* timing.repeat.periodUnit 0..1
  * ^short = "s | min | h | d | wk | mo | a - unidad de tiempo (UCUM)"
  * ^definition = "Unidad de tiempo según Unidades de Tiempo definidias en UCUM"

* asNeeded[x] 0..1
  * ^short = "Se define para uso de fármaco sin receta o indicación en esta."
  * ^definition = "Para indicar si el fármaco se puede usar sin respetar diretamente lo presctito en el dosaje, como por ejemplo medicamentos que se pueden usar en caso de SOS"
* asNeeded[x] only boolean

* route 0..1
  * ^short = "Vía por la cual es administrado el medicamento"
  * ^definition = "Como se debe administrar el medicamento (Vía de administración o como debe el farmaco entrar al cuerpo)"
* route.coding.system 0..1
  * ^short = "Namespace de SNOMED-CT"
  * ^definition = "Namespace de SNOMED-CT"
* route.coding.code from  VSViasAdmin (extensible) 
  * ^short = "Código de la vía por medio de subset de SNOMED-CT"
  * ^definition = "Código de la vía por medio de subset de SNOMED-CT"
* route.coding.display 0..1
  * ^short = "Descripción del código"
  * ^definition = "Descripción del código"

* method 0..1
  * ^short = "Forma exacta en la que el fármaco ingresa al organismo"
  * ^definition = "Forma exacta en la que el fármaco ingresa al organismo. En este caso se define la ruta plausible para vías de administración"
* method.coding.system 0..1
  * ^short = "Namespace de los códigos desde VS local. Definir URl Local para validar"
  * ^definition = "Namespace de los códigos desde SNOMED-CT."
* method.coding.code from VSMetodos (extensible)
  * ^short = "Códigos del Set de Valores definidos desde SNOMED-CT"
  * ^definition = "Código en SNOMED-CT correspondiente al método"
* method.coding.display 0..1
  * ^short = "Descripción del código"
  * ^definition = "Descripción del código"

* doseAndRate 0..* 
  * ^short = "Definición de la cantidad de fármaco a consumir por uso indicado"
  * ^definition = "Cantidad de los medicamentos a administrar"
  * dose[x] only SimpleQuantity or Range
  * dose[x] MS
  * dose[x] ^type[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
  * dose[x] ^type[0].extension.valueBoolean = true


Instance: EjemploDosage
InstanceOf: ClDosage
Usage: #inline
Title: "Ejemplo Dosage"
Description: "Se describe el ejemplo del dosage"

* text = "Una o dos tabletas cada 4 a 6 horas según necesidad en base a la intensidad del dolor renal"
* patientInstruction = "Una o dos tabletas cada 4 a 6 horas según necesidad en base a la intensidad del dolor renal"
* sequence = 1
* timing.repeat.frequency = 1
* timing.repeat.frequencyMax = 2
* timing.repeat.period = 4
* timing.repeat.periodMax = 6
* timing.repeat.periodUnit = #h
* route.coding.code = #421521009
* route.coding.display = "Tragarlo, instrucciones de dosage imperativas (qualifier value)"
* doseAndRate.doseRange.low.value = 1
* doseAndRate.doseRange.low.unit = "Tableta"
* doseAndRate.doseRange.low.value = 2
* doseAndRate.doseRange.low.unit = "Tableta"
