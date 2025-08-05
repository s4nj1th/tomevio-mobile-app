import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomevio/screens/profile_screen.dart';
import 'package:tomevio/theme/styles.dart';

import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class NavScreen {
  final String navText;
  final Widget screen;

  const NavScreen({required this.navText, required this.screen});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _buildDarkTheme() {
    const background = Color(0xFF101010);
    const backgroundSecondary = Color(0xFF181818);
    const foreground = Color(0xFFefefef);
    const foregroundDim = Color(0xFFcdcdcd);
    const border = Color(0xFF2b2b2b);
    const primary = Color(0xFF9e76f5);
    const surface = Color(0xFF1f1f1f);

    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      canvasColor: backgroundSecondary,
      fontFamily: GoogleFonts.averiaSerifLibre().fontFamily,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: foregroundDim,
        surface: surface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: foreground,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundSecondary,
        foregroundColor: foreground,
        elevation: 0,
      ),
      drawerTheme: const DrawerThemeData(backgroundColor: backgroundSecondary),
      textTheme: GoogleFonts.atkinsonHyperlegibleTextTheme(
        ThemeData.dark().textTheme,
      ),
      dividerColor: border,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tomevio',
      // debugShowCheckedModeBanner: false,
      theme: _buildDarkTheme(),
      home: const NavScaffold(),
    );
  }
}

class NavScaffold extends StatefulWidget {
  const NavScaffold({super.key});

  @override
  State<NavScaffold> createState() => _NavScaffoldState();
}

class _NavScaffoldState extends State<NavScaffold> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.home, 'screen': const HomeScreen(), 'navText': 'Home'},
    {'icon': Icons.search, 'screen': const SearchScreen(), 'navText': 'Search'},
    {
      'icon': Icons.person,
      'screen': const ProfileScreen(),
      'navText': 'Profile',
    },
    {
      'icon': Icons.settings,
      'screen': const SettingsScreen(),
      'navText': 'Settings',
    },
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final currentScreen = _navItems[_selectedIndex];
    final navText = currentScreen['navText'];
    final screen = currentScreen['screen'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          navText,
          style: serif(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: SafeArea(child: screen),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 200,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceBright,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: 32, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '[you will have your name here]',
                            style: serif(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ..._navItems.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;

              return ListTile(
                leading: Icon(item['icon']),
                title: Text(item['navText']),
                selected: _selectedIndex == index,
                selectedTileColor: Theme.of(context).colorScheme.surfaceBright,
                selectedColor: Theme.of(context).colorScheme.onSurface,
                onTap: () => _onItemTapped(index),
              );
            }),
          ],
        ),
      ),
    );
  }
}
