#!/bin/bash

# Script para iniciar la plataforma de monitorización
# Prometheus + Grafana + Node Exporter

echo "🚀 Iniciando plataforma de monitorización..."

# Comprobar que Docker está instalado
if ! command -v docker &> /dev/null; then
  echo "❌ Docker no está instalado. Instálalo antes de continuar."
  exit 1
fi

# Comprobar que docker-compose está disponible
if ! command -v docker-compose &> /dev/null; then
  echo "❌ Docker Compose no está instalado."
  exit 1
fi

# Moverse al directorio docker
cd docker || {
  echo "❌ No se encuentra el directorio 'docker/'"
  exit 1
}

# Levantar los servicios
docker-compose up -d

# Comprobar estado
if [ $? -eq 0 ]; then
  echo "✅ Plataforma iniciada correctamente"
  echo "📊 Grafana:     http://localhost:3000"
  echo "📈 Prometheus: http://localhost:9090"
else
  echo "❌ Error al iniciar la plataforma"
fi
