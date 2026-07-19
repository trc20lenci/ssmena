import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../widgets/permission_template.dart';

class NotificationPermissionScreen extends StatelessWidget {
  const NotificationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionTemplate(
      icon: Icons.notifications_outlined,
      title: 'Включите уведомления',
      message: 'Мы сообщим, когда откликнутся на вашу задачу или её примут.',
      onAllow: () => context.go(RouteNames.identityIntro),
      onSkip: () => context.go(RouteNames.identityIntro),
    );
  }
}
