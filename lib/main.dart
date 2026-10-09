
import 'package:flutter/material.dart';

void main() {
  runApp(const BusTrackingApp());
}

class BusTrackingApp extends StatelessWidget {
  const BusTrackingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Tracking System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

// WELCOME SCREEN
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Tracking System'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Icon(
                    Icons.directions_bus,
                    size: 100,
                    color: Colors.blue,
                  ),
                  const Positioned(
                    right: 0,
                    top: 0,
                    child: Icon(
                      Icons.location_on,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to Bus Tracking System',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.login),
                label: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// LOGIN SCREEN WITH VALIDATION
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  String? errorMessage;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    String? message;

    if (email.isEmpty || password.isEmpty) {
      message = 'Please enter email and password.';
    } else if (!email.contains('@') || !email.contains('.')) {
      message = 'Please enter a valid email address.';
    } else if (password.length < 6) {
      message = 'Password must be at least 6 characters.';
    }

    setState(() {
      errorMessage = message;
    });

    if (message != null) return;

    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_circle,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 25),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              if (errorMessage != null)
                Text(
                  errorMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: login,
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// HOME SCREEN
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Tracking - Home'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: const [
                  Icon(
                    Icons.directions_bus,
                    size: 60,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Choose an option below'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(
              Icons.location_searching,
              color: Colors.blue,
            ),
            title: const Text('Track Bus'),
            subtitle: const Text('View bus tracking information'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const TrackBusScreen(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.schedule,
              color: Colors.orange,
            ),
            title: const Text('Bus Schedule'),
            subtitle: const Text('View bus timings and routes'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const ScheduleScreen(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.location_on,
              color: Colors.red,
            ),
            title: const Text('Bus Stops'),
            subtitle: const Text('View available bus stops'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const BusStopsScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// TRACK BUS SCREEN
class TrackBusScreen extends StatelessWidget {
  const TrackBusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Bus'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.directions_bus,
                  size: 80,
                  color: Colors.blue,
                ),
                SizedBox(height: 16),
                Text(
                  'Bus Number: 101',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text('Route: Uppal - Ameerpet'),
                SizedBox(height: 10),
                Text('Status: On Route'),
                SizedBox(height: 16),
                Text(
                  'Live GPS tracking is not connected yet.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// BUS SCHEDULE SCREEN
class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Schedule'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(
                Icons.directions_bus,
                color: Colors.blue,
              ),
              title: Text('Bus 101'),
              subtitle: Text('Uppal - Ameerpet'),
              trailing: Text('8:00 AM'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.directions_bus,
                color: Colors.blue,
              ),
              title: Text('Bus 102'),
              subtitle: Text('Boduppal - Secunderabad'),
              trailing: Text('9:00 AM'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.directions_bus,
                color: Colors.blue,
              ),
              title: Text('Bus 103'),
              subtitle: Text('Nagole - Hyderabad'),
              trailing: Text('10:00 AM'),
            ),
          ),
        ],
      ),
    );
  }
}

// BUS STOPS SCREEN
class BusStopsScreen extends StatelessWidget {
  const BusStopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const stops = [
      'Uppal',
      'Nagole',
      'Ameerpet',
      'Secunderabad',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Stops'),
      ),
      body: ListView.builder(
        itemCount: stops.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: ListTile(
              leading: const Icon(
                Icons.location_on,
                color: Colors.red,
              ),
              title: Text(stops[index]),
              trailing: const Icon(Icons.place),
            ),
          );
        },
      ),
    );
  }
}