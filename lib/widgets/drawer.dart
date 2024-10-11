import 'package:flutter/material.dart';
import 'package:mi_primera_app_19/api.dart';
import 'package:mi_primera_app_19/sqlite.dart';

class appDrawer extends StatelessWidget {
  const appDrawer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      width: size.width * 0.65,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('MI PRIMERA APLICACIÓN'),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 40,
                      child: Text(
                        '1', style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ),
                  ),
                ],
              )
          ),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('SQLite'),
            leading: const Icon(Icons.dataset_linked),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Sqlite()));
            },
          ),
          ListTile(
            title: const Text('Apis'),
            leading: const Icon(Icons.api),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Api()));
            },
          ),
          ListTile(
            title: const Text('Mapa'),
            leading: const Icon(Icons.map),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          SizedBox(height: size.height * 0.45,),
          const Divider(),
          ListTile(
            title: const Text('Cerrar Sesión'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}