import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/auth_scaffold.dart';

class AccountCreationScreen extends StatefulWidget {
  const AccountCreationScreen({super.key});

  @override
  State<AccountCreationScreen> createState() => _AccountCreationScreenState();
}

class _AccountCreationScreenState extends State<AccountCreationScreen> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Расскажите о себе',
      subtitle: 'Это увидят другие пользователи',
      ctaLabel: 'Продолжить',
      ctaEnabled: _nameController.text.trim().isNotEmpty,
      onCta: () => context.go(RouteNames.permissions),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.bgCard,
              child: const Icon(Icons.add_a_photo_outlined, color: AppColors.textSecondary),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Имя'),
            onChanged: (_) => setState(() {}),
          ),
        ],
      ),
    );
  }
}
