
import 'package:flutter/material.dart';

void main() {
  runApp(const BusNavigationDemo());
}

class BusNavigationDemo extends StatelessWidget {
  const BusNavigationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Navigation Demo',
      home: const BusHomeScreen(),
    );
  }
}

class BusHomeScreen extends StatelessWidget {
  const BusHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Tracking - Home'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.directions_bus,
                size: 90, color: Colors.blue),
            const SizedBox(height: 16),
            const Text(
              'Welcome to Bus Tracking System',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BusDetailsScreen(),
                  ),
                );
              },
              child: const Text('View Bus Details'),
            ),
          ],
        ),
      ),
    );
  }
}

class BusDetailsScreen extends StatelessWidget {
  const BusDetailsScreen({super.key});

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
