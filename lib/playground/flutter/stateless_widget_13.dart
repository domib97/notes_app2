import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'MediaQuery-Demo';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: const MyMediaQueryWidget(),
      ),
    );
  }
}

class MyMediaQueryWidget extends StatelessWidget {
  const MyMediaQueryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    if (screenSize.width > 600) {
      // Zwei Spalten
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hier passen zwei Spalten hin!',
            style: TextStyle(fontSize: 30, color: Colors.grey),
          ),
          const SizedBox(height: 10.0),
          Text(
            'Bildschirmbreite: ${MediaQuery.of(context).size.width}',
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
          Text(
            'Bildschirmhöhe: ${MediaQuery.of(context).size.height}',
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
          Text(
            'Seitenverhältnis: ${MediaQuery.of(context).size.aspectRatio}',
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
          Text(
            'Ausrichtung: ${MediaQuery.of(context).orientation}',
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hier passt eine Spalte hin!',
            style: TextStyle(fontSize: 30, color: Colors.grey),
          ),
          const SizedBox(height: 10.0),
          Text(
            'Bildschirmbreite: ${MediaQuery.of(context).size.width}',
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
          Text(
            'Bildschirmhöhe: ${MediaQuery.of(context).size.height}',
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
          Text(
            'Seitenverhältnis: ${MediaQuery.of(context).size.aspectRatio}',
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
          Text(
            'Ausrichtung: ${MediaQuery.of(context).orientation}',
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      );
    }
  }
}
