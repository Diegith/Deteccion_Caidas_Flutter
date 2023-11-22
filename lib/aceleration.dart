import 'package:flutter/material.dart';
import 'dart:math';
import 'package:sensors_plus/sensors_plus.dart';
//import 'location.dart';

class Aceleration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AcelerationScreen(),
    );
  }
}

class AcelerationScreen extends StatefulWidget {
  @override
  _AcelerationScreenState createState() => _AcelerationScreenState();
}

class _AcelerationScreenState extends State<AcelerationScreen> {
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double aceleraciontotal = 0.0;
  Color boxColor = Colors.red;
  @override
  void initState() {
    super.initState();
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.y;
        aceleraciontotal = sqrt(x * x + y * y + z * z);
      });
    });
  }

  String umbralEstado(double ace) {
    String rEstado = "";
    if (ace > 13) {
      rEstado = "RIESGO DE CAIDA";
    } else {
      rEstado = "ESTADO NORMAL";
    }
    return rEstado;
  }

  void changeColor(double ace) {
    setState(() {
      if (ace > 13) {
        boxColor = Colors.red;
      } else {
        boxColor = Colors.green;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Location',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: DecoratedBox(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 24, 87, 142)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: boxColor,
                ),
                child: Text(
                  umbralEstado(aceleraciontotal),
                  style: const TextStyle(
                    fontSize: 34,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 2, 25, 44),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 60,
                    child: Text(
                      '$aceleraciontotal',
                      style: const TextStyle(
                        fontSize: 90,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 50,
                    top: 180,
                    child: Text(
                      'ACELERATION',
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
