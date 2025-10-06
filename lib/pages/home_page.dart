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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Grooming — Business Forms'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              // Proper logout: pop all routes and push login route
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
          ),
        ],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UsernameForm(),
              SizedBox(height: 20),
              LoginForm(),
              SizedBox(height: 20),
              MultiInputForm(),
              SizedBox(height: 20),
              RegistrationForm(),
              SizedBox(height: 20),
              DropdownForm(),
              SizedBox(height: 20),
              DateTimeForm(),
              SizedBox(height: 20),
              ControllerForm(),
              SizedBox(height: 20),
              ListSavingForm(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
