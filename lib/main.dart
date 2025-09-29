import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const BusinessFormsApp());
}

class BusinessFormsApp extends StatelessWidget {
  const BusinessFormsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Grooming - Business Forms',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: const HomePage(),
    );
  }
}
