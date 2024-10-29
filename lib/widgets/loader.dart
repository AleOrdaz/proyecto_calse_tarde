import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  // Constructor que pide las variables necesarias
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope ( ///Desactiva el botón "back"  nativo del dispositivo
      onWillPop: () async {
        return Future.value(false);
      },
      child: const CircularProgressIndicator( ///Widget de loader o cargando
        backgroundColor: Colors.black,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
      ),
    );
  }
}