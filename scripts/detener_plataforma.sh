#!/bin/bash

# Script para detener la plataforma de monitorización
# Prometheus + Grafana + Node Exporter

echo "🛑 Deteniendo plataforma de monitorización..."

# Moverse al directorio docker
cd docker || {
  echo "❌ No se encuentra el directorio 'docker/'"
  exit 1
}

# Detener servicios
docker-compose down

# Comprobación
if [ $? -eq 0 ]; then
  echo "✅ Plataforma detenida correctamente"
else
  echo "❌ Error al detener la plataforma"
fi
