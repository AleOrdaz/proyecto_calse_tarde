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