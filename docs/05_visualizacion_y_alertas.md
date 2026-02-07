# Fase 5 – Visualización y alertas

## 1. Introducción

En esta fase se configura Grafana como herramienta de visualización de métricas del sistema y generación de alertas.
Grafana se conecta a Prometheus como fuente de datos y permite representar gráficamente el estado del sistema Linux monitorizado mediante dashboards personalizados.

Además, se implementa un sistema de alertas automáticas por correo electrónico ante situaciones críticas, centrándose en el uso elevado de CPU.

---

## 2. Configuración de Prometheus como datasource

Grafana se conecta a Prometheus utilizando una fuente de datos configurada automáticamente mediante el sistema de *provisioning*.

El archivo de configuración del datasource se encuentra en: **docker/grafana/provisioning/datasources/datasource.yml**

En entornos Docker, la conexión entre servicios se realiza utilizando el nombre del servicio definido en `docker-compose.yml`.  
Por este motivo, Grafana se conecta a Prometheus mediante la URL: **http://prometheus:9090** en vez de **http://localhost:9090**

Este enfoque garantiza la correcta comunicación entre contenedores dentro de la red Docker.

---

## 3. Métricas monitorizadas

A través de Node Exporter y Prometheus, el sistema permite monitorizar los principales recursos del sistema Linux:

- **CPU**: porcentaje de uso del procesador
- **Memoria**: memoria utilizada y disponible
- **Disco**: uso del espacio en disco
- **Red**: tráfico de red entrante y saliente

Estas métricas son recogidas por Prometheus y visualizadas en Grafana mediante paneles personalizados.

---

## 4. Dashboards personalizados

Se ha creado un dashboard personalizado en Grafana que muestra de forma clara y visual el estado del sistema.

El dashboard incluye:
- Uso de CPU en tiempo real
- Consumo de memoria
- Uso de disco
- Tráfico de red

El dashboard se guarda en formato JSON para facilitar su reutilización y despliegue automático.

Ubicación del dashboard: **docker/grafana/dashboards/linux-node-exporter.json**

---

## 5. Alertas configuradas

Se ha configurado una alerta crítica basada en el uso elevado de CPU.

### Alerta de CPU alta

- **Métrica**: uso de CPU
- **Umbral**: superior al 80 %
- **Duración**: más de 2 minutos
- **Acción**: envío de correo electrónico

Esta alerta permite detectar situaciones de sobrecarga del sistema y actuar de forma preventiva antes de que afecten a la estabilidad del servicio.

---

## 6. Pruebas de funcionamiento

Para validar el correcto funcionamiento de la visualización y las alertas, se han realizado las siguientes pruebas:

- Verificación de la correcta carga de métricas en Grafana
- Comprobación de la conexión entre Grafana y Prometheus
- Simulación de carga elevada de CPU
- Confirmación de la activación de la alerta configurada

---

## 7. Conclusión

Tras completar esta fase, la plataforma de monitorización dispone de:

- Visualización gráfica del estado del sistema Linux
- Dashboards personalizados en Grafana
- Alertas automáticas por uso elevado de CPU

El sistema queda preparado para su validación final y análisis de resultados.





