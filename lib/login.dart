import 'package:flutter/material.dart';
import 'package:mi_primera_app_19/home.dart';
import 'package:mi_primera_app_19/utils/singleton.dart';
import 'package:mi_primera_app_19/widgets/loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  ///Singleton singleton = Singleton();

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    ///la función initState no puede realizar acciones asincronas o futuras
    initShared();
    // TODO: implement initState
    super.initState();
  }

  Future<void> initShared() async {
    sharedPreferences = await  SharedPreferences.getInstance();
    ///Función para verificar si tiene la sesión activa
    tieneLaSesionAbierta();
  }

  @override
  Widget build(BuildContext context) {

    Widget loadingIndicator = singleton.loader ?
    const Loader() : Container();

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
              //color: Color(0xFFb9a8c), ///Valor hexadecimal del color ------->
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
                  ///SINGLETON

                  ///Widget para agregar una imagen almacenada de forma local
                  Image.asset('imagenes/Untitled.png',
                    height: MediaQuery.of(context).size.height * 0.2,
                    alignment: Alignment.topLeft,
                  ),
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
                        prefixIcon: const Icon(Icons.password),
                        ///Agregar texto de ayuda dentro del input
                        hintText: 'Arega tu contraseña'
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
                          showSnackBar('Ingreso correctamente', 10);

                          singleton.userName = 'Alejandro Ordaz';

                          ///Guardar información en cache
                          sharedPreferences.setBool('islogin', true);
                          sharedPreferences.setString('user', user.text);
                          sharedPreferences.setString('pass', pass.text);

                          sharedPreferences.setBool('islogin', false);
                          sharedPreferences.setString('user', '');
                          sharedPreferences.setString('pass', '');
                          //limpiar singleton

                          ///ARCHIVO DE RUTAS
                          ///"/"
                          ///"/registro" 'o "registro"
                          ///"/home" 'o "main"
                          ///MANDAR A LLAMAR A LA VISTA/CLASE DIRECTAMENTE
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Home()));

                          ///Login
                          ///Home
                          ///Perfil
                        } else {
                          print('Usuario y/o Contraseña incorrectos');
                          showSnackBar('Usuario y/o Contraseña incorrectos', 20);
                        }
                      });
                    }, ///Función interna
                    child: Row(
                      ///Alinear horizontamente
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      ///Vertical
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.verified_user),
                        const Text('INGRESAR'),
                      ],
                    )
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
          ),
          Align(alignment: FractionalOffset.center, child: loadingIndicator)
        ],
      ),
    ); 
  }

  ///AREA PARA LAS FUNCIONES
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

  void tieneLaSesionAbierta() {
    ///Existe un valor de islogin se asigna a la variable y si no se
    ///asigna un valor d epor default
    singleton.login = (sharedPreferences.getBool('islogin') ?? false);

    if(singleton.login) {
      print('Si tiene la sesión abierta');
      singleton.user = (sharedPreferences.getString('user') ?? '');
      singleton.pass = (sharedPreferences.getString('pass') ?? '');
      setState(() {
        singleton.loader = true;
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Home()));
      });
    } else {
      print('No tiene la sesión abierta');
    }
  }
}
