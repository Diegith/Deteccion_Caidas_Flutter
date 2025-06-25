# 📱 Sistema de Detección de Caídas con Alertas y Geolocalización

Este proyecto en Flutter integra sensores del teléfono móvil para detectar posibles caídas, obtener la ubicación del usuario y notificar automáticamente a un tercero mediante un mensaje. Diseñado para aplicaciones en salud y asistencia a personas mayores, el sistema combina hardware móvil, sensores y conectividad.

## 🧠 Funcionalidades principales

- **Detección de caídas** con acelerómetro (`sensors_plus`)
- **Evaluación de riesgo** en tiempo real según la aceleración del dispositivo
- **Geolocalización del usuario** usando `geolocator`
- **Notificación por mensaje** automático a un cuidador con el estado de la persona y su ubicación

## 🧩 Estructura del proyecto

- `aceleration.dart`: Detección de aceleración y cálculo de umbral
- `location.dart`: Obtención de latitud y longitud con permisos dinámicos
- `main.dart`: Inicialización de widgets y lógica de navegación
- `userList.dart`: Gestión de cuidadores u otros contactos autorizados para notificación

## 🛠️ Tecnologías utilizadas

- Flutter
- Dart
- [`sensors_plus`](https://pub.dev/packages/sensors_plus)
- [`geolocator`](https://pub.dev/packages/geolocator)
- Mensajería por HTTP/API o integración nativa (ej. SMS/local push)

1. Clona el repositorio:
   ```bash
   git clone https://github.com/Diegith/final_project_.git
   cd final_project_
