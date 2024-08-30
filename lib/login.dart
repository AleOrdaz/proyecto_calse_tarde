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
              color: Color(0xFFb9a8c), ///Valor hexadecimal del color
              child: Column(
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
                  ),
                  const Text('Contraseña:'),
                  TextFormField(
                    controller: pass,
                    obscureText: true, ///Ocultar el texto normal
                  ),
                  const SizedBox(height: 20.0,),
                  ElevatedButton(
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
