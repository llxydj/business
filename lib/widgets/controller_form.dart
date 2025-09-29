import 'package:flutter/material.dart';

class ControllerForm extends StatefulWidget {
  const ControllerForm({super.key});

  @override
  State<ControllerForm> createState() => _ControllerFormState();
}

class _ControllerFormState extends State<ControllerForm> {
  final TextEditingController _instructionsController = TextEditingController();
  String _display = '';

  @override
  void dispose() {
    _instructionsController.dispose();
    super.dispose();
  }

  void _show() {
    setState(() {
      _display = _instructionsController.text.trim();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Instructions saved (demo)')),
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
            const Text('Special Instructions',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _instructionsController,
              decoration: const InputDecoration(
                  labelText: 'Enter instructions for cat makeover'),
              maxLines: 3,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: _show,
                child: const Text('Save Instructions & Show')),
            const SizedBox(height: 8),
            Text('Current: $_display'),
          ],
        ),
      ),
    );
  }
}
