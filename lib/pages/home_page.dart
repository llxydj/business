import 'package:flutter/material.dart';
import '../widgets/username_form.dart';
import '../widgets/login_form.dart';
import '../widgets/multi_input_form.dart';
import '../widgets/registration_form.dart';
import '../widgets/dropdown_form.dart';
import '../widgets/date_time_form.dart';
import '../widgets/controller_form.dart';
import '../widgets/list_saving_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // This single scroll page shows all the forms in order so you can test each
    return Scaffold(
      appBar: AppBar(title: const Text('Cat Grooming — Business Forms')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              UsernameForm(), // Document tracking
              SizedBox(height: 20),
              LoginForm(), // Login (email+password)
              SizedBox(height: 20),
              MultiInputForm(), // Pet profile (text + checkbox + switch)
              SizedBox(height: 20),
              RegistrationForm(), // Registration (name,email,password,confirm)
              SizedBox(height: 20),
              DropdownForm(), // Select service (ordering)
              SizedBox(height: 20),
              DateTimeForm(), // Pick appointment date & time
              SizedBox(height: 20),
              ControllerForm(), // Special instructions (controller)
              SizedBox(height: 20),
              ListSavingForm(), // Save booking/order/document to local list
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
