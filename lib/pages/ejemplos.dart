import 'package:ejemplo/pages/ejemplos_diapos/ejemplo1.dart';
import 'package:ejemplo/pages/ejemplos_diapos/ejemplo2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Ejemplo1(),
                      ));
                },
                child: Text("Ejemplo 1")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnBoarding(),
                      ));
                },
                child: Text("Ejemplo 2"))
          ],
        ),
      ),
    );
  }
}
