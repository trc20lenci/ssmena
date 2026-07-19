import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

/// Generic success confirmation — reused at the end of the auth flow
/// now, and later for task completion / withdrawal success / etc.
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    this.title = 'Всё готово',
    this.message = 'Добро пожаловать в SMENA',
    this.destination = RouteNames.workerHome,
    super.key,
  });

  final String title;
  final String message;
  final String destination;

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
                child: const Icon(Icons.check, size: 40, color: AppColors.success),
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(title, style: AppTextStyles.heading1, textAlign: TextAlign.center),
              const SizedBox(height: AppSpacing.sm),
              Text(message, style: AppTextStyles.bodySm, textAlign: TextAlign.center),
              const Spacer(flex: 3),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go(destination),
                  child: const Text('Продолжить'),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
