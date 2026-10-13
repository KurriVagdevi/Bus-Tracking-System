
import 'package:flutter/material.dart';

void main() {
  runApp(const BusStateDemo());
}

class BusStateDemo extends StatelessWidget {
  const BusStateDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Widget Demo',
      home: const BusStatusScreen(),
    );
  }
}

class BusStatusScreen extends StatefulWidget {
  const BusStatusScreen({super.key});

  @override
  State<BusStatusScreen> createState() => _BusStatusScreenState();
}

class _BusStatusScreenState extends State<BusStatusScreen> {
  bool isBusAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Tracking Status'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.directions_bus,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bus Number: 25',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Text(
              isBusAvailable ? 'Status: Available' : 'Status: Not Available',
              style: TextStyle(
                fontSize: 20,
                color: isBusAvailable ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isBusAvailable = !isBusAvailable;
                });
              },
              child: const Text('Change Bus Status'),
            ),
          ],
        ),
      ),
    );
  }
}
