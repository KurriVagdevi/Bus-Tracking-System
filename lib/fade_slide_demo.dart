
import 'package:flutter/material.dart';

void main() {
  runApp(const FadeSlideDemo());
}

class FadeSlideDemo extends StatelessWidget {
  const FadeSlideDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fade and Slide Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const FadeSlideScreen(),
    );
  }
}

class FadeSlideScreen extends StatefulWidget {
  const FadeSlideScreen({super.key});

  @override
  State<FadeSlideScreen> createState() => _FadeSlideScreenState();
}

class _FadeSlideScreenState extends State<FadeSlideScreen> {
  bool _showBus = false;

  void _playAnimation() {
    setState(() {
      _showBus = !_showBus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fade and Slide Animation'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bus Tracking System',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              AnimatedOpacity(
                opacity: _showBus ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: AnimatedSlide(
                  offset: _showBus
                      ? Offset.zero
                      : const Offset(0, 1),
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: const Icon(
                    Icons.directions_bus,
                    size: 100,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _playAnimation,
                child: Text(
                  _showBus ? 'Hide Bus' : 'Show Bus',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
