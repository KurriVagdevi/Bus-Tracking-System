
import 'package:flutter/material.dart';

void main() {
  runApp(const BusCustomWidgetDemo());
}

class BusCustomWidgetDemo extends StatelessWidget {
  const BusCustomWidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Custom Widgets',
      home: const BusCustomWidgetScreen(),
    );
  }
}

class BusCustomWidgetScreen extends StatelessWidget {
  const BusCustomWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Tracking System'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Available Buses',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          BusInfoCard(
            busNumber: '25',
            busName: 'City Express',
            source: 'Uppal',
            destination: 'Secunderabad',
            status: 'Available',
          ),
          BusInfoCard(
            busNumber: '18',
            busName: 'Metro Link',
            source: 'Uppal',
            destination: 'Koti',
            status: 'On Time',
          ),
        ],
      ),
    );
  }
}

class BusInfoCard extends StatelessWidget {
  final String busNumber;
  final String busName;
  final String source;
  final String destination;
  final String status;

  const BusInfoCard({
    super.key,
    required this.busNumber,
    required this.busName,
    required this.source,
    required this.destination,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.directions_bus, size: 36, color: Colors.blue),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '$busName (Bus $busNumber)',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text('Source: $source'),
            Text('Destination: $destination'),
            const SizedBox(height: 8),
            Text(
              'Status: $status',
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
