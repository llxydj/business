import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Page')),
      body: const Center(
        child: Text(
          'About Cat Grooming App — Activity 4 Demo',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
