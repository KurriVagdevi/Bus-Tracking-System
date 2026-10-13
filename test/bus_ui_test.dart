import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Bus screen displays bus details',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: BusTestScreen()),
    );

    expect(find.text('Bus Tracking System'), findsOneWidget);
    expect(find.text('City Express'), findsOneWidget);
    expect(find.text('Bus Number: 25'), findsOneWidget);
    expect(find.text('Source: Uppal'), findsOneWidget);
    expect(find.text('Destination: Secunderabad'), findsOneWidget);
  });

  testWidgets('Button displays confirmation message',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: BusTestScreen()),
    );

    await tester.tap(find.text('View Bus Details'));
    await tester.pump();

    expect(find.text('Bus details selected!'), findsOneWidget);
  });
}

class BusTestScreen extends StatelessWidget {
  const BusTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bus Tracking System')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.directions_bus, size: 60),
            const Text('City Express'),
            const Text('Bus Number: 25'),
            const Text('Source: Uppal'),
            const Text('Destination: Secunderabad'),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Bus details selected!'),
                    duration: Duration(seconds: 30),
                  ),
                );
              },
              child: const Text('View Bus Details'),
            ),
          ],
        ),
      ),
    );
  }
}
