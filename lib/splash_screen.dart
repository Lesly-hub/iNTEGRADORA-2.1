import 'package:flutter/material.dart';
import 'package:aventuras_jack_integradora/home.dart';
import 'dart:async';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progress = 0.0;
  bool _isLoading = true;

  Future<void> _simulateLoading() async {
    const totalDuration = Duration(seconds: 10);
    const updateInterval = Duration(milliseconds: 100);
    int intervals = 0;
    int totalIntervals =
        totalDuration.inMilliseconds ~/ updateInterval.inMilliseconds;

    await Future.doWhile(() async {
      if (intervals >= totalIntervals) {
        if (mounted) {
          setState(() {
            _isLoading = false;
            _progress = 1.0;
          });
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => Home(),
            ),
          );
        }
        return false;
      }
      if (mounted) {
        setState(() {
          _progress = (intervals + 1) / totalIntervals;
        });
      }
      intervals++;
      await Future.delayed(updateInterval);
      return true;
    });
  }

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icono.png',
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
              Text(
                _isLoading ? "Cargando..." : "Carga completada",
                style: TextStyle(
                  fontSize: 38,
                  fontFamily: 'MiFuente',
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              if (_isLoading)
                Column(
                  children: [
                    SizedBox(
                      height: 25,
                      child: LinearProgressIndicator(
                        value: _progress,
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 65, 142, 241)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${(_progress * 100).toInt()}%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
