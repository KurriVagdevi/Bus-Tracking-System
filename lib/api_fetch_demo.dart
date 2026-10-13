
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const BusApiDemo());
}

class BusApiDemo extends StatelessWidget {
  const BusApiDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bus API Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const BusApiScreen(),
    );
  }
}

class BusApiScreen extends StatefulWidget {
  const BusApiScreen({super.key});

  @override
  State<BusApiScreen> createState() => _BusApiScreenState();
}

class _BusApiScreenState extends State<BusApiScreen> {
  String _result = 'Press the button to fetch data.';
  bool _loading = false;

  Future<void> _fetchData() async {
    setState(() {
      _loading = true;
      _result = '';
    });

    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          _result = 'Post ID: ${data['id']}\n'
              'Title: ${data['title']}\n\n'
              'Body: ${data['body']}';
        });
      } else {
        setState(() {
          _result = 'Request failed: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _result = 'Error fetching data. Check your internet connection.\n$e';
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Fetch'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud_download,
                size: 70,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _loading ? null : _fetchData,
                child: const Text('Fetch API Data'),
              ),
              const SizedBox(height: 24),
              if (_loading)
                const CircularProgressIndicator()
              else
                SelectableText(
                  _result,
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
