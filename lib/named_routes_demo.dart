
import 'package:flutter/material.dart';

void main() {
  runApp(const BusNamedRoutesDemo());
}

class BusNamedRoutesDemo extends StatelessWidget {
  const BusNamedRoutesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Named Routes',
      initialRoute: '/',
      routes: {
        '/': (context) => const BusHomePage(),
        '/details': (context) => const BusDetailsPage(),
      },
    );
  }
}

class BusHomePage extends StatelessWidget {
  const BusHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Tracking Home'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.directions_bus,
                size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Bus Tracking System',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/details');
              },
              child: const Text('View Bus Details'),
            ),
          ],
        ),
      ),
    );
  }
}

class BusDetailsPage extends StatelessWidget {
  const BusDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Details'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on,
                size: 70, color: Colors.green),
            const Text('Bus Number: 25',
                style: TextStyle(fontSize: 22)),
            const Text('Source: Uppal',
                style: TextStyle(fontSize: 18)),
            const Text('Destination: Secunderabad',
                style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
