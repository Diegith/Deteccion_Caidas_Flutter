import 'package:flutter/material.dart'; // Importa el paquete 'material' de Flutter.
import 'package:geolocator/geolocator.dart'; // Importa la librería 'geolocator' para trabajar con la ubicación.
import 'package:permission_handler/permission_handler.dart'; // Importa la librería 'permission_handler' para gestionar permisos.
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Para utilizar Google Maps
import 'package:firebase_database/firebase_database.dart';
export 'location.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationScreen(),
    );
  }
}

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late double _latitude = 0.0; // Variable que almacena la latitud actual.
  late double _longitude = 0.0; // Variable que almacena la longitud actual.
  LatLng _center = new LatLng(0.0, 0.0);
  String acel = "";
  DatabaseReference? dbRef;
  @override
  void initState() {
    super.initState();
    _checkLocationPermission(); // Comprueba y solicita permisos de ubicación al iniciar la pantalla.
  }

  Future<void> _checkLocationPermission() async {
    final status = await Permission.location
        .status; // Verifica el estado de los permisos de ubicación//permission_handler.dart.
    if (status.isGranted) {
      _startLocationUpdates(); // Si los permisos están concedidos, inicia la actualización de la ubicación.
    } else {
      await Permission.location
          .request(); // Si no se concedieron permisos, solicita permisos de ubicación//permission_handler.dart.
      _startLocationUpdates(); // Luego inicia la actualización de la ubicación.
    }
  }

  final databaseReference = FirebaseDatabase.instance.ref();

  Future<void> sendDataToFirebase() async {
    try {
      await databaseReference.child('UserUbications').push().set({
        'latitude': _latitude,
        'longitude': _longitude,
      });
    } catch (e) {
      print(e);
    }
  }

  void _startLocationUpdates() {
    Geolocator.getPositionStream().listen((Position position) {
      setState(() {
        _latitude =
            position.latitude; // Actualiza la latitud con la ubicación actual.
        _longitude = position
            .longitude; // Actualiza la longitud con la ubicación actual.

        _center = LatLng(_latitude, _longitude);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String f_latitude = _latitude.toStringAsFixed(6);
    String f_longitude = _longitude.toStringAsFixed(6);
    return MaterialApp(
      // Contenido principal de la aplicación
      home: Scaffold(
        // Barra de la aplicación
        appBar: AppBar(
          title: Text('Ubicación en el Mapa'), // Título de la barra
        ),
        // Cuerpo de la aplicación
        body: Center(
          // Widget de GoogleMap, muestra un mapa de Google
          child: GoogleMap(
            // Función que se llama cuando se crea el mapa
            onMapCreated: (controller) {},
            // Posición inicial de la cámara del mapa (coordenadas de Bucaramanga)
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15.0, // Nivel de zoom inicial
            ),
            // Conjunto de marcadores en el mapa
            markers: {
              Marker(
                // Identificador único del marcador
                markerId: MarkerId("myLocation"),
                // Posición del marcador (coordenadas de la UNAB en Bucaramanga)
                position: _center,
                // Información que se muestra al hacer clic en el marcador
                infoWindow: InfoWindow(
                  title: "Mi ubicación actual",
                  snippet: "Latitud: $f_latitude, Longitud: $f_longitude",
                ),
              ),
            },
          ),
        ),
      ),
    );
  }
}
