## ❗ Error de Permisos Docker (`permission denied`)

**Problema:** Docker requiere privilegios de root por defecto. Si al ejecutar comandos como `docker ps` recibes un error de "permission denied", es porque tu usuario no tiene acceso al socket de Docker.

**Solución:** Añadir tu usuario al grupo de Docker para ejecutar comandos sin `sudo`.

### Pasos para solucionarlo:

1. **Crear el grupo docker** (en caso de que no exista):

```bash
sudo groupadd docker
``` 

2. **Añadir tu usuario actual al grupo:**

```bash
sudo usermod -aG docker $USER
```

3. **Aplicar los cambios del grupo inmediatamente**

```bash
newgrp docker
```

---

## ❗ Error al descargar imágenes Docker (TLS handshake timeout)

**Problema:** Docker ejecutado de forma nativa en WSL2 suele presentar errores de red al intentar descargar imágenes de Docker Hub (como Grafana o Prometheus), resultando en un fallo de net/http: TLS handshake timeout.

**Solución:** Migrar a Docker Desktop con integración WSL2, que es el método oficial y más estable para gestionar la red entre Windows y Linux.

### Pasos para solucionarlo:

1. **Instalar Docker Desktop en la maquina local** 

Descárgalo e instálalo en Windows asegurándote de marcar la opción "Use WSL 2 instead of Hyper-V".

2. **Habilitar integración en la distribución**

Abre Docker Desktop y ve a Settings > Resources > WSL Integration.

Activa el interruptor para tu distribución (ej. Ubuntu).

Eliminar la instalación previa de Docker en WSL: Para evitar conflictos entre el motor de Docker Desktop y el instalado manualmente, ejecuta:

```bash
sudo apt remove docker docker-engine docker.io docker-compose -y
sudo apt autoremove -y
```

3. **Reiniciar y levantar el proyecto**

Cierra tu terminal, ábrela de nuevo y ejecuta el comando en la carpeta de tu proyecto:

```bash
docker-compose up -d
```
---

## ❗ Error de conexión entre Grafana y Prometheus (connection refused)

**Problema:**  

Al acceder a los dashboards de Grafana o ejecutar consultas sobre las métricas, se muestra el siguiente error:

Post "http://localhost:9090/api/v1/query_range": dial tcp [::1]:9090: connect: connection refused

Este error impide que Grafana muestre datos provenientes de Prometheus.

**Causa:**  
En entornos contenerizados con Docker, el uso de `localhost` dentro de un contenedor hace referencia al propio contenedor y no al sistema anfitrión ni a otros servicios.  
Por este motivo, Grafana no puede conectarse a Prometheus utilizando `http://localhost:9090`.

**Solución:**  
Configurar Grafana para que se conecte a Prometheus utilizando el nombre del servicio definido en el archivo `docker-compose.yml`, aprovechando la red interna de Docker.

### Pasos para solucionarlo:

1. **Verificar el nombre del servicio Prometheus**

Comprobar en el archivo `docker-compose.yml` que el servicio de Prometheus está definido con el siguiente nombre:

```yaml
services
  prometheus
```

2. **Configurar correctamente el datasource en Grafana**

Acceder a la interfaz web de Grafana y seguir los pasos:

    → Ir a Configuration → Data sources

    → Seleccionar el datasource de Prometheus

    → Modificar el campo URL con el valor: http://prometheus:9090

Guardar los cambios pulsando Save & Test

3. **Verificar la conexión**

Si la configuración es correcta, Grafana mostrará el mensaje: **Data source is working**

A partir de este momento, los dashboards comenzarán a mostrar métricas correctamente.