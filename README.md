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

## 🚀 ¿Cómo ejecutarlo?

1. Clona el repositorio:
   ```bash
   git clone https://github.com/Diegith/final_project_.git
   cd final_project_
2. Abre el proyecto con Visual Studio Code o Android Studio.

3. Asegúrate de tener permisos para acceder a sensores y ubicación.

4. Ejecuta en un dispositivo real (se requiere sensor físico):

```bash
flutter run
```
## 📍 Sobre la localización y alerta
El sistema obtiene la ubicación GPS automáticamente cuando detecta una caída.

Se envía una alerta a un cuidador con los datos del usuario y la ubicación geográfica.

Puedes extender la lógica para integrarlo con servicios como Firebase.

📄 Licencia
MIT License - libre para uso académico o personal. Consulta el archivo LICENSE para más información.
