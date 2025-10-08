import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart'; //

class ThemeSwitchPage extends StatelessWidget {
  const ThemeSwitchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switcher'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SwitchListTile(
          title: const Text('Dark Mode'),
          value: themeProvider.isDarkMode,
          onChanged: (_) => themeProvider.toggleTheme(),
        ),
      ),
    );
  }
}
