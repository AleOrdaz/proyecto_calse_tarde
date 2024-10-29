import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mi_primera_app_19/ejemplo.dart';
import 'package:mi_primera_app_19/ejemplos.dart';
import 'package:mi_primera_app_19/home.dart';
import 'package:mi_primera_app_19/login.dart';
import 'package:mi_primera_app_19/sqlite.dart';
import 'package:mi_primera_app_19/utils/singleton.dart';
import 'package:mi_primera_app_19/utils/util.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<void> main() async {
  sqfliteFfiInit(); ///Inicializar la BD
  ///Obtner las coordenadas del dispositivo
  try {
    //Solicitar el permiso de la geolocalización
    //Obtiene las coordenadas
    Position position = await Utils.determinePosition();
    singleton.latitud = position.latitude;
    singleton.longitud = position.longitude;
  }catch(e) {
    //Obtiene alguna falla al obtener coordenadas
    //asignamos valores por default
    singleton.latitud = 22.123456;
    singleton.longitud = -101.123456;
  }
  runApp(const MyApp());
}

///Clase solo para crear widgets sin cambios estado
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Sqlite(),
    );
  }
}

