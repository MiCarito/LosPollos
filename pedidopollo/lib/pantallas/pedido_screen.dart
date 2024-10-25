import 'package:flutter/material.dart';

// PedidoScreen con animaciones
class PedidoScreen extends StatefulWidget {
  const PedidoScreen({super.key});

  @override
  _PedidoScreenState createState() => _PedidoScreenState();
}

class _PedidoScreenState extends State<PedidoScreen> with SingleTickerProviderStateMixin {
  bool _isVisible1 = true; // Para la primera imagen
  bool _isVisible2 = true; // Para la segunda imagen
  bool _isVisible3 = true; // Para la tercera imagen
  late AnimationController _controller; // Controlador para animación controlada
  late Animation<double> _animation; // Tween para la animación controlada

  @override
  void initState() {
    super.initState();

    // Configuramos el AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Configuramos el Tween para la animación controlada
    _animation = Tween<double>(begin: 0, end: 300).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Aseguramos una curva suave
    ))..addListener(() {
        setState(() {}); // Redibuja el widget cuando la animación avanza
      });

    // Iniciar la animación controlada
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Liberar el controlador cuando ya no se use
    super.dispose();
  }

  void _toggleImageVisibility(int imageIndex) {
    setState(() {
      if (imageIndex == 1) {
        _isVisible1 = !_isVisible1; // Cambia la visibilidad de la primera imagen
      } else if (imageIndex == 2) {
        _isVisible2 = !_isVisible2; // Cambia la visibilidad de la segunda imagen
      } else if (imageIndex == 3) {
        _isVisible3 = !_isVisible3; // Cambia la visibilidad de la tercera imagen
      }
    });
  }

  void _makeOrder() {
    // Aquí puedes añadir la lógica del pedido
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Pedido realizado con éxito!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedido de Pollo'),
      ),
      body: Center(
        child: SingleChildScrollView( // Permite desplazamiento si hay contenido extenso
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0), // Añadir padding a los lados
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Primera imagen
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: _isVisible1 ? 1.0 : 0.0,
                      duration: const Duration(seconds: 2),
                      child: Image.network(
                        'https://www.lospollosdelatri.com.ec/wp-content/uploads/2024/03/nuevo-combo-capitan-2024.png.webp',
                        height: 200,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text('Error al cargar la imagen', style: TextStyle(color: Colors.red));
                        },
                      ),
                    ),
                    const SizedBox(height: 10), // Espacio entre la imagen y el botón de mostrar/ocultar
                    ElevatedButton(
                      onPressed: () => _toggleImageVisibility(1), // Cambia la visibilidad de la primera imagen
                      child: const Text('Mostrar/Ocultar COMBO 1'),
                    ),
                    const SizedBox(height: 10), // Espacio entre el botón de mostrar/ocultar y el botón de pedido
                    ElevatedButton(
                      onPressed: _makeOrder, // Añadir la lógica del pedido
                      child: const Text('Pedir'),
                    ),
                  ],
                ),

                const SizedBox(height: 20), // Espacio entre las imágenes

                // Segunda imagen
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: _isVisible2 ? 1.0 : 0.0,
                      duration: const Duration(seconds: 2),
                      child: Image.network(
                        'https://www.lospollosdelatri.com.ec/wp-content/uploads/2024/02/promocion-locos-pollo-asado-2024.png.webp',
                        height: 200,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text('Error al cargar la imagen', style: TextStyle(color: Colors.red));
                        },
                      ),
                    ),
                    const SizedBox(height: 10), // Espacio entre la imagen y el botón de mostrar/ocultar
                    ElevatedButton(
                      onPressed: () => _toggleImageVisibility(2), // Cambia la visibilidad de la segunda imagen
                      child: const Text('Mostrar/Ocultar COMBO 2'),
                    ),
                    const SizedBox(height: 10), // Espacio entre el botón de mostrar/ocultar y el botón de pedido
                    ElevatedButton(
                      onPressed: _makeOrder, // Añadir la lógica del pedido
                      child: const Text('Pedir'),
                    ),
                  ],
                ),

                const SizedBox(height: 20), // Espacio entre las imágenes

                // Tercera imagen
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: _isVisible3 ? 1.0 : 0.0,
                      duration: const Duration(seconds: 2),
                      child: Image.network(
                        'https://www.lospollosdelatri.com.ec/wp-content/uploads/2024/02/promocion-locos-pollo-broaster-2024.png',
                        height: 200,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text('Error al cargar la imagen', style: TextStyle(color: Colors.red));
                        },
                      ),
                    ),
                    const SizedBox(height: 10), // Espacio entre la imagen y el botón de mostrar/ocultar
                    ElevatedButton(
                      onPressed: () => _toggleImageVisibility(3), // Cambia la visibilidad de la tercera imagen
                      child: const Text('Mostrar/Ocultar COMBO 3'),
                    ),
                    const SizedBox(height: 10), // Espacio entre el botón de mostrar/ocultar y el botón de pedido
                    ElevatedButton(
                      onPressed: _makeOrder, // Añadir la lógica del pedido
                      child: const Text('Pedir'),
                    ),
                  ],
                ),

                const SizedBox(height: 20), // Espacio final
              ],
            ),
          ),
        ),
      ),
    );
  }
}
