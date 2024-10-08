import 'package:flutter/material.dart';
import 'package:mi_primera_app_19/utils/db.dart';

class Sqlite extends StatefulWidget {
  const Sqlite({super.key});

  @override
  State<Sqlite> createState() => _SqliteState();
}

class _SqliteState extends State<Sqlite> {
  // All data
  List<Map<String, dynamic>> myData = [];

  bool _isLoading = true;
  // Función para refrescar las BD
  void _refreshData() async {
    final data = await DatabaseHelper.getItems();
    setState(() {
      myData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData(); // Cargar la información a la app
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void showMyForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingData =
      myData.firstWhere((element) => element['id'] == id);
      _titleController.text = existingData['title'];
      _descriptionController.text = existingData['description'];
    }

    //showModalBottomSheet(
    showDialog(
      context: context,
      //elevation: 5,
      //isScrollControlled: true,
      builder: (_) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(26.0))
        ),
        title: Text('Agregar nuevo dato'),
        content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(hintText: 'Title'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(hintText: 'Description'),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () async {
                  // Save new data
                  if (id == null) {
                    await addItem();
                  }

                  if (id != null) {
                    await updateItem(id);
                  }

                  // Clear the text fields
                  _titleController.text = '';
                  _descriptionController.text = '';

                  // Close the bottom sheet
                  Navigator.of(context).pop();
                },
                child: Text(id == null ? 'Create New' : 'Update'),
              )
            ],
          ),
      ),
    );
  }

// Insert a new data to the database
  Future<void> addItem() async {
    await DatabaseHelper.createItem(
        _titleController.text, _descriptionController.text);
    _refreshData();
  }

  // Update an existing data
  Future<void> updateItem(int id) async {
    await DatabaseHelper.updateItem(
        id, _titleController.text, _descriptionController.text);
    _refreshData();
  }

  // Delete an item
  void deleteItem(int id) async {
    await DatabaseHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Successfully deleted!'),
        backgroundColor:Colors.green
    ));
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF32775D),
        title: const Text(
          'Sqlite CRUD', style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      drawer: Drawer(
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
                // Update the state of the app.
                // ...
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
      ),
      body: _isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) : myData.isEmpty ? const Center(
          child:  Text("No Data Available!!!")
      ) : ListView.builder(
        itemCount: myData.length,
        itemBuilder: (context, index) => Card(
          color:index%2==0?Colors.green: Colors.green[200],
          margin: const EdgeInsets.all(15),
          child:ListTile(
            title: Text(myData[index]['title']),
            subtitle: Text(myData[index]['description']),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => showMyForm(myData[index]['id']),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteItem(myData[index]['id']),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showMyForm(null),
      ),
    );
  }
}
