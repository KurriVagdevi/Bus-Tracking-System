
import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetsDemoApp());
}

class WidgetsDemoApp extends StatelessWidget {
  const WidgetsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Tracking Widgets Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bus Tracking System'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.blue),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.directions_bus,
                  size: 70,
                  color: Colors.blue,
                ),
                const SizedBox(height: 12),
                const Text(
                  'City Express',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('Bus Number: 25'),
                const Text('Route: Uppal to Secunderabad'),
                Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                  height: 100,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text('Image unavailable');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
