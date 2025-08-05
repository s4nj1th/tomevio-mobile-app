import 'package:flutter/material.dart';
import 'package:tomevio/theme/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final isWide = MediaQuery.of(context).size.width >= 700;

    return SizedBox.expand(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [Text("[idk what to put here as of now]")],
        ),
      ),
    );
  }
}
