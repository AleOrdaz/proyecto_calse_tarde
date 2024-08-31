import 'package:flutter/material.dart';

///Clase de creación de widgets con cambios de estado
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ///Variables para capturar el valor que escriba el usuario en los inputs
  TextEditingController user = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// Widget principal para crear una vista completa
    return Scaffold(
      ///Construye todos los widgets hijos/internos uno sobre otro
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(50.0),
            child: Container(
              height: 800, ///Agrega un tamaño al contenedor
              ///Se puede agregar padding como atributo del contenedor
              padding: EdgeInsets.all(20.0),
              color: Color(0xFFb9a8c), ///Valor hexadecimal del color  -------->
              ///quita las esquina rectangulares por bordes redondeados          Al tener estos dos atributos
              decoration: BoxDecoration(      ///                                juntos, marcará un error por
                borderRadius: BorderRadius.circular(40),    ///                  incompatibilidad de atributos
                color: Colors.black54, /// ------------------------------------>
              ),
              child: Column(
                ///Atributo de Column para indicar el tamaño que debe tener por
                ///el espacio que ocupan sus hijos widgets
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  const Text('Usuario/correo/telefono:'),
                  TextFormField(
                    controller: user,
                    ///Crear un recuadro más estilizado
                    decoration: InputDecoration(
                      ///Agregar un recuadro con bordes redondeado
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        ),
                      ),
                      ///Agregar color interno del input
                      filled: true,
                      fillColor: Colors.white,
                      ///Agregar un icono dentro del input
                      prefixIcon: const Icon(Icons.person),
                        ///Agregar texto de ayuda dentro del input
                      hintText: 'Arega tu usuario'
                    ),
                  ),
                  const Text('Contraseña:'),
                  TextFormField(
                    controller: pass,
                    obscureText: true, ///Ocultar el texto normal
                    ///Crear un recuadro más estilizado
                    decoration: InputDecoration(
                      ///Agregar un recuadro con bordes redondeado
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 1,
                            style: BorderStyle.none,
                          ),
                        ),
                        ///Agregar color interno del input
                        filled: true,
                        fillColor: Colors.white,
                        ///Agregar un icono dentro del input
                        prefixIcon: const Icon(Icons.person),
                        ///Agregar texto de ayuda dentro del input
                        hintText: 'Arega tu usuario'
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  ElevatedButton(
                    ///Atributo para agregar estilo al botón
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, ///Color al botón
                      ///Agrega borde redondeado en las esquinas
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      fixedSize: Size(200,40), ///Tamaño que tendrá el botón
                    ),
                    onPressed: () {
                      ///Detectar los cambios de estado de nuestra vista actual
                      setState(() {
                        print('Usuario: ${user.text}');
                        print("Contraseña: " + pass.text);

                        //SOLO DE INGRESAR CON EL USUARIO USER01 Y PASS01

                        if(user.text == "USER01" && pass.text == "PASS01"){
                          print('Ingreso correctamente');
                        } else {
                          print('Usuario y/o Contraseña incorrectos');
                        }
                      });
                    }, ///Función interna
                    child: const Text('INGRESAR'),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    color: Colors.red,
                  ) /// transparente o sin tamaño
                  //Icon(Icons.home)
                ],
              ),
            )
          )
        ],
      ),
    ); 
  }
}
