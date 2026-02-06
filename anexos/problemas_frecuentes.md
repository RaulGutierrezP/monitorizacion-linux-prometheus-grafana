## Error de Permisos Docker (`permission denied`)

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