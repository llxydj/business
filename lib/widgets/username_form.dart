import 'package:flutter/material.dart';
import '../services/local_data_service.dart';

class UsernameForm extends StatefulWidget {
  const UsernameForm({super.key});

  @override
  State<UsernameForm> createState() => _UsernameFormState();
}

class _UsernameFormState extends State<UsernameForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController trackingController = TextEditingController();
  final LocalDataService service = LocalDataService();

  @override
  void dispose() {
    trackingController.dispose();
    super.dispose();
  }

  void submitTracking() {
    if (formKey.currentState!.validate()) {
      final id = trackingController.text.trim();
      service.addDocument({
        'trackingId': id,
        'status': 'Created',
        'notes': 'Manual create via tracking form'
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Document tracking created: $id')),
      );
      trackingController.clear();
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
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Document Tracking — Enter Tracking ID',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: trackingController,
                decoration: const InputDecoration(
                    labelText: 'Tracking ID (e.g., DOC-1234)'),
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Please enter tracking ID';
                  }
                  if (val.trim().length < 3) {
                    return 'Tracking ID too short';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: submitTracking,
                  child: const Text('Create / Track')),
              const SizedBox(height: 8),
              const Text(
                'Stored Documents (recent):',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              ...service.getDocuments().reversed.take(3).map((d) {
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
