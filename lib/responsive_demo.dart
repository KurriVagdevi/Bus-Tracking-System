
import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveBusApp());
}

class ResponsiveBusApp extends StatelessWidget {
  const ResponsiveBusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bus Tracking System'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 600;

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: isWide
                      ? Row(
                          children: [
                            Expanded(child: busInfoCard()),
                            const SizedBox(width: 16),
                            Expanded(child: routeInfoCard()),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            busInfoCard(),
                            const SizedBox(height: 16),
                            routeInfoCard(),
                          ],
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget busInfoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.directions_bus, size: 60, color: Colors.blue),
            SizedBox(height: 12),
            Text(
              'City Express',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text('Bus Number: 25'),
          ],
        ),
      ),
    );
  }

  Widget routeInfoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.route, size: 45, color: Colors.green),
            SizedBox(height: 12),
            Text('Source: Uppal'),
            Text('Destination: Secunderabad'),
            Text('Status: On time'),
          ],
        ),
      ),
    );
  }
}
