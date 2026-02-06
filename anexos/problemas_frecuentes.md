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