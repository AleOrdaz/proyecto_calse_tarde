///Punto acceso global para acceder a las variables que guardan información
///Pero se almacena si la app esta en uso
class Singleton {
  static Singleton? _instance;

  Singleton._internal() {
    _instance = this;
  }

  // Verifica si singleton es null, si es crea la instancia nueva y
  // si no devuelve la instancia del cache
  factory Singleton() => _instance ?? Singleton._internal();

  ///Siempre inicializar las varciables
  ///a excepción de asignar el valor null
  String userName = '';
}
late Singleton singleton;


///PROYECTO FINAL
///VIERNES 27 ME LA ENVIA WP O CORREO
///
/// SINGLETON Y SHARED PREFERENCES (PREFERENCIAS DEL USARIO)
/// MIN 5 DEPENDENCIAS
/// BD SQLITE O FIREBASE
/// MAPA
/// (OBL) LOGIN Y REGISTRO
/// (OPC) API
/// POR ALUMNO 4 VISTAS (2 Ó 3)
/// 1, 2 Y 3












