import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("aaaa"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random();

    var activities = [
      {
        'name': "Trening",
        'color': Color.fromARGB(255, 151, 160, 54),
        'background': "assets/1.jpg"
      },
      {
        'name': "moedytacja",
        'color': Color.fromARGB(255, 255, 0, 0),
        'background': "assets/2.jpg"
      },
      {
        'name': "Joga",
        'color': Color.fromARGB(174, 31, 31, 115),
        'background': "assets/3.jpg"
      },
    ];

    var index = random.nextInt(activities.length);
    var activity = activities[index];

    return Scaffold(
        appBar: AppBar(
          title: Text(activity['name'] as String),
          backgroundColor: activity['color'] as Color,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(activity['background'] as String),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ),
        ));
  }
}
