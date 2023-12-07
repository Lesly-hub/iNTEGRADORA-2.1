import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aventuras_jack_integradora/login.dart';

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
      title: Text(
        'Home Principal',
        style: TextStyle(
          color: const Color.fromARGB(255, 245, 237, 237), // Color del texto en la barra de navegación
        ),
      ),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            _handleMenuSelection(context, value);
          },
          itemBuilder: (BuildContext context) {
            return {
              'Inicio',
              'Perfil',
              'Puntuacion General',
              'Puntuacion Individual',
              'Acerca de',
              'Cerrar Sesion',
            }.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(
                  choice,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 245, 243, 243), // Color del texto en el menú emergente
                  ),
                ),
              );
            }).toList();
          },
        ),
      ],
    ),
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/fondo.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido, $username',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Color del texto de bienvenida
              ),
            ),
            SizedBox(height: 20.0),
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
              child: Text(
                'Salir',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 231, 100, 91), // Color del botón
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
  Widget _buildNotLoggedInUI(BuildContext context) {
    return Login();
  }

  void _handleMenuSelection(BuildContext context, String value) {
    switch (value) {
      case 'Inicio':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenuScreen(),
          ),
        );
        break;
      case 'Perfil':
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PerfilScreen(),  // Corrige la navegación a PerfilScreen()
    ),
  );
  break;
      case 'Puntuacion General':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PuntuacionGeneralScreen(),
          ),
        );
        break;
      case 'Puntuacion Individual':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PuntuacionIndividualScreen(),
          ),
        );
        break;
      case 'Acerca de':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AcercaDeScreen(),
          ),
        );
        break;
      case 'Cerrar Sesion':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
        break;
    }
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.all(20), // Ajusta según sea necesario
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7), // Cuadrado blanco transparente
                borderRadius: BorderRadius.circular(10), // Ajusta según sea necesario
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Historia',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Cambia el color del texto a negro
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'En un remoto y misterioso templo perdido en la selva, se encuentra un legendario tesoro conocido como "El Diamante del Destino". Solo los valientes pueden intentar encontrarlo, y uno de ellos es Jack, un intrépido explorador que ha dedicado su vida a buscar tesoros perdidos. Un día, Jack escucha rumores sobre el templo y decide embarcarse en una emocionante aventura para encontrar el Diamante del Destino. El templo está lleno de trampas mortales y criaturas peligrosas que protegen el tesoro. Jack debe superar obstáculos para llegar al final. A medida que avanza por las diferentes salas del templo, Jack descubre pistas ocultas que lo guían hacia la ubicación exacta del Diamante del Destino. Sin embargo, también se encuentra con otros exploradores rivales que están dispuestos a hacer cualquier cosa para obtener el tesoro antes que él. Jack debe usar su ingenio y habilidades para resolver acertijos complicados y desbloquear puertas secretas. Además, debe recolectar gemas brillantes dispersas por todo el templo para desbloquear poderes especiales que lo ayudarán en su búsqueda. Con cada nivel superado, la dificultad aumenta. Los rompecabezas se vuelven más complicados y las trampas más mortales. Pero Jack no se rinde fácilmente; está decidido a llegar al corazón del templo y reclamar el Diamante del Destino como suyo. Finalmente, después de enfrentarse a numerosos desafíos, Jack llega a la cámara central donde se encuentra el Diamante del Destino. Pero justo cuando está a punto de tomarlo, es emboscado por uno de los exploradores rivales. Una intensa batalla comienza entre ambos aventureros mientras luchan por obtener el codiciado tesoro.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Cambia el color del texto a negro
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(20), // Ajusta según sea necesario
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7), // Cuadrado blanco transparente
                borderRadius: BorderRadius.circular(10), // Ajusta según sea necesario
              ),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Agrega la imagen centrada
                    Center(
                      child: Image.asset(
                        "assets/icono2.png",
                        width: 100.0, // Ajusta el ancho según tus necesidades
                        height: 100.0, // Ajusta la altura según tus necesidades
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      style: TextStyle(color: Colors.black), // Cambia el color del texto a negro
                      decoration: InputDecoration(
                        labelText: 'Nombre de Usuario',
                        labelStyle: TextStyle(color: Colors.black), // Cambia el color del texto a negro
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      style: TextStyle(color: Colors.black), // Cambia el color del texto a negro
                      decoration: InputDecoration(
                        labelText: 'Correo',
                        labelStyle: TextStyle(color: Colors.black), // Cambia el color del texto a negro
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      style: TextStyle(color: Colors.black), // Cambia el color del texto a negro
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(color: Colors.black), // Cambia el color del texto a negro
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      style: TextStyle(color: Colors.black), // Cambia el color del texto a negro
                      decoration: InputDecoration(
                        labelText: 'Fecha de Nacimiento',
                        labelStyle: TextStyle(color: Colors.black), // Cambia el color del texto a negro
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Aquí puedes manejar la lógica de guardar la información
                      },
                      child: Text('Guardar Cambios'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class PuntuacionGeneralScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Puntuación General'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.all(20), // Ajusta según sea necesario
              padding: EdgeInsets.all(20), // Ajusta según sea necesario
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7), // Cuadrado blanco transparente
                borderRadius: BorderRadius.circular(10), // Ajusta según sea necesario
              ),
              child: DataTable(
                headingTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black, // Cambia el color del texto a negro
                ),
                dataTextStyle: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black, // Cambia el color del texto a negro
                ),
                columns: [
                  DataColumn(label: Text('Jugadores')),
                  DataColumn(label: Text('Niveles')),
                  DataColumn(label: Text('Puntuación')),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('Josseline Alvarado Vargas')),
                      DataCell(Text('Nivel 1')),
                      DataCell(Text('100')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Lesly Yareth Hernandez')),
                      DataCell(Text('Nivel 2')),
                      DataCell(Text('150')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Ricardo Luna Santos')),
                      DataCell(Text('Nivel 3')),
                      DataCell(Text('150')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PuntuacionGeneralScreen(),
  ));
}

class PuntuacionIndividualScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Puntuación Individual'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icono3.png',
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DataTable(
                        headingTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.black, // Cambia el color del texto a negro
                        ),
                        dataTextStyle: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black, // Cambia el color del texto a negro
                        ),
                        dividerThickness: 5.0,
                        columns: [
                          DataColumn(
                            label: Text('Jugador'),
                            tooltip: 'Nombre del jugador',
                          ),
                          DataColumn(
                            label: Text('Nivel'),
                            tooltip: 'Nivel del jugador',
                          ),
                          DataColumn(
                            label: Text('Puntuación'),
                            tooltip: 'Puntuación del jugador',
                          ),
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(Text('Josseline Alvarado Vargas')),
                              DataCell(Text('Nivel 1')),
                              DataCell(Text('1000')),
                            ],
                          ),
                          // Agrega más filas según sea necesario
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class AcercaDeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca De'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Equipo de Desarrollo:',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '1. Lesly Yareth Hernandez Bonilla',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                '2. Josseline Alvarado Vargas',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                '3. Jose Luis Picazo',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Detalles Académicos:',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Materia: DMI',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Grado y Grupo: 10A',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Conclusión:',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Flutter ofrece una solución eficiente, atractiva y potente para el desarrollo de aplicaciones móviles de videojuegos. La capacidad de mantener una única base de código y proporcionar una experiencia de usuario de alta calidad en múltiples plataformas hace que sea una opción atractiva para los desarrolladores.',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}