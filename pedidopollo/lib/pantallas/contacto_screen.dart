import 'package:flutter/material.dart';

class ContactosScreen extends StatelessWidget {
  const ContactosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactos'),
      ),
      body: Stack(
        children: <Widget>[
          // Imagen de fondo
          Positioned.fill(
            child: Image.network(
              'https://www.lospollosdelatri.com.ec/wp-content/uploads/2024/03/nuevo-combo-capitan-2024.png.webp', // URL de la imagen de fondo
              fit: BoxFit.cover,  // Ajusta la imagen para cubrir toda la pantalla
            ),
          ),
          // Contenido encima de la imagen
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,  // Alinear el texto a la izquierda
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),  // Añadir padding
                  child: Text(
                    'Teléfono: 0980991916',
                    style: TextStyle(
                      color: Colors.white, // Cambiar el color del texto para que sea legible
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Correo: asadero@ejemplo.com',
                    style: TextStyle(
                      color: Colors.white, // Cambiar el color del texto
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 