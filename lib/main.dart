import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belleza Inspiradora',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: BellezaPage(),
    );
  }
}

class BellezaPage extends StatelessWidget {
  final List<String> mensajes = [
    "La belleza no está en la cara; la belleza es una luz en el corazón.",
    "La verdadera belleza es ser fiel a ti misma.",
    "La confianza es la mejor prenda que puedes llevar.",
    "Sé tú misma, porque tú eres hermosa tal como eres."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mensajes de Belleza'),
      ),
      body: ListView.builder(
        itemCount: mensajes.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                mensajes[index],
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
            ),
          );
        },
      ),
    );
  }
}
