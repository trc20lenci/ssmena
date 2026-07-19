import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class PermissionTemplate extends StatelessWidget {
  const PermissionTemplate({
    required this.icon,
    required this.title,
    required this.message,
    required this.onAllow,
    required this.onSkip,
    super.key,
  });

  final IconData icon;
  final String title;
  final String message;
  final VoidCallback onAllow;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Container(
                width: 88,
                height: 88,
                decoration: const BoxDecoration(color: AppColors.bgCard, shape: BoxShape.circle),
                child: Icon(icon, size: 36, color: AppColors.accent),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(title, style: AppTextStyles.heading1, textAlign: TextAlign.center),
              const SizedBox(height: AppSpacing.sm),
              Text(message, style: AppTextStyles.bodySm, textAlign: TextAlign.center),
              const Spacer(flex: 3),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: onAllow, child: const Text('Разрешить')),
              ),
              const SizedBox(height: AppSpacing.sm),
              TextButton(onPressed: onSkip, child: const Text('Не сейчас')),
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
