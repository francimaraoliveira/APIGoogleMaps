import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController? mapController;

  final LatLng _center = const LatLng(-5.0887985, -42.81359);

  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
    _addMarkers();
  }

  void _addMarkers() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('marker_1'),
          position: LatLng(-5.0887985, -42.81359),
          infoWindow: InfoWindow(
            title: 'IFPI',
            snippet: 'Instituto Federal do Piauí',
          ),
        ),
        
      );

      _markers.add(
      Marker(markerId: MarkerId('marker2'),
            position: LatLng(-5.0696901, -42.7754298),
            infoWindow: InfoWindow(
              title: 'Condomínio Solaris 2',
              snippet: 'Condomínio Solaris 2',
            ),
      ),
      );
      // Adicione mais marcadores aqui se necessário
    });
  }

  @override
  Widget build(BuildContext) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0, // Ajuste o zoom para visualizar melhor o marcador
          ),
          markers: _markers,
        ),
      ),
    );
  }
}
