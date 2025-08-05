import 'package:flutter/material.dart';

class NavScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const NavScaffold({super.key, required this.title, required this.body});

  void _navigateTo(BuildContext context, int index) {
    final destinations = ['/home', '/search', '/settings'];
    final routeName = destinations[index];

    if (ModalRoute.of(context)?.settings.name != routeName) {
      Navigator.pushReplacementNamed(context, routeName);
    } else {
      Navigator.pop(context); // just close drawer
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Center(
                child: Text(
                  'Tomevio',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => _navigateTo(context, 0),
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Search'),
              onTap: () => _navigateTo(context, 1),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => _navigateTo(context, 2),
            ),
          ],
        ),
      ),
      body: SafeArea(child: body),
    );
  }
}
