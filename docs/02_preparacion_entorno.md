# Fase 2 – Preparación del entorno

## 1. Introducción

En esta fase se prepara el entorno de trabajo necesario para el despliegue de la plataforma de monitorización.  
El sistema base utilizado es Ubuntu 24.04 ejecutándose sobre Windows Subsystem for Linux (WSL).

Se procede a la instalación y configuración de Docker y Docker Compose, herramientas fundamentales para el despliegue contenerizado de los servicios que compondrán la solución.

---

## 2. Actualización del sistema

Antes de instalar cualquier software, se actualizan los repositorios y paquetes del sistema operativo para garantizar estabilidad y seguridad.

```bash
sudo apt update && sudo apt upgrade -y
```

Este comando actualiza la lista de paquetes disponibles y aplica las últimas actualizaciones de seguridad.

---

## 3. Instalación de dependencias básicas

Se instalan paquetes necesarios para permitir el uso de repositorios HTTPS y herramientas comunes.

```bash
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

---

## 4. Instalación de Docker

### 4.1 Añadir la clave GPG oficial de Docker

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

---

### 4.2 Añadir el repositorio oficial de Docker

```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

---

### 4.3 Instalar Docker Engine

```bash
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
```

---

### 4.4 Verificar instalación de Docker

```bash
docker --version
```

Si la instalación es correcta, se mostrará la versión de Docker instalada.

---

## 5. Configuración de permisos de Docker

Para evitar el uso de sudo en cada comando Docker, se añade el usuario actual al grupo docker.

```bash
sudo usermod -aG docker $USER
```

⚠️ Es necesario cerrar y volver a abrir la terminal para que los cambios tengan efecto.

Verificación:

```bash
docker run hello-world
```

---

## 6. Instalación de Docker Compose

Docker Compose permite definir y ejecutar aplicaciones multicontenedor.

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

Asignar permisos de ejecución:

```bash
sudo chmod +x /usr/local/bin/docker-compose
```

Verificar instalación:

```bash
docker-compose --version
```

## 7. Verificación del entorno

Para comprobar que Docker funciona correctamente, se lanza un contenedor de prueba:

```bash
docker ps
```

Si no se producen errores, el entorno está preparado para el despliegue de la plataforma de monitorización.

---

## 8. Conclusión

Tras completar esta fase, el sistema cuenta con Docker y Docker Compose correctamente instalados y configurados.
El entorno queda listo para el despliegue de Prometheus, Grafana y Node Exporter en las siguientes fases del proyecto.

Teneis el script reutilizable en: **scripts/instalar_docker.sh**

No os olvideis de darle permisos de ejecución:

```bash
chmod +x scripts/instalar_docker.sh
```