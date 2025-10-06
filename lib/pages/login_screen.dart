import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // pushReplacement — replaces current screen
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Login (pushReplacement → Home)'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // push — keeps current screen in stack
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Try push() → Home'),
            ),
          ],
        ),
      ),
    );
  }
}
