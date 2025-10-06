import 'package:flutter/material.dart';

class ControllerForm extends StatefulWidget {
  const ControllerForm({super.key});

  @override
  State<ControllerForm> createState() => _ControllerFormState();
}

class _ControllerFormState extends State<ControllerForm> {
  final TextEditingController instructionsController = TextEditingController();
  String display = '';

  @override
  void dispose() {
    instructionsController.dispose();
    super.dispose();
  }

  void showInstructions() {
    setState(() {
      display = instructionsController.text.trim();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Instructions saved (demo)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Special Instructions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: instructionsController,
              decoration: const InputDecoration(
                  labelText: 'Enter instructions for cat makeover'),
              maxLines: 3,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: showInstructions,
              child: const Text('Save Instructions & Show'),
            ),
            const SizedBox(height: 8),
            Text('Current: $display'),
          ],
        ),
      ),
    );
  }
}
