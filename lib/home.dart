import 'package:flutter/material.dart';
import 'package:mi_primera_app_19/utils/constantes.dart' as con;
import 'package:mi_primera_app_19/utils/singleton.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Singleton singleton = Singleton();
  late List lista = [];
  int count = 0;
  
  ///Cargar o actualizar las varibles o estados antes de visualizar o craer la vista
  @override
  void initState() {
    //lista = con.lista; ///
    //lista = List.from(con.lista); ///Copia de una lista inmutable a una lista mutable o cambiante
    // TODO: implement initState
    super.initState();
  }
  
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

                Text(singleton.userName),

                Container(
                  ///MediaQuery.of(context).size.height / 2 ó * 0.5 -> 50%
                  height: size.height, ///100%
                  width: size.width, ///100%
                  child: ///Nos permite manejar listas de datos para construir widgtes
                  ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: lista.length, ///n que itera o construye sus widgets
                      itemBuilder: (BuildContext context, int index) {
                        ///Area de construcción NO PASAR

                        String varianle = '';
                        ///Tipo dinamico o que se adapta al valor que se asigna
                        ///datos = [1, Text1, textN1, 101]
                        var datos = lista[index].toString().split('#'); ///$ -> NO USAR

                        return datos[4] == '1' ? createdCard(
                          textoN: datos[1],
                          texto: datos[2],
                          numero: datos[3],
                          id: datos[0],
                          ///float.parse(string)
                          ///int num = 0;
                          ///String variable = num.toString();
                        ) : createdCard2(datos[1], int.parse(datos[0]));
                      }
                    //const SizedBox(height: 35.0,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        ///Colores con RGBO (red, green, blue, opacidad)
        backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        tooltip: 'Increment', ///Etiqueta unica (solo se usa si hay más de un btn)
        onPressed: (){
          setState(() {
            showDialogForm(context, '');
            count = count + 1;

          });
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  ///Alertas
  showDialogForm(BuildContext context, String text) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(26.0))
            ),
            title: const Text('Añadir un nuevo usuario',
                style: TextStyle(color: Colors.red)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(), TextFormField(), TextFormField()
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  setState(() {
                    lista.add('$count#Texto $count#Texto $count#Texto $count#$count#$count');
                    Navigator.of(context).pop(true);
                  });

                  },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  ' Agregar ', style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        }
    );
  }


  Container createdCard2(String texto, int id) {
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
                  setState(() {
                    lista.removeAt(id);
                    showSnackBar('Se elimino el elemento $id', 15);
                    print("fue presionado el botón de eliminar id: $id");
                  });
                  },
                child: Icon(Icons.delete),
              )
          )
        ],
      ),
    );
  }

  void showSnackBar(String texto, int duracion){
    final snack = SnackBar(
      content: Text(texto),
      duration: Duration(seconds: duracion),
      action: SnackBarAction(
        onPressed: () {
          //Cualquier acción al dar clic sobre el widget
        },
        label: 'Cerrar',
      ),
    );

    ///Muestra el mensaje en pantalla
    ScaffoldMessenger.of(context).showSnackBar(snack);
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
