import 'package:flutter/material.dart';
import 'package:pedidopollo/pantallas/contacto_screen.dart';
import 'package:pedidopollo/pantallas/nosotros_screen.dart';
import 'package:pedidopollo/pantallas/pedido_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const AsaderoApp());

class AsaderoApp extends StatelessWidget {
  const AsaderoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asadero El Buen Sabor',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const InicioScreen(),
    );
  }
}

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

void _openWhatsApp() async {
  final whatsappUrl = Uri.parse("https://wa.me/593123456789"); // Ajusta el número
  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
  } else {
    final webUrl = Uri.parse("https://web.whatsapp.com/send?phone=593123456789"); // Ajusta el número
    if (await canLaunchUrl(webUrl)) {
      await launchUrl(webUrl);
    } else {
      throw "No se puede abrir WhatsApp";
    }
  }
}

void _makePhoneCall() async {
  final Uri phoneUrl = Uri(scheme: 'tel', path: '+593990431383'); // Cambia el número según sea necesario
  
  if (await canLaunchUrl(phoneUrl)) {
    await launchUrl(phoneUrl, mode: LaunchMode.externalApplication);
  } else {
    throw "No se puede realizar la llamada";
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'El Buen Sabor',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 230, 197, 171), Color.fromARGB(255, 212, 193, 248)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10),
              Image.asset(
                'assets/gif/comida.gif',
                width: 200,
                height: 200,
              ),
              ElevatedButton(
                child: const Text('Nosotros'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NosotrosScreen()),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Contactos'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactosScreen()),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Pedido de Pollo'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PedidoScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.green, size: 40),
                    onPressed: _openWhatsApp,
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.phone, color: Colors.blue, size: 40),
                    onPressed: _makePhoneCall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
