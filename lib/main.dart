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

bool isLoggedIn() {
  // Replace this with actual login logic or session check
  return false; // false = user not logged in (change to true to test NavScaffold)
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
      theme: _buildDarkTheme(),
      home: isLoggedIn() ? const NavScaffold() : const NotLoggedInScreen(),
    );
  }
}

// Placeholder screen if not logged in
class NotLoggedInScreen extends StatelessWidget {
  const NotLoggedInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final isWide = MediaQuery.of(context).size.width >= 700;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // === HERO SECTION ===
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background image (large)
                Positioned.fill(
                  child: Image.asset(
                    'assets/starryNightS.jpg',
                    fit: BoxFit.cover,
                    opacity: const AlwaysStoppedAnimation(0.8),
                  ),
                ),

                // Gradient overlays
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          theme.scaffoldBackgroundColor.withAlpha(32),
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          theme.scaffoldBackgroundColor.withAlpha(32),
                          Colors.transparent,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          theme.scaffoldBackgroundColor.withAlpha(32),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          theme.scaffoldBackgroundColor.withAlpha(32),
                          Colors.transparent,
                        ],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ),
                    ),
                  ),
                ),

                // Content
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/tomevio.png',
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 24),
                        Text(
                          "Build your personal library.\nKeep track of your friends' reads.\nNever lose a great book again.",
                          textAlign: TextAlign.center,
                          style: serif(
                            fontSize: theme.textTheme.headlineSmall?.fontSize,
                            fontWeight: FontWeight.bold,
                            color: theme.textTheme.headlineSmall?.color,
                            shadows: const [
                              Shadow(
                                color: Colors.black54,
                                offset: Offset(0, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FilledButton(
                              onPressed: () {
                                // Navigate to /search route or tab
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      '[user auth soon to be done.]',
                                    ),
                                  ),
                                );
                              },
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                  horizontal: 28,
                                ),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                            ),
                            SizedBox(width: 20),
                            FilledButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      '[user auth soon to be done.]',
                                    ),
                                  ),
                                );
                              },
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                  horizontal: 28,
                                ),
                                backgroundColor: theme.colorScheme.onSurface,
                                foregroundColor: theme.colorScheme.surface,
                              ),
                              child: const Text(
                                "Sign up",
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String description;

  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: serif(
                fontSize: theme.textTheme.titleMedium?.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(190),
              ),
            ),
          ],
        ),
      ),
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
            fontSize: 24,
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
              height: 240,
              child: DrawerHeader(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: 42, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'your name',
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

              return Container(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
                decoration: const BoxDecoration(),
                child: ListTile(
                  leading: Icon(item['icon']),
                  title: Text(item['navText']),
                  selected: _selectedIndex == index,
                  selectedTileColor: Theme.of(
                    context,
                  ).colorScheme.surfaceBright,
                  selectedColor: Theme.of(context).colorScheme.onSurface,
                  onTap: () => _onItemTapped(index),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
