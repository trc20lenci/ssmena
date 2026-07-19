import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/text_styles.dart';
import '../widgets/auth_scaffold.dart';

enum _Role { worker, employer }

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  _Role? _selected;

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Как вы будете использовать SMENA?',
      ctaLabel: 'Продолжить',
      ctaEnabled: _selected != null,
      onCta: () {
        // TODO(auth-feature): persist _selected role once a real auth
        // provider exists. Both roles share the same Account Creation
        // screen per the phase-2 auth flow spec.
        context.go(RouteNames.accountCreation);
      },
      body: Column(
        children: [
          _RoleCard(
            icon: Icons.handyman_outlined,
            title: 'Я хочу выполнять задачи',
            subtitle: 'Находить подработку рядом и получать деньги за выполненные задачи',
            selected: _selected == _Role.worker,
            onTap: () => setState(() => _selected = _Role.worker),
          ),
          const SizedBox(height: AppSpacing.md),
          _RoleCard(
            icon: Icons.add_task_outlined,
            title: 'Мне нужна помощь',
            subtitle: 'Публиковать задачи и находить исполнителей рядом',
            selected: _selected == _Role.employer,
            onTap: () => setState(() => _selected = _Role.employer),
          ),
        ],
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(color: selected ? AppColors.accent : AppColors.border, width: selected ? 1.5 : 1),
        ),
        child: Row(
          children: [
            Icon(icon, color: selected ? AppColors.accent : AppColors.textSecondary, size: 28),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.heading3),
                  const SizedBox(height: 4),
                  Text(subtitle, style: AppTextStyles.bodySm),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
