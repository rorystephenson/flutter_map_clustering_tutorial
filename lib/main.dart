import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_supercluster/flutter_map_supercluster.dart';
import 'package:latlong2/latlong.dart';

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
  static final _random = Random(42);
  static final _initialCenter = LatLng(42.0, 10.0);
  static final _markers = List<Marker>.generate(
    3000,
    (_) => Marker(
      builder: (context) => const Icon(Icons.location_on),
      point: LatLng(
        _random.nextDouble() * 3 - 1.5 + _initialCenter.latitude,
        _random.nextDouble() * 3 - 1.5 + _initialCenter.longitude,
      ),
    ),
  );

  const FlutterMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FlutterMap Clustering')),
      body: FlutterMap(
        options: MapOptions(
          center: _initialCenter,
          zoom: 8,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          SuperclusterLayer.immutable(
            initialMarkers: _markers,
            indexBuilder: IndexBuilders.rootIsolate,
            builder: (context, position, markerCount, extraClusterData) =>
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  markerCount.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
