import 'package:flutter/material.dart';
import 'package:mi_primera_app_19/utils/constantes.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [

                createdCard(texto: "Hola 1"),
              ],
            ),
          )
        ],
      ),
    );
  }
}


///Clase para crear widgets  o creador de widgets sin estado
class createdCard extends StatelessWidget {
  final String texto;
  const createdCard({
    super.key, required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: con.colorPrincipal,
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            flex: 10, ///80%
            child:  Text(texto),),
          Expanded(
            flex: 1, ///1.2 = 10%
            child: Icon(Icons.edit),),
          Expanded(
              flex: 1, ///1.2 = 10%
              child: Icon(Icons.delete))
        ],
      ),
    );
  }
}
