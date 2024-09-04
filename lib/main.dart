import 'package:flutter/material.dart';
import 'package:mi_primera_app_19/home.dart';
import 'package:mi_primera_app_19/login.dart';

void main() {
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
      home: Home(),
    );
  }
}

