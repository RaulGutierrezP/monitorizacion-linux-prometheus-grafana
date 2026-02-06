# Fase 3 – Despliegue de servicios

## 1. Introducción

En esta fase se realiza el despliegue de los servicios que conforman la plataforma de monitorización mediante Docker Compose.

Se desplegarán los siguientes contenedores:
- Prometheus
- Grafana
- Node Exporter

El objetivo es verificar que los servicios se inician correctamente y que sus interfaces web son accesibles.

---

## 2. Estructura de despliegue

El despliegue se realiza desde el directorio `docker/`, donde se centraliza la configuración de los servicios contenerizados.

```bash
cd docker
```

---

## 3. Archivo docker-compose.yml

Docker Compose permite definir y ejecutar aplicaciones multicontenedor de forma sencilla mediante un único archivo YAML.
En este archivo se definen los servicios, puertos, volúmenes y redes necesarias para la plataforma.

Lo podeis encontrar en: **monitorizacion-linux-prometheus-grafana\docker\docker-compose.yml**

---

## 4. Despliegue de los servicios

Una vez definido el archivo docker-compose.yml, se procede a levantar los contenedores:

```bash
docker-compose up -d
```

El parámetro -d permite ejecutar los contenedores en segundo plano.

---

## 5. Verificación del despliegue

Se comprueba que los contenedores están en ejecución:

```bash
docker ps
```

---

## 6. Acceso a las interfaces web

Si el despliegue es correcto, los servicios estarán accesibles desde el navegador:

👉 http://localhost:3000

Usuario: admin
Password: admin (te pedirá cambiarla)

👉 http://localhost:9090

Debe cargar la interfaz de Prometheus

👉 http://localhost:9100/metrics

Verás texto con métricas

---

## 7. Conclusión

Tras completar esta fase, los servicios principales de la plataforma de monitorización se encuentran desplegados y operativos.
En la siguiente fase se procederá a la configuración de Prometheus para la recogida de métricas del sistema.