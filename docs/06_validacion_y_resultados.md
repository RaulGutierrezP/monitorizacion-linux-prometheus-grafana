# Fase 6 – Validación y resultados

## 1. Introducción

En esta fase se realiza la validación final de la plataforma de monitorización implementada, comprobando el correcto funcionamiento de todos los componentes desplegados.

Se verifica la recogida de métricas, su visualización en Grafana y la correcta activación de alertas ante situaciones críticas, garantizando que el sistema cumple los objetivos definidos al inicio del proyecto.

---

## 2. Verificación del despliegue de servicios

Se comprueba que todos los servicios se encuentran correctamente desplegados y en ejecución mediante Docker Compose:

- Prometheus
- Grafana
- Node Exporter

Los contenedores se encuentran activos y comunicándose correctamente dentro de la red Docker, permitiendo la recogida y visualización de métricas sin errores.

---

## 3. Validación de la monitorización

### 3.1 Prometheus

Desde la interfaz web de Prometheus se verifica:

- Acceso correcto al servicio en el puerto 9090
- Estado *UP* del target correspondiente a Node Exporter
- Correcta ejecución de consultas PromQL sobre métricas de CPU, memoria, disco y red

Esto confirma que Prometheus está recopilando métricas del sistema Linux de forma adecuada.

---

### 3.2 Grafana

En Grafana se valida:

- Conexión correcta con Prometheus como datasource
- Carga correcta de métricas en los dashboards
- Actualización en tiempo real de los paneles

El dashboard personalizado permite una visualización clara del estado del sistema, facilitando la detección de posibles problemas de rendimiento.

---

## 4. Validación de dashboards personalizados

El dashboard desarrollado muestra de forma gráfica los principales recursos del sistema:

- Uso de CPU
- Consumo de memoria
- Uso de disco
- Tráfico de red

La información se presenta de manera clara e intuitiva, permitiendo una rápida interpretación del estado del sistema y facilitando la toma de decisiones.

---

## 5. Validación del sistema de alertas

Se valida el correcto funcionamiento del sistema de alertas configurado en Grafana.

### 5.1 Prueba de alerta por CPU alta

Para comprobar la alerta configurada:

- Se genera una carga elevada de CPU en el sistema
- Se supera el umbral definido del 80 % durante más de 2 minutos
- La alerta cambia su estado a *Firing*
- Se envía correctamente una notificación por correo electrónico

La recepción del correo confirma que el sistema de alertas y el servicio SMTP funcionan correctamente.

---

## 6. Problemas encontrados y resolución

Durante la validación se detectaron algunos problemas, entre ellos:

- Error de conexión entre Grafana y Prometheus por uso incorrecto de `localhost`
- Fallos en el envío de correos debido a credenciales SMTP no válidas

Estos problemas fueron analizados y resueltos correctamente, documentándose sus soluciones en el apartado de problemas frecuentes del proyecto.

---

## 7. Resultados obtenidos

Tras completar el proceso de validación, se puede concluir que:

- La plataforma de monitorización funciona correctamente
- Las métricas del sistema se recogen y visualizan en tiempo real
- El dashboard personalizado cumple los objetivos definidos
- El sistema de alertas detecta situaciones críticas y notifica por correo electrónico

---

## 8. Conclusión

La solución desarrollada cumple con los objetivos planteados al inicio del proyecto, proporcionando una plataforma de monitorización contenerizada, funcional y fácilmente reproducible.

La validación final confirma que el sistema está preparado para su uso en entornos de prueba y aprendizaje, así como para servir como base para futuras ampliaciones.
