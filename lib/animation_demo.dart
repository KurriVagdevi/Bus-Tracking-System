
import 'package:flutter/material.dart';

void main() {
  runApp(const BusAnimationDemo());
}

class BusAnimationDemo extends StatelessWidget {
  const BusAnimationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus Animation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const BusAnimationScreen(),
    );
  }
}

class BusAnimationScreen extends StatefulWidget {
  const BusAnimationScreen({super.key});

  @override
  State<BusAnimationScreen> createState() => _BusAnimationScreenState();
}

class _BusAnimationScreenState extends State<BusAnimationScreen> {
  double _busPosition = 0;

  void _moveBus() {
    setState(() {
      _busPosition = _busPosition == 0 ? 150 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Animation'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Watch the bus move!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      left: _busPosition,
                      top: 10,
                      child: const Icon(
                        Icons.directions_bus,
                        size: 70,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _moveBus,
                child: const Text('Move Bus'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
