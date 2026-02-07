# Fase 4 – Configuración de monitorización

## 1. Introducción

En esta fase se configura Prometheus para la recolección de métricas del sistema Linux a través de Node Exporter.  
También se prepara Prometheus para futuras alertas y dashboards en Grafana.

---

## 2. Configuración de Prometheus

El archivo principal de configuración se encuentra en `docker/prometheus/prometheus.yml`.

### 2.1 Estructura mínima

```yaml
global:
  scrape_interval: 15s  # Cada cuánto Prometheus recoge métricas
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'node-exporter'
    static_configs:
      - targets: ['node-exporter:9100']
```

Explicación:

   -- **scrape_interval:** frecuencia de recolección

   -- **job_name:** nombre del trabajo

   -- **targets:** direcciones de los servicios que Prometheus va a monitorear

---

## 3. Añadir reglas de alertas 

En docker/prometheus/rules/alertas.yml se pueden definir reglas como:

```yaml
groups:
  - name: node_alerts
    rules:
      - alert: HighCPU
        expr: node_cpu_seconds_total{mode="idle"} < 20
        for: 2m
        labels:
          severity: warning
        annotations:
          summary: "Uso de CPU alto"
```

Estas reglas se activarán cuando la CPU esté muy ocupada (>80%) durante 2 minutos.

Luego se incluyen en prometheus.yml:

```yaml
rule_files:
  - "/etc/prometheus/rules/alertas.yml"
```

---

## 4. Verificación de Prometheus

### 4.1 Accede a Prometheus: 

👉 http://localhost:9090

### 4.2 Comprobar targets:

Menú Status → Targets → debería aparecer node-exporter:9100 con estado UP.

---

## 5. Comprobación de métricas en Prometheus

En la interfaz web de Prometheus:

    1. Ve a Graph

    2. Escribe node_memory_MemAvailable_bytes o node_cpu_seconds_total

    3. Pulsa Execute

    4. Deberías ver una gráfica de tu sistema en tiempo real.

---

## 6. Conclusión

Tras completar esta fase:

    → Prometheus recoge métricas del sistema

    → Node Exporter está integrado

    → Preparado para dashboards en Grafana y alertas automáticas

📌 En la siguiente fase se configurarán dashboards personalizados y alertas por correo.