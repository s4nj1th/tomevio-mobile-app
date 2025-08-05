import 'package:flutter/material.dart';
import 'package:tomevio/theme/styles.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/starryNightS.jpg',
                      fit: BoxFit.cover,
                      opacity: const AlwaysStoppedAnimation(0.8),
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
                          begin: Alignment.topCenter,
                          end: Alignment.center,
                        ),
                      ),
                    ),
                  ),
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
                          const SizedBox(height: 24),
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
                                  // TODO: Navigate to login screen
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
                              const SizedBox(width: 20),
                              FilledButton(
                                onPressed: () {
                                  // TODO: Navigate to signup screen
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
      ),
    );
  }
}
