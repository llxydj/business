import 'package:flutter/material.dart';

class DropdownForm extends StatefulWidget {
  const DropdownForm({super.key});

  @override
  State<DropdownForm> createState() => _DropdownFormState();
}

class _DropdownFormState extends State<DropdownForm> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedRole;

  // ✅ Just use a list instead of Map since you don’t need prices
  final List<String> roles = ['Admin', 'User', 'Guest'];

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Role selected: $_selectedRole')),
      );
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
              const Text(
                'Select Role',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedRole,
                decoration: const InputDecoration(labelText: 'Role'),
                items: roles
                    .map((role) => DropdownMenuItem(
                          value: role,
                          child: Text(role),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _selectedRole = value),
                validator: (value) =>
                    value == null ? 'Please select a role' : null,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Confirm Role'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
