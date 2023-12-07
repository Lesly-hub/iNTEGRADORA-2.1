import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aventuras_jack_integradora/login.dart';
import 'package:aventuras_jack_integradora/MenuScreen.dart';

class HomePrincipal extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkLoggedInStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == true) {
            return _buildLoggedInUI(context);
          } else {
            return _buildNotLoggedInUI(context);
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<bool> _checkLoggedInStatus() async {
    try {
      prefs = await SharedPreferences.getInstance();
      return prefs.getBool('isLoggedIn') ?? false;
    } catch (e) {
      print('Error al obtener SharedPreferences: $e');
      return false;
    }
  }

  Widget _buildLoggedInUI(BuildContext context) {
    String username = prefs.getString('username') ?? 'Usuario';

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Principal'),
        actions: [
          // Agregar el menú desplegable
          PopupMenuButton<String>(
            onSelected: (value) {
              // Manejar la selección del menú
              _handleMenuSelection(context, value);
            },
            itemBuilder: (BuildContext context) {
              return {'Menu', 'Opción 2', 'Opción 3'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bienvenido, $username'),
            ElevatedButton(
              onPressed: () async {
                await prefs.setBool('isLoggedIn', false);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
              child: Text('Salir'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotLoggedInUI(BuildContext context) {
    return Login();
  }

  void _handleMenuSelection(BuildContext context, String value) {
    switch (value) {
      case 'Opción 1':
        // Manejar la selección de la opción 1
        break;
      case 'Opción 2':
        // Manejar la selección de la opción 2
        break;
      case 'Opción 3':
        // Manejar la selección de la opción 3
        break;
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: Login(),
  ));
}

