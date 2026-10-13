import 'package:flutter/material.dart';

void main() {
  runApp(const DebuggingDemo());
}

class DebuggingDemo extends StatelessWidget {
  const DebuggingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('DEBUG: Building Bus Tracking Demo');

    return MaterialApp(
      title: 'Debugging Demo',
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      home: const DebugHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DebugHomePage extends StatefulWidget {
  const DebugHomePage({super.key});

  @override
  State<DebugHomePage> createState() => _DebugHomePageState();
}

class _DebugHomePageState extends State<DebugHomePage> {
  int busCount = 2;

  void addBus() {
    setState(() {
      busCount++;
    });

    debugPrint('DEBUG: Bus count updated to $busCount');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Debugging Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.directions_bus, size: 70),
            const Text('Bus Tracking System',
                style: TextStyle(fontSize: 22)),
            const SizedBox(height: 12),
            Text('Number of buses: $busCount',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: addBus,
              child: const Text('Add Bus'),
            ),
            const SizedBox(height: 12),
            const Text('Debug messages appear in the terminal.'),
          ],
        ),
      ),
    );
  }
}
