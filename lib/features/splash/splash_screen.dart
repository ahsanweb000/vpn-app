import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/world_dots.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bg,
      body: Center(
        child: WorldDots(opacity: 0.06),
      ),
    );
  }
}
