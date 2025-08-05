import 'package:flutter/material.dart';
import 'package:tomevio/theme/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isWide = MediaQuery.of(context).size.width >= 700;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // === HERO SECTION ===
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
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
                          theme.scaffoldBackgroundColor,
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
                          theme.scaffoldBackgroundColor,
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
                          theme.scaffoldBackgroundColor,
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
                          theme.scaffoldBackgroundColor,
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
                          opacity: const AlwaysStoppedAnimation(0.8),
                        ),
                        SizedBox(height: 20),
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
                        FilledButton(
                          onPressed: () {
                            // Navigate to /search route or tab
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('[user auth soon to be done.]'),
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
                            "Get Started",
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // === FEATURES SECTION ===
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              children: [
                Text(
                  "Features",
                  style: serif(
                    fontSize: theme.textTheme.titleLarge?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: isWide ? 3 : 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3,
                  children: const [
                    FeatureCard(
                      title: "Book Search",
                      description:
                          "Find books and authors using the fast Tomevio API.",
                    ),
                    FeatureCard(
                      title: "Detailed Views",
                      description:
                          "Explore descriptions, author bios, and metadata.",
                    ),
                    FeatureCard(
                      title: "Responsive UI",
                      description:
                          "Seamless reading experience on desktop and mobile.",
                    ),
                  ],
                ),
              ],
            ),
          ),

          // === COMING SOON SECTION ===
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              children: [
                Text(
                  "Coming Soon",
                  style: serif(
                    fontSize: theme.textTheme.titleLarge?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text.rich(
                  TextSpan(
                    text:
                        "Login, personalized libraries, and reading progress sync are ",
                    children: [
                      TextSpan(
                        text: "Work in Progress (WIP).",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber[400],
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
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
