import 'package:flutter/material.dart';
import 'package:aventuras_jack_integradora/login.dart';
import 'package:aventuras_jack_integradora/register.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aventuras de Jack"),
        backgroundColor: Color.fromARGB(255, 32, 31, 31),
      ),
      body: Container(
        color: Colors.black, // Establece el color de fondo negro
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logoEmpresa.png',
                    width: 180,
                    height: 180,
                  ),
                  Text(
                    "Las Aventuras de Jack",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'MiFuente',
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Bienvenido Explorador",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      // Navega a la pantalla de inicio de sesión (login)
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text("Iniciar Sesión", style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 30, 120, 230),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      elevation: 10,
                      shadowColor: Color.fromARGB(255, 30, 120, 230),
                      minimumSize: Size(140, 40),
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      // Navega a la pantalla de registro (register)
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text("Registrarse", style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 30, 120, 230),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      elevation: 10,
                      shadowColor: Color.fromARGB(255, 11, 204, 162),
                      minimumSize: Size(140, 40),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}