import 'dart:math';

import 'package:flutter/material.dart';

void main() {
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
    final randomInt = random.nextInt(3);

    // Jak dodasz const to się nie dowala edytor ;P
    final activityColors = [
      const Color.fromARGB(174, 31, 31, 115), //0
      const Color.fromARGB(255, 151, 160, 54), //1
      const Color.fromARGB(255, 255, 0, 0), //2
      const Color.fromARGB(255, 0, 255, 0), //2
    ];

    final activityNames = [
      "Trening",
      "Joga",
      "Taniec",
      "Medytacja"
    ];

    final activityImages = [
      "assets/1.jpg",
      "assets/2.jpg",
      "assets/3.jpg",
      "assets/4.jpg"
    ];

    var ourColor = activityColors[randomInt];
    var ourActivity = activityNames[randomInt];
    var ourBackground = activityImages[randomInt];

    return Scaffold(
        appBar: AppBar(
          title: Text(ourActivity),
          backgroundColor: ourColor,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ourBackground), fit: BoxFit.cover
            ),
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
