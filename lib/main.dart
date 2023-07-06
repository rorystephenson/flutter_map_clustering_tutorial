import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FlutterMap Clustering',
      home: FlutterMapPage(),
    );
  }
}

class FlutterMapPage extends StatelessWidget {
  const FlutterMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FlutterMap Clustering')),
      body: const SizedBox.shrink(),
    );
  }
}
