import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mi_primera_app_19/utils/get_api.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  late GoogleMapController mapController;

  late final LatLng _center = const LatLng(22.144596, -101.009064);

  //Origin
  static const LatLng sourceLocation = LatLng(22.144596, -101.009064);
  //Destino
  static const LatLng destination = LatLng(22.14973, -100.992221);

  @override
  void initState() {
    getJsonData(); // Función que realiza el llamado a la api

    // TODO: implement initState
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
            initialCameraPosition: CameraPosition(target: _center, zoom: 11.0,),
          ),
        ],
      ),
    );
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
      //

    } catch(e) {
      print('Hubo un error al extraer las coordenadas');
    }
  }
}

class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}
