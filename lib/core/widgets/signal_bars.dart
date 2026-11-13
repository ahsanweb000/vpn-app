import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class SignalBars extends StatelessWidget {
  final int? level;

  const SignalBars({
    super.key,
    this.level,
  });

  @override
  Widget build(BuildContext context) {
    const List<double> heights = [5.0, 8.0, 11.0];

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(3, (index) {
        final Color barColor;
        if (level == null) {
          barColor = AppColors.textMuted;
        } else if (index < level!) {
          barColor = AppColors.success;
        } else {
          barColor = AppColors.divider;
        }

        return Container(
          margin: EdgeInsets.only(right: index < 2 ? 2.0 : 0.0),
          width: 3.0,
          height: heights[index],
          decoration: BoxDecoration(
            color: barColor,
            borderRadius: BorderRadius.circular(1.0),
          ),
        );
      }),
    );
  }
}
