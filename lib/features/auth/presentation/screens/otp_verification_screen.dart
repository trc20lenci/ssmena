import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_limits.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../widgets/auth_scaffold.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _controllers = List.generate(AppLimits.otpLength, (_) => TextEditingController());
  final _focusNodes = List.generate(AppLimits.otpLength, (_) => FocusNode());

  bool get _isComplete => _controllers.every((c) => c.text.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Введите код',
      subtitle: 'Мы отправили код на ваш номер (демо — введите любые 6 цифр)',
      ctaLabel: 'Подтвердить',
      ctaEnabled: _isComplete,
      onCta: () => context.go(RouteNames.authRole),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(AppLimits.otpLength, (i) {
          return SizedBox(
            width: 44,
            height: 54,
            child: TextField(
              controller: _controllers[i],
              focusNode: _focusNodes[i],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              style: AppTextStyles.heading1,
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: AppColors.bgSurface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty && i < AppLimits.otpLength - 1) {
                  _focusNodes[i + 1].requestFocus();
                }
                setState(() {});
              },
            ),
          );
        }),
      ),
      secondaryAction: TextButton(
        onPressed: () {},
        child: const Text('Отправить код повторно'),
      ),
    );
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }
}
