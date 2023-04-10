import 'package:flutter/material.dart';

class AnimationsWidget extends StatefulWidget {
  const AnimationsWidget({super.key});
  @override
  _AnimationsWidgetState createState() => _AnimationsWidgetState();
}

class _AnimationsWidgetState extends State<AnimationsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Configurar el controlador de la animación.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    // Configurar las animaciones.
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticIn,
    ));

    _sizeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );

    _opacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCirc,
    );

    _rotationAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 2.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimations() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo de Animaciones'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _slideAnimation,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                width: 200.0,
                height: 50.0,
                color: Colors.blue,
                child: const Center(child: Text("SlideTransition")),
              ),
            ),
            SizeTransition(
              sizeFactor: _sizeAnimation,
              axis: Axis.horizontal,
              axisAlignment: 0,
              child: Container(
                width: 140.0,
                height: 50.0,
                color: Colors.green,
                child: const Center(child: Text("SizeTransition")),
              ),
            ),
            FadeTransition(
              opacity: _opacityAnimation,
              child: Container(
                margin: const EdgeInsets.all(10.0),
                width: 100.0,
                height: 100.0,
                color: Colors.yellow,
                child: const Center(child: Text("FadeTransition")),
              ),
            ),
            RotationTransition(
              turns: _rotationAnimation,
              child: Container(
                width: 75.0,
                height: 75.0,
                color: Colors.red,
                child: const Center(child: Text("Rotation\nTransition")),
              ),
            ),
            ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                margin: const EdgeInsets.all(40.0),
                width: 100.0,
                height: 50.0,
                color: Colors.orange,
                child: const Center(child: Text("ScaleTransition")),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startAnimations,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
