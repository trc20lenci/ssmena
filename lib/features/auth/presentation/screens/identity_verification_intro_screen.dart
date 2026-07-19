import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../widgets/permission_template.dart';

class IdentityVerificationIntroScreen extends StatelessWidget {
  const IdentityVerificationIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionTemplate(
      icon: Icons.badge_outlined,
      title: 'Подтвердите личность',
      message:
          'Верифицированные пользователи получают больше доверия и приоритет в поиске. '
          'Это можно сделать позже в профиле.',
      onAllow: () => context.go(RouteNames.authSuccess),
      onSkip: () => context.go(RouteNames.authSuccess),
    );
  }
}
