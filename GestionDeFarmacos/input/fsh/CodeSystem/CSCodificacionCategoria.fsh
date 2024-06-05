CodeSystem: CSCodificacionCategoria
Id: CSCodificacionCategoria
Description: "Estado de una prescripción"
Title: "Codificación del estado de una prescripción"
* insert MetadataVSCS
* ^caseSensitive = true

* #inpatient    "Hospitalizado" "Incluye solicitudes de medicamentos para ser administrados o consumidos en contexto de hospitalización o cuidados primarios"
* #outpatient   "Ambulatorio" "Incluye solicitudes de medicamentos para ser administrados o consumidos en el contexto ambulatorio (por ejemplo, departamento de urgencia, clínica ambulatoria, cirugía ambulatoria, oficina del doctor)"
* #community    "community" "Incluye solicitudes de medicamentos para ser administrados o consumidos por el paciente en su hogar (esto incluiría cuidados a largo plazo u hogares de ancianos, asilos, etc.)"
* #discharge    "Alta" "Incluye solicitudes de medicamentos creadas cuando el paciente es dado de alta de un centro"