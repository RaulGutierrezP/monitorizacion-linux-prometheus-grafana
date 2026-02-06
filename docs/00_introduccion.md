# 00. Introducción del Proyecto

## Presentación
Este proyecto consiste en el diseño e implementación de una infraestructura de monitorización avanzada para sistemas Linux, utilizando un enfoque basado en microservicios mediante **Docker**. 

En entornos IT actuales, la observabilidad no es solo una opción, sino una necesidad crítica para garantizar la alta disponibilidad y el rendimiento de los servicios. Este repositorio documenta el despliegue de un stack tecnológico líder en la industria: **Prometheus** y **Grafana**.

## Propósito del Proyecto
El objetivo principal es crear un entorno de monitorización autocontenido y portable que permita:
1. **Recolección de métricas**: Obtener datos de rendimiento del sistema operativo (CPU, RAM, Disco, Red) de forma continua.
2. **Visualización**: Transformar datos brutos en información útil mediante paneles visuales intuitivos.
3. **Gestión de Alertas**: Establecer un sistema proactivo que notifique incidencias antes de que afecten al usuario final.

## Justificación Técnica
Se ha optado por las siguientes herramientas debido a su estandarización en el mercado:
* **Prometheus**: Como base de datos de series temporales, ideal para el manejo de métricas escalables.
* **Grafana**: Como motor de visualización por su flexibilidad y capacidad de integración.
* **Node Exporter**: Para la extracción de métricas de hardware a nivel de kernel de Linux.
* **Docker**: Para asegurar que el despliegue sea idéntico en cualquier entorno (WSL, servidores locales o nube).

## Alcance
Este documento técnico cubre desde la planificación inicial y la configuración del entorno en **Ubuntu 24.04 (WSL)**, hasta la validación de alertas y la creación de dashboards profesionales.