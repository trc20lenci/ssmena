import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/text_styles.dart';

/// Shared layout for the auth/onboarding flow: optional back button,
/// title/subtitle, a body slot, and a CTA pinned to the bottom safe
/// area. Keeps the 12 auth screens visually consistent without
/// duplicating the same Scaffold/padding/button boilerplate.
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    required this.title,
    required this.ctaLabel,
    required this.onCta,
    this.subtitle,
    this.body,
    this.showBackButton = true,
    this.ctaEnabled = true,
    this.secondaryAction,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? body;
  final String ctaLabel;
  final VoidCallback? onCta;
  final bool showBackButton;
  final bool ctaEnabled;
  final Widget? secondaryAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showBackButton ? AppBar() : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.lg),
              Text(title, style: AppTextStyles.heading1),
              if (subtitle != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Text(subtitle!, style: AppTextStyles.bodySm),
              ],
              const SizedBox(height: AppSpacing.xl),
              if (body != null) Expanded(child: body!) else const Spacer(),
              ElevatedButton(
                onPressed: ctaEnabled ? onCta : null,
                child: Text(ctaLabel),
              ),
              if (secondaryAction != null) ...[
                const SizedBox(height: AppSpacing.sm),
                secondaryAction!,
              ],
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
