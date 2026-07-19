import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../widgets/auth_scaffold.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final _controller = TextEditingController();
  bool get _isValid => _controller.text.trim().length == 9;

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Введите номер телефона',
      subtitle: 'Мы отправим код подтверждения',
      ctaLabel: 'Продолжить',
      ctaEnabled: _isValid,
      onCta: () => context.go(RouteNames.authOtp),
      body: Container(
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Text('+375', style: AppTextStyles.bodyLg.copyWith(color: AppColors.textSecondary)),
            const SizedBox(width: AppSpacing.sm),
            Container(width: 1, height: 24, color: AppColors.border),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.phone,
                maxLength: 9,
                style: AppTextStyles.bodyLg,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterText: '',
                  hintText: '29 123 45 67',
                ),
                onChanged: (_) => setState(() {}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
