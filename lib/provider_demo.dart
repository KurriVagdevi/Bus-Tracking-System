
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BusStatusProvider(),
      child: const BusProviderDemo(),
    ),
  );
}

class BusStatusProvider extends ChangeNotifier {
  bool isAvailable = true;

  void toggleStatus() {
    isAvailable = !isAvailable;
    notifyListeners();
  }
}

class BusProviderDemo extends StatelessWidget {
  const BusProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Provider Demo',
      home: const BusProviderScreen(),
    );
  }
}

class BusProviderScreen extends StatelessWidget {
  const BusProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final busStatus = context.watch<BusStatusProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Tracking - Provider'),
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
            const SizedBox(height: 12),
            Text(
              busStatus.isAvailable
                  ? 'Status: Available'
                  : 'Status: Not Available',
              style: TextStyle(
                fontSize: 20,
                color: busStatus.isAvailable
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<BusStatusProvider>().toggleStatus();
              },
              child: const Text('Change Bus Status'),
            ),
          ],
        ),
      ),
    );
  }
}
