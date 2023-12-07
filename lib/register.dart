import 'package:flutter/material.dart';
import 'package:aventuras_jack_integradora/login.dart';
import 'package:aventuras_jack_integradora/home_principal.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrarse"),
        backgroundColor: Colors.black, // Establece el color de fondo del AppBar en negro
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo.jpg"), // Agrega la imagen de fondo
            fit: BoxFit.cover, // Ajusta la imagen para cubrir el contenedor
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              25, 0, 25, 10), // Agrega un padding en la parte inferior
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Nombre",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: "Fecha de Nacimiento",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: "Correo",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: "Contraseña",
                ),
                obscureText: true,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Navega a la pantalla de inicio de sesión (Login)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text(
                  "Registrarse",
                  style: TextStyle(fontSize: 18, shadows: [
                    Shadow(
                      color: Colors.white,
                      offset: Offset(0, 0),
                      blurRadius: 10,
                    )
                  ]),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(
                      0xFFE61E1E), // Usar el código de color en lugar de ARGB
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  elevation: 10,
                ),
              ),
              SizedBox(height: 10),
              // Resto del contenido del widget
            ],
          ),
        ),
      ),
    );
  }
}