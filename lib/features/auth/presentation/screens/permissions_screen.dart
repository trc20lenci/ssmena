import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../widgets/permission_template.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionTemplate(
      icon: Icons.shield_outlined,
      title: 'Ещё пара шагов',
      message: 'Нам нужно немного доступов, чтобы приложение работало быстро и удобно.',
      onAllow: () => context.go(RouteNames.permissionLocation),
      onSkip: () => context.go(RouteNames.permissionLocation),
    );
  }
}
