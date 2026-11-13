import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text.dart';

class SectionBand extends StatelessWidget {
  final String? title;

  const SectionBand({super.key}) : title = null;

  const SectionBand.titled(String this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return Container(
        height: 8,
        color: AppColors.bgBand,
        width: double.infinity,
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 8,
          color: AppColors.bgBand,
        ),
        Container(
          height: 36,
          color: AppColors.bg,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerLeft,
          child: Text(
            title!,
            style: AppText.sectionHeader,
          ),
        ),
      ],
    );
  }
}
