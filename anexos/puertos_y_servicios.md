# Puertos y servicios

Este anexo recoge los principales servicios desplegados en la plataforma de monitorización, junto con los puertos utilizados para su acceso y comunicación.

---

## Servicios desplegados

### Prometheus

- **Función:** Recogida y almacenamiento de métricas
- **Puerto:** 9090
- **Acceso web:** http://localhost:9090
- **Protocolo:** HTTP

Prometheus consulta periódicamente a Node Exporter para recopilar métricas del sistema.

---

### Grafana

- **Función:** Visualización de métricas y gestión de alertas
- **Puerto:** 3000
- **Acceso web:** http://localhost:3000
- **Protocolo:** HTTP

Grafana se conecta a Prometheus como fuente de datos y permite la creación de dashboards y alertas.

---

### Node Exporter

- **Función:** Exportación de métricas del sistema Linux
- **Puerto:** 9100
- **Acceso:** Interno (Docker)
- **Protocolo:** HTTP

Node Exporter expone métricas del sistema que son consultadas por Prometheus.

---

## Comunicación entre servicios

La comunicación entre los distintos componentes se realiza a través de la red interna de Docker, utilizando los nombres de servicio definidos en el archivo `docker-compose.yml`.

Este enfoque evita dependencias con direcciones IP y facilita la portabilidad del sistema.

---

## Resumen de puertos

| Servicio        | Puerto | Acceso              |
|-----------------|--------|---------------------|
| Grafana         | 3000   | Usuario / Navegador |
| Prometheus      | 9090   | Usuario / Navegador |
| Node Exporter   | 9100   | Interno Docker      |
