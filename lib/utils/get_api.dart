import 'dart:convert';

import 'package:http/http.dart' as http;

class Colores {
  Colores({required this.nombre});

  final String nombre;
  final String url ='http://nrweb.com.mx/ws_pruebas/FDM/colores.php';

  Future getColores() async {
    try {
      print('$url?nombre=$nombre');
      http.Response response = await http.get(Uri.parse('$url?nombre=$nombre'));

      if (response.statusCode == 200) {
        String data = response.body;
        print(data);
        return jsonDecode(data);
      }
      else {
        print(response.statusCode);
      }
    } catch(e) {
      print(e);
    }
  }
}

class NetworkHelper{
  NetworkHelper({required this.startLng,required this.startLat,
    required this.endLng,required this.endLat});

  final String url ='https://api.openrouteservice.org/v2/directions/';
  final String apiKey = '5b3ce3597851110001cf62489d22383db9384dd2bcad3a6f47678d6f';
  final String journeyMode = 'driving-car'; // Change it if you want or make it variable
  final double startLng;
  final double startLat;
  final double endLng;
  final double endLat;

  Future getData() async{
    http.Response response = await http.get(Uri.parse('$url$journeyMode?'
        'api_key=$apiKey&start=$startLng,$startLat&end=$endLng,$endLat'));
    print("$url$journeyMode?$apiKey&start=$startLng,$startLat&end=$endLng,$endLat");

    if(response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    }
    else{
      print(response.statusCode);
    }
  }
}