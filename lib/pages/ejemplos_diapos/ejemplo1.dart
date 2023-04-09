import 'package:flutter/material.dart';

class Ejemplo1 extends StatelessWidget {
  const Ejemplo1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                labelText: 'Nombre de Usuario',
              ),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 32.0),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Iniciar Sesión',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                // Lógica para iniciar sesión
              },
            ),
          ],
        ),
      ),
    );
  }
}
