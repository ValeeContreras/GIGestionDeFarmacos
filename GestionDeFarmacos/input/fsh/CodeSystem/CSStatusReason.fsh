CodeSystem: CSStatusReason
Id: CSStatusReason
Title: "Razón del cambio de estado (Prescripción)"
Description: "Códigos que indican la razón por la cual una Prescripción ha cambiado su estado"
* insert MetadataVSCS
* ^caseSensitive = true

* #altchoice    "Primero probar otro tratamiento" "Esta terapia se ha ordenado como respaldo a una terapia preferida. Esta orden será liberada cuando y si, la terapia preferida no tiene éxito"
* #clarif   "La prescripción requiere una aclaración" "Se requiere una aclaración antes de que la orden pueda ser realizada"
* #drughigh "Dosis del fármaco es muy alta" "Los niveles actuales del fármaco en el sistema del paciente son muy altos. El fármaco es suspendido para permitir que los niveles disminuyan hasta un nivel seguro"
* #hospadm  "Admisión a hospital" "El paciente ha sido ingresado a un centro asistencial y su medicación comunitaria será suspendida hasta el alta hospitalaria"
* #labint   "Interferencia con exámenes de laboratorio" "La terapia podría interferir con un exámen de laboratorio planificado, por lo que se suspende la terapia hasta que el exámen se realice"
* #non-avail    "Paciente no disponible" "Paciente no disponible por un período de tiempo debido a una terapia programada, permiso de ausencia u otra razón"
* #preg "Paciente embarazada/amamantando" "La paciente está embarazada o amamantando. La terapia se continuará cuando se complete el embarazo, y la paciente deje de amamantar."
* #salg "Alergia" "Se sospecha que el paciente es alérgico a una sustancia que forma parte de la terapia, por lo que ésta será temporalmente suspendida para confirmar"
* #sddi "Fármaco interactúa con otro fármaco" "El fármaco interactúa con un tratamiento a corto plazo que es requerido con mayor urgencia. Esta orden será retomada cuando el tratamiento a corto plazo se complete."
* #sdupther "Terapia duplicada" "El fármaco interactúa con un tratamiento a corto plazo que es requerido con mayor urgencia. Esta orden será retomada cuando el tratamiento a corto plazo se complete."
* #sintol   "Sospecha de intolerancia" "El fármaco interactúa con un tratamiento a corto plazo que es requerido con mayor urgencia. Esta orden será retomada cuando el tratamiento a corto plazo se complete."
* #surg "Paciente programado para cirugía" "El fármaco está contraindicado para pacientes que se someten a cirugía y para pacientes que estén programados para ser admitidos para cirugía en un futuro próximo. El tratamiento se reanudará cuando el paciente se haya recuperado suficientemente de la cirugía."
* #washout  "En espera de eliminación de fármaco previo" "El paciente estaba recibiendo un fármaco que está contraindicado con su medicación actual. La medicación actual se mantendrá en espera hasta que el fármaco anterior haya sido eliminado de su sistema"
* #otra "Otra" "Otra razón no considerada en el listado"