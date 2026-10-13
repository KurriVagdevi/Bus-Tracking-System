
import 'package:flutter/material.dart';

void main() {
  runApp(const BusLayoutsDemo());
}

class BusLayoutsDemo extends StatelessWidget {
  const BusLayoutsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bus Tracking - Layouts'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '1. Row Layout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.directions_bus, color: Colors.blue, size: 40),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text('Bus 25 - City Express'),
                  ),
                  const Icon(Icons.check_circle, color: Colors.green),
                ],
              ),
              const Divider(height: 30),

              const Text(
                '2. Column Layout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Source: Uppal'),
                  Text('Destination: Secunderabad'),
                  Text('Status: On time'),
                ],
              ),
              const Divider(height: 30),

              const Text(
                '3. Stack Layout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 220,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    const Icon(
                      Icons.directions_bus,
                      size: 65,
                      color: Colors.blue,
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
