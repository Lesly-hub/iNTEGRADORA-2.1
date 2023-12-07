
import 'package:flutter/material.dart';
import 'package:aventuras_jack_integradora/home.dart'; // Importa el archivo home.dart
import 'package:aventuras_jack_integradora/splash_screen.dart'; // Importa el archivo splash_screen.dart

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(), // Inicia con la pantalla de splash
    theme: new ThemeData.dark(),
  ));

  
  Future.delayed(Duration(seconds: 5), () {
    runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          Home(), 
      theme: new ThemeData.dark(),
    ));
  });
}
