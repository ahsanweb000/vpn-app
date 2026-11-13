import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class FlagCircle extends StatelessWidget {
  final String? countryCode;
  final double size;

  const FlagCircle({
    super.key,
    required this.countryCode,
    this.size = 28.0,
  });

  @override
  Widget build(BuildContext context) {
    final String? code = countryCode?.trim();
    final bool hasValidCode = code != null &&
        code.length == 2 &&
        FlagCode.fromCountryCode(code) != null;

    if (!hasValidCode) {
      return Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          color: AppColors.surfaceHigh,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.public,
            size: size * 0.6,
            color: AppColors.textSecondary,
          ),
        ),
      );
    }

    return SizedBox(
      width: size,
      height: size,
      child: CountryFlag.fromCountryCode(
        code,
        theme: ImageTheme(
          width: size,
          height: size,
          shape: const Circle(),
        ),
      ),
    );
  }
}
