
import 'package:flutter/material.dart';

void main() {
  runApp(const BusFormDemo());
}

class BusFormDemo extends StatelessWidget {
  const BusFormDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Form Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const BusFormScreen(),
    );
  }
}

class BusFormScreen extends StatefulWidget {
  const BusFormScreen({super.key});

  @override
  State<BusFormScreen> createState() => _BusFormScreenState();
}

class _BusFormScreenState extends State<BusFormScreen> {
  final busNumberController = TextEditingController();
  final sourceController = TextEditingController();
  final destinationController = TextEditingController();

  @override
  void dispose() {
    busNumberController.dispose();
    sourceController.dispose();
    destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Details Form'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.directions_bus,
              size: 70,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: busNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Bus Number',
                hintText: 'Enter bus number',
                prefixIcon: Icon(Icons.confirmation_number),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: sourceController,
              decoration: const InputDecoration(
                labelText: 'Source',
                hintText: 'Enter starting point',
                prefixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: destinationController,
              decoration: const InputDecoration(
                labelText: 'Destination',
                hintText: 'Enter destination',
                prefixIcon: Icon(Icons.flag),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                final bus = busNumberController.text;
                final source = sourceController.text;
                final destination = destinationController.text;

                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Entered Bus Details'),
                    content: Text(
                      'Bus Number: $bus\n'
                      'Source: $source\n'
                      'Destination: $destination',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.check),
              label: const Text('Submit Details'),
            ),
          ],
        ),
      ),
    );
  }
}
