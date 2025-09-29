import 'package:flutter/material.dart';
import '../services/local_data_service.dart';

class UsernameForm extends StatefulWidget {
  const UsernameForm({super.key});

  @override
  State<UsernameForm> createState() => _UsernameFormState();
}

class _UsernameFormState extends State<UsernameForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _trackingController = TextEditingController();
  final LocalDataService _service = LocalDataService();

  @override
  void dispose() {
    _trackingController.dispose();
    super.dispose();
  }

  void _submitTracking() {
    if (_formKey.currentState!.validate()) {
      final id = _trackingController.text.trim();
      // For demo: add as a simple document record
      _service.addDocument({
        'trackingId': id,
        'status': 'Created',
        'notes': 'Manual create via tracking form'
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Document tracking created: $id')),
      );
      _trackingController.clear();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Document Tracking — Enter Tracking ID',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _trackingController,
                decoration: const InputDecoration(
                    labelText: 'Tracking ID (e.g., DOC-1234)'),
                validator: (val) {
                  if (val == null || val.trim().isEmpty)
                    return 'Please enter tracking ID';
                  if (val.trim().length < 3) return 'Tracking ID too short';
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: _submitTracking,
                  child: const Text('Create / Track')),
              const SizedBox(height: 8),
              const Text('Stored Documents (recent):',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              ..._service.getDocuments().reversed.take(3).map((d) {
                return ListTile(
                  dense: true,
                  title: Text(d['trackingId'] ?? ''),
                  subtitle: Text('Status: ${d['status'] ?? ''}'),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
