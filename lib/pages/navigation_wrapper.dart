import 'package:flutter/material.dart';
import 'home_page.dart';
import 'about_page.dart';
import 'contact_page.dart';

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
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.teal),
                child: Text('Menu',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  setState(() => _selectedIndex = 0);
                  Navigator.pop(context); // closes drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('About'),
                onTap: () {
                  setState(() => _selectedIndex = 1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Contact'),
                onTap: () {
                  setState(() => _selectedIndex = 2);
                  Navigator.pop(context);
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
                icon: Icon(Icons.settings), label: 'Contact'),
          ],
        ),
      ),
    );
  }
}
