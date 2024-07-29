### Contexto
Esta guía de implementación está diseñada para el uso de datos enfocados en la Atención Primaria de Salud (APS) para la Gestión de Fármacos.
<br>

### Introducción

En las APS tener un registro de los medicamentos es bastaste ineficiente, por lo que con esta guía de implementación esta diseñada para un sistema digital que permita gestionar los fármacos de manera eficiente. Este sistema abarcará la creación de la receta, actualización del estado como tambien la actualización por modificación de la prescripcion y consulta de las recetas.

### Contenido de la Guía
Esta guía de implementación se estructura en base al menú de la parte superior de la siguiente manera:
<br>

* [Home](index.html): Página de Bienvenida a la Guía.
* [Objetivos](Objetivos.html): Información General sobre los objetivos de esta Guía.
* [Casos de Uso](CasosDeUsos.html): Información detallada de los casos de uso, sus actores, y la secuencia de transacciones.
* [Seguridad](Seguridad.html): Infromación sobre la seguridad.
* [Resumen de Artefactos](artifacts.html): Describe todos los artefactos que son parte de esta GI, separados en Estructura de Perfiles, Extensiones, Value Sets y Ejemplos.
<br>
Esta estructura está diseñada para facilitar la navegación y comprensión de los diversos componentes y procesos involucrados en la gestión de fármacos en la Atención Primaria de Salud.


<p>El codigo fuente de esta Guía de implementación se puede encontrar en <a href="https://github.com/openhie/Training-Solution-1">OpenHIE GitHub</a>.</p>

  <h3>Análisis de las versiones cruzadas</h3> <a name="cross-version-analysis"></a>
  <div>
    {% include cross-version-analysis.xhtml %}
  </div>

  <h3>Dependency Table</h3> <a name="dependency-table"></a>
  <div>
    {% include dependency-table.xhtml %}
  </div>

  <h3>Globals Table</h3> <a name="globals-table"></a>
  <div>
    {% include globals-table.xhtml %}
  </div>

  <h3>IP Statements</h3> <a name="ip-statements"></a>
  <div>
   {% include ip-statements.xhtml %}
  </div>

  <h3>Intellectual Property Considerations</h3>  <a name="ip"> </a>
  <p>
    Si bien esta guía de implementación y el FHIR subyacente tienen licencia de dominio público, esta guía puede incluir ejemplos que utilicen terminologías como 
    como LOINC, SNOMED CT y otros que tienen requisitos de licencia más restrictivos. Los implementadores deben familiarizarse con las licencias y 
    cualquier otra limitación de terminología, cuestionarios y otros componentes utilizados como parte de su proceso de implementación. En algunos casos, 
    Los requisitos de licencia pueden limitar los sistemas con los que se pueden compartir los datos capturados mediante ciertos cuestionarios.
  </p>

  <h3>Responsabilidad</h3>  <a name="responsabilidad"> </a>
  <p>
    Esta especificación se proporciona sin garantía de integridad o coherencia, y la publicación oficial reemplaza este borrador.
    No se puede inferir ninguna responsabilidad por el uso o mal uso de esta especificación, o sus consecuencias.
  </p>
  
</div>

**Esta Guía de Implementación ha sido posible gracias a las atentas contribuciones de las siguientes personas:**
<br>
* Valentina Contreras, Tesista
* Cesar Galindo, Profesor Guia
* John Diaz, Co-Guia