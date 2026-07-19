import 'package:flutter/material.dart';

import '../../constants/app_spacing.dart';
import '../../mock/mock_task.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_radius.dart';
import '../../theme/text_styles.dart';
import '../chips/urgent_chip.dart';

/// The single most important card in the app — money is the primary
/// visual hierarchy (payout first, largest, boldest), then distance
/// and time as secondary metadata. See product brief "Money is the
/// primary visual hierarchy."
class TaskCard extends StatelessWidget {
  const TaskCard({required this.task, required this.onTap, super.key});

  final MockTask task;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${task.payAmount.toStringAsFixed(0)} BYN', style: AppTextStyles.displayMd),
                const SizedBox(width: AppSpacing.xs),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text('/ заказ', style: AppTextStyles.caption),
                ),
                const Spacer(),
                if (task.isUrgent) const UrgentChip(),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(task.title, style: AppTextStyles.heading3),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                const Icon(Icons.schedule, size: 14, color: AppColors.textSecondary),
                const SizedBox(width: AppSpacing.xs),
                Text(task.timeLabel, style: AppTextStyles.bodySm),
                const SizedBox(width: AppSpacing.md),
                const Icon(Icons.place_outlined, size: 14, color: AppColors.textSecondary),
                const SizedBox(width: AppSpacing.xs),
                Text('${task.distanceKm.toStringAsFixed(1)} км', style: AppTextStyles.bodySm),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
