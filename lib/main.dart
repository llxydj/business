import 'package:flutter/material.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/login_screen.dart';
import 'pages/navigation_wrapper.dart';

void main() {
  runApp(const BusinessFormsApp());
}

class BusinessFormsApp extends StatelessWidget {
  const BusinessFormsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Grooming Navigation Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const NavigationWrapper(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}
