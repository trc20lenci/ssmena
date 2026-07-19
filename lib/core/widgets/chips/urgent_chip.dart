import 'package:flutter/material.dart';

import '../../constants/app_spacing.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_radius.dart';
import '../../theme/text_styles.dart';

class UrgentChip extends StatelessWidget {
  const UrgentChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xxs),
      decoration: BoxDecoration(
        color: const Color(0x1FFF5A5F), // AppColors.danger @ ~12% opacity
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        'Срочно',
        style: AppTextStyles.caption.copyWith(color: AppColors.danger),
      ),
    );
  }
}
