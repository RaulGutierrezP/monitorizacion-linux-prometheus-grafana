# Fase 7 – Conclusiones y trabajo futuro

## 1. Conclusiones

El desarrollo de este proyecto ha permitido diseñar e implementar una plataforma completa de monitorización para sistemas Linux, utilizando herramientas ampliamente empleadas en entornos profesionales como Docker, Prometheus y Grafana.

A lo largo del proyecto se ha conseguido desplegar una arquitectura contenerizada funcional, capaz de recopilar métricas del sistema en tiempo real, visualizarlas de forma gráfica y generar alertas automáticas ante situaciones críticas.

La solución desarrollada cumple con los objetivos planteados inicialmente, destacando los siguientes aspectos:

- Despliegue sencillo y reproducible mediante Docker Compose
- Monitorización en tiempo real de recursos clave del sistema (CPU, memoria, disco y red)
- Visualización clara e intuitiva mediante dashboards personalizados en Grafana
- Implementación de alertas automáticas por correo electrónico
- Documentación detallada que facilita la comprensión y reutilización del proyecto

Además, el proyecto ha permitido afianzar conocimientos prácticos en administración de sistemas Linux, monitorización y trabajo con entornos contenerizados, enfrentándose a problemas reales y resolviéndolos de forma efectiva.

---

## 2. Competencias adquiridas

Durante la realización del proyecto se han adquirido y reforzado las siguientes competencias técnicas:

- Administración básica de sistemas Linux
- Uso de Docker y Docker Compose para el despliegue de servicios
- Configuración y uso de Prometheus como sistema de monitorización
- Creación de dashboards personalizados en Grafana
- Implementación y gestión de alertas
- Resolución de problemas en entornos contenerizados
- Documentación técnica orientada a proyectos profesionales

Estas competencias son directamente aplicables a entornos laborales relacionados con sistemas, DevOps y administración de infraestructuras.

---

## 3. Limitaciones del proyecto

Aunque la plataforma desarrollada cumple con los objetivos establecidos, existen algunas limitaciones:

- El sistema de alertas se centra únicamente en el uso elevado de CPU
- La solución se ha desplegado en un entorno de pruebas (WSL), no en producción
- No se ha implementado autenticación avanzada ni control de accesos en Grafana
- No se ha incluido alta disponibilidad ni escalabilidad automática

Estas limitaciones no afectan al correcto funcionamiento del proyecto, pero abren la puerta a posibles mejoras futuras.

---

## 4. Trabajo futuro

Como posibles líneas de mejora y ampliación del proyecto, se proponen las siguientes:

- Implementar alertas adicionales para memoria, disco y red
- Integrar Alertmanager para una gestión más avanzada de notificaciones
- Añadir autenticación y roles de usuario en Grafana
- Desplegar la solución en un servidor Linux real o en la nube
- Incorporar monitorización de contenedores Docker
- Automatizar el despliegue mediante herramientas de CI/CD
- Ampliar la documentación con casos de uso reales

Estas mejoras permitirían evolucionar la plataforma hacia una solución de monitorización más completa y cercana a entornos productivos.

---

## 5. Valoración final

Este proyecto representa una experiencia práctica completa en el ámbito de la monitorización de sistemas y la administración de infraestructuras contenerizadas.

La solución desarrollada no solo cumple una finalidad académica, sino que también constituye un proyecto personal demostrable, reutilizable y fácilmente ampliable.
