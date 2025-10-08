import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'providers/todo_provider.dart';
import 'theme_provider.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/login_screen.dart';
import 'pages/navigation_wrapper.dart';
import 'pages/media_gallery_page.dart';
import 'pages/media_player_page.dart';
import 'pages/theme_switch_page.dart';
import 'pages/provider_demo_page.dart';
import 'pages/todo_page.dart';
import 'pages/carousel_page.dart';
import 'pages/icon_demo_page.dart';
import 'pages/profile_card.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: const BusinessFormsApp(),
    ),
  );
}

class BusinessFormsApp extends StatelessWidget {
  const BusinessFormsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cat Grooming Navigation Demo',

      // Use ThemeMode for dynamic theme switching
      themeMode: themeProvider.currentTheme,

      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.light,
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(primary: Colors.teal),
      ),

      // Define all routes
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const NavigationWrapper(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
        '/media': (context) => const MediaGalleryPage(),
        '/player': (context) => const MediaPlayerPage(),
        '/theme': (context) => const ThemeSwitchPage(),
        '/providerDemo': (context) => const ProviderDemoPage(),
        '/todo': (context) => const TodoPage(),
        '/carousel': (context) => const CarouselPage(),
        '/iconDemo': (context) => const IconDemoPage(),
        '/profile': (context) => Scaffold(
              appBar: AppBar(title: const Text('Profile Card Demo')),
              body: const SingleChildScrollView(child: ProfileCard()),
            ),
      },
    );
  }
}
