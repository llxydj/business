import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart'; //
import 'home_page.dart';
import 'about_page.dart';
import 'contact_page.dart';
import 'shop_page.dart';

class NavigationWrapper extends StatefulWidget {
  const NavigationWrapper({super.key});

  @override
  State<NavigationWrapper> createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomePage(),
    AboutPage(),
    ContactPage(),
  ];

  void _onBottomTap(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cat Grooming Navigation'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat), text: 'Chats'),
              Tab(icon: Icon(Icons.star), text: 'Status'),
              Tab(icon: Icon(Icons.call), text: 'Calls'),
            ],
          ),
          actions: [
            //  Optional theme toggle icon in AppBar
            IconButton(
              icon: Icon(
                context.read<ThemeProvider>().isDarkMode
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              onPressed: () => context.read<ThemeProvider>().toggleTheme(),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.teal),
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),

              //  Home
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  setState(() => _selectedIndex = 0);
                  Navigator.pop(context);
                },
              ),

              //  About
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('About'),
                onTap: () {
                  setState(() => _selectedIndex = 1);
                  Navigator.pop(context);
                },
              ),

              //  Contact
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Contact'),
                onTap: () {
                  setState(() => _selectedIndex = 2);
                  Navigator.pop(context);
                },
              ),

              //  Shop
              ListTile(
                leading: const Icon(Icons.shop),
                title: const Text('Shop'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ShopPage()),
                  );
                },
              ),

              // Media Gallery
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Media Gallery'),
                onTap: () {
                  Navigator.pushNamed(context, '/media');
                },
              ),

              // Media Player
              ListTile(
                leading: const Icon(Icons.play_circle_fill),
                title: const Text('Media Player Demo'),
                onTap: () {
                  Navigator.pushNamed(context, '/player');
                },
              ),

              // Todo List
              ListTile(
                leading: const Icon(Icons.checklist),
                title: const Text('Todo List'),
                onTap: () {
                  Navigator.pushNamed(context, '/todo');
                },
              ),

              // Carousel
              ListTile(
                leading: const Icon(Icons.view_carousel),
                title: const Text('Image Carousel'),
                onTap: () {
                  Navigator.pushNamed(context, '/carousel');
                },
              ),

              // Icon Demo
              ListTile(
                leading: const Icon(Icons.star),
                title: const Text('Dynamic Icon Demo'),
                onTap: () {
                  Navigator.pushNamed(context, '/iconDemo');
                },
              ),

              // Profile Card
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('Profile Card'),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),

              // Provider Demo
              ListTile(
                leading: const Icon(Icons.code),
                title: const Text('Provider Demo'),
                onTap: () {
                  Navigator.pushNamed(context, '/providerDemo');
                },
              ),

              const Divider(),

              // Theme Switcher
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, _) {
                  return SwitchListTile(
                    title: const Text('Dark Mode'),
                    value: themeProvider.isDarkMode,
                    onChanged: (value) => themeProvider.toggleTheme(),
                    secondary: const Icon(Icons.brightness_6),
                  );
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _screens[_selectedIndex],
            const Center(child: Text('Status Tab Content')),
            const Center(child: Text('Calls Tab Content')),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onBottomTap,
          selectedItemColor: Colors.teal,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Contact',
            ),
          ],
        ),
      ),
    );
  }
}
