import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mi_primera_app_19/utils/get_api.dart';
import 'package:mi_primera_app_19/utils/singleton.dart';
import 'package:mi_primera_app_19/utils/util.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  late GoogleMapController mapController;
  final Completer<GoogleMapController> _controller = Completer();

  late LatLng _center = const LatLng(22.144596, -101.009064);

  //Origin
  static const LatLng sourceLocation = LatLng(22.144596, -101.009064);
  //Destino
  static const LatLng destination = LatLng(22.14973, -100.992221);

  @override
  void initState() {
    getJsonData(); // Función que realiza el llamado a la api
    cambiarLatLng(); //Función para actualizar las coordenadas
    // TODO: implement initState
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void cambiarLatLng() {
    _center = LatLng(singleton.latitud, singleton.longitud);
    getAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            //Función para actualizar la posición del dispositivo en movimiento
            onCameraMove: (CameraPosition position){
              setState(() {
                singleton.latitud = position.target.latitude;
                singleton.longitud = position.target.longitude;
                getAddress();
              });
            },
            initialCameraPosition: CameraPosition(target: _center, zoom: 11.0,),
            markers:{
              const Marker(
                markerId: MarkerId("source"),
                position: sourceLocation,
                infoWindow: InfoWindow(title: "Información inicio"),
              ),
              Marker(
                  markerId: MarkerId("destination"),
                  position: destination,
                  infoWindow: const InfoWindow(title: "Información destino"),
                  onTap: () {
                    setState(() {
                      //showAlertDialog(context);
                    });
                  }
              ),
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              singleton.direccion,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 200, left: 50),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue,
              child: IconButton(
                icon: Icon(Icons.location_searching),
                iconSize: 28,
                onPressed: () async {
                  final GoogleMapController controller =
                  await _controller.future;
                  Position p = await Utils.determinePosition();
                  setState(() {
                    singleton.latitud = p.latitude;
                    singleton.longitud = p.longitude;
                  });
                  //Mover la camara para posicionarse en nuestra posición
                  controller.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                        bearing: 0,
                        target:  LatLng(singleton.latitud,singleton.longitud),
                        zoom: 15.0
                      )));

                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> getAddress() async {
    try{
      ///Obtiene toda la información que existe gratis
      ///de las coordenadas
      List<Placemark> p = await placemarkFromCoordinates(
          singleton.latitud, singleton.longitud);
      Placemark place = p[0];
      setState(() {
        print(place);
        singleton.direccion = '${place.street}, ${place.locality}';
      });
    } catch(e) {
      singleton.direccion = 'No se existe dirección';
      print(e);
    }
  }

  Future<void> getJsonData() async {
    //Llamado a la clase
    NetworkHelper networkHelper = NetworkHelper(
      startLat: 22.144596,
      startLng: -101.009064,
      endLat: 22.149730,
      endLng: -100.992221,
    );


    try {
      //print(data['features'][0]['geometry']['coordinates']); // 3er
      var data;
      //LLamado a la funcion que solicita a la api las coordenadas
      data = await networkHelper.getData();
      print('data: $data'); //json completo
      //CAPTUREN O IMPRIMAN LAS COORDENADAS

    } catch(e) {
      print('Hubo un error al extraer las coordenadas');
    }
  }
}

class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}
