import 'package:ejemplo/pages/ejemplos_diapos/ejemplo1.dart';
import 'package:ejemplo/pages/ejemplos_diapos/ejemplo2.dart';
import 'package:ejemplo/pages/ejemplos_diapos/ejemplo3.dart';
import 'package:ejemplo/pages/ejemplos_diapos/ejemplo4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  int getCount() {
    try {
      final Controller c = Get.find();
      return c.count.toInt();
    } catch (e) {
      printError();
      return 0;
    }
  }

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
                child: const Text("Ejemplo 1")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnBoarding(),
                      ));
                },
                child: const Text("Ejemplo 2")),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnimationsWidget(),
                  ),
                );
              },
              child: const Text("Ejemplo 3"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
              child: const Text("Ejemplo 4"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int contador = getCount();
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200.0,
                color: Colors.white,
                child: Center(
                  child: Text('Contador: $contador'),
                ),
              );
            },
          );
        },
        child: const Icon(CupertinoIcons.archivebox_fill),
      ),
    );
  }
}
