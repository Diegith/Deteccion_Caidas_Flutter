import 'package:flutter/material.dart';
import 'location.dart';
import 'aceleration.dart';
import 'userList.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _paginaActual = 1;
  final List<Widget> _paginas = [
    Location(),
    Aceleration(),
    const UserList(),    
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FALL DETECTION APP',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('FALL DETECTION APP'),
          ),
          body: _paginas[_paginaActual],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  _paginaActual = index;
                });
              },
              currentIndex: _paginaActual,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.location_on), label: "My Location"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.supervised_user_circle),
                    label: "User Location"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list_alt_outlined), label: "User List"),
              ])),
    );
  }
}
