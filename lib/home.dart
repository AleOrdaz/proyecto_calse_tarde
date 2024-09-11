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
    ///Obtener el tamaño de la pantalla actual
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ///for(int i = 0; i < 5; i++)
                /// createdCard(texto: "Hola 1")
                /*InkWell(
                  onTap: () {
                    setState(() {
                      bandCambiaDeColor = bandCambiaDeColor ? false : true;
                    });
                  },
                  child: bandCambiaDeColor ? Container(
                    color: bandCambiaDeColor ? Colors.red : Colors.green,
                    height: 50,
                    width: 50,
                  ) : Container(),
                ),*/

                Container(
                  ///MediaQuery.of(context).size.height / 2 ó * 0.5 -> 50%
                  height: size.height, ///100%
                  width: size.width, ///100%
                  child: ///Nos permite manejar listas de datos para construir widgtes
                  ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: con.lista.length, ///n que itera o construye sus widgets
                      itemBuilder: (BuildContext context, int index) {
                        ///Area de construcción NO PASAR

                        String varianle = '';
                        ///Tipo dinamico o que se adapta al valor que se asigna
                        ///datos = [1, Text1, textN1, 101]
                        var datos = con.lista[index].toString().split('#'); ///$ -> NO USAR

                        return createdCard(
                          textoN: datos[1],
                          texto: datos[2],
                          numero: datos[3],
                          id: datos[0],
                        );
                      }
                    //const SizedBox(height: 35.0,),
                  ),
                )

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
  final String textoN;
  final String texto;
  final String numero;
  final String id;
  const createdCard({
    super.key, required this.texto, required this.textoN,
    required this.numero, required this.id,
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
              ///Le da propieddad de realizar la función de botón
              child: InkWell(
                onTap: () {
                  print("fue presionado el botón de eliminar id: $id");
                },
                child: Icon(Icons.delete),
              )

          )
        ],
      ),
    );
  }
}
