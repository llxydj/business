import 'package:flutter/material.dart';

class MultiInputForm extends StatefulWidget {
  const MultiInputForm({super.key});

  @override
  State<MultiInputForm> createState() => _MultiInputFormState();
}

class _MultiInputFormState extends State<MultiInputForm> {
  final _formKey = GlobalKey<FormState>();
  final _petNameController = TextEditingController();
  String _breed = '';
  int _age = 1;
  bool _vaccinated = false;
  bool _hasSubscription = false;

  @override
  void dispose() {
    _petNameController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Pet saved: ${_petNameController.text} (Breed: $_breed, Age: $_age)')),
      );
      // You could pass this data to a service or next form
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
              const Text('Pet Profile',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _petNameController,
                decoration: const InputDecoration(labelText: 'Pet Name'),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Enter pet name' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Breed'),
                onSaved: (v) => _breed = v?.trim() ?? '',
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Enter breed' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Age (years)'),
                keyboardType: TextInputType.number,
                initialValue: '1',
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Enter age';
                  final n = int.tryParse(v);
                  if (n == null || n < 0) return 'Enter valid age';
                  return null;
                },
                onSaved: (v) => _age = int.tryParse(v ?? '1') ?? 1,
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Vaccinated'),
                value: _vaccinated,
                onChanged: (v) => setState(() => _vaccinated = v ?? false),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Active Grooming Subscription'),
                value: _hasSubscription,
                onChanged: (v) => setState(() => _hasSubscription = v),
              ),
              ElevatedButton(
                  onPressed: _saveProfile,
                  child: const Text('Save Pet Profile')),
            ],
          ),
        ),
      ),
    );
  }
}
