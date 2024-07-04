import 'package:flutter/material.dart';
import 'package:app_googlemaps/model/ItemModel.dart';
import'package:google_maps_flutter/google_maps_flutter.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController? mapController;

  final LatLng _center = const LatLng(-5.0920548, -42.8130066);

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }

  @override
  void initState(){
    super.initState();
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
              zoom: 11.0,
          ), 
        ),
      )
    );
  }
}