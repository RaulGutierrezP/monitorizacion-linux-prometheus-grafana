# Fase 1 – Análisis y planificación

## 1. Introducción

En esta fase inicial se realiza el análisis del proyecto y la planificación de su desarrollo.  
El objetivo es definir claramente las herramientas a utilizar, los requisitos del sistema y la arquitectura de la solución de monitorización antes de proceder a su implementación.

Una correcta planificación permite garantizar que el sistema sea escalable, reproducible y fácil de mantener, además de facilitar la documentación y validación del proyecto.

---

## 2. Estudio de las herramientas

### 2.1 Docker y Docker Compose

Docker es una plataforma de contenedores que permite empaquetar aplicaciones y sus dependencias de forma aislada, garantizando su portabilidad entre distintos entornos.

Docker Compose permite definir y gestionar aplicaciones multicontenedor mediante archivos YAML, facilitando el despliegue conjunto de servicios relacionados.

Se ha elegido Docker por:
- Portabilidad del sistema
- Facilidad de despliegue
- Aislamiento de servicios
- Uso extendido en entornos profesionales

---

### 2.2 Prometheus

Prometheus es un sistema de monitorización y alerta de código abierto diseñado para recopilar métricas en tiempo real mediante un modelo de datos basado en series temporales.

Características principales:
- Recolección de métricas mediante scraping HTTP
- Lenguaje de consulta propio (PromQL)
- Sistema de alertas integrado
- Amplio soporte en entornos Linux y contenerizados

Prometheus será el encargado de recopilar y almacenar las métricas del sistema.

---

### 2.3 Grafana

Grafana es una plataforma de visualización de datos que permite crear dashboards interactivos a partir de distintas fuentes de datos, entre ellas Prometheus.

Se utilizará Grafana para:
- Visualizar métricas del sistema
- Crear paneles personalizados
- Gestionar alertas
- Facilitar la interpretación del estado del sistema

---

### 2.4 Node Exporter

Node Exporter es un exportador de métricas diseñado para sistemas Linux.  
Permite recopilar información sobre:
- Uso de CPU
- Memoria
- Espacio en disco
- Carga del sistema
- Red

Estas métricas serán recogidas por Prometheus para su posterior análisis.

---

## 3. Requisitos del sistema

### 3.1 Requisitos hardware

- Ordenador personal
- Mínimo 4 GB de memoria RAM
- Espacio en disco suficiente para contenedores y métricas

### 3.2 Requisitos software

- Sistema operativo Linux (Ubuntu 24.04 sobre WSL)
- Docker
- Docker Compose
- Navegador web moderno
- Acceso a internet

---

## 4. Arquitectura del sistema

La arquitectura propuesta se basa en una solución contenerizada compuesta por los siguientes servicios:

- **Node Exporter**: expone métricas del sistema Linux
- **Prometheus**: recoge y almacena las métricas
- **Grafana**: visualiza los datos y gestiona alertas

Todos los servicios se despliegan mediante Docker Compose, comunicándose entre sí a través de una red interna de Docker.

El diseño modular permite:
- Fácil mantenimiento
- Escalabilidad futura
- Reproducción del entorno en otros sistemas

---

## 5. Alcance del proyecto

El proyecto incluye:
- Monitorización de un sistema Linux local
- Visualización de métricas básicas del sistema
- Configuración de alertas por correo electrónico
- Documentación completa del proceso

Posibles mejoras futuras:
- Monitorización de múltiples nodos
- Integración con sistemas de orquestación como Kubernetes
- Monitorización de aplicaciones específicas

---

## 6. Planificación del desarrollo

El proyecto se desarrollará siguiendo una metodología secuencial dividida en fases:

1. Análisis y planificación
2. Preparación del entorno
3. Despliegue de servicios
4. Configuración de la monitorización
5. Visualización y alertas
6. Validación y documentación final

Cada fase será documentada y versionada en este repositorio GitHub.

---
