import 'package:flutter/material.dart';
import 'package:mi_primera_app_19/utils/get_api.dart';
import 'package:mi_primera_app_19/widgets/drawer.dart';

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  var respuestaJson;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A71B0),
        title: const Text(
          "Ejemplos de API's", style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      drawer: appDrawer(size: size),
      body: Stack(
        children: [
          Center(
            child: Text(respuestaJson.toString()),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => getJsonData(),
      ),
    );
  }

  Future<void> getJsonData() async {
    //Llamado a la clase
    Colores colores = Colores( nombre: '', );

    try {
      var data;
      //LLamado a la funcion que solicita a la api las colores
      data = await colores.getColores();
      if(data['estatus'] == 200) {
        respuestaJson = data;

      } else {
        print('Lista vacia');
        respuestaJson = data;
      }
    } catch(e) {
      print('Hubo un error al extraer los datos');
    }

    setState(() {});
  }

  int lengthList(var list) {
    int num = 0;
    try {
      for(var cad in list) {
        num = num + 1;
      }
    } catch(e) {
      num = 0;
    }
    return num;
  }
}
