import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AppBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        size: 24,
        color: AppColors.textPrimary,
      ),
      splashRadius: 24,
      onPressed: onPressed ?? () => Navigator.of(context).maybePop(),
    );
  }
}
