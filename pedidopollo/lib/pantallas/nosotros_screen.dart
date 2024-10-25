import 'package:flutter/material.dart';

class NosotrosScreen extends StatefulWidget {
  const NosotrosScreen({super.key});

  @override
  _NosotrosScreenState createState() => _NosotrosScreenState();
}

class _NosotrosScreenState extends State<NosotrosScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Controlador para la animación
  late Animation<double> _animation; // Tween para la animación

  @override
  void initState() {
    super.initState();

    // Configuramos el AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Configuramos el Tween para la animación controlada
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Iniciar la animación
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Liberar el controlador cuando ya no se use
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nosotros'),
      ),
      body: Stack(
        children: <Widget>[
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20), // Espacio entre el texto y las imágenes
                ],
              ),
            ),
          ),
          // Imágenes con animación controlada
          FadeTransition(
            opacity: _animation,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Image.asset(
                            'assets/images/matriz_quito.jpg',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'MATRIZ QUITO',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center, // Centrar texto
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Av. america y Mañosca',
                            textAlign: TextAlign.center, // Centrar texto
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20), // Espacio entre las imágenes
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Image.asset(
                            'assets/images/sucursales.jpg',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Nuestras sucursales',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center, // Centrar texto
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
                          child: Text(
                            'Misión Ofrecer a nuestros clientes una experiencia.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
