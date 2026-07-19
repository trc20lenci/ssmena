import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../widgets/permission_template.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionTemplate(
      icon: Icons.location_on_outlined,
      title: 'Разрешите доступ к геолокации',
      message: 'Так мы сможем показывать задачи рядом с вами и точное расстояние до них.',
      onAllow: () => context.go(RouteNames.permissionNotification),
      onSkip: () => context.go(RouteNames.permissionNotification),
    );
  }
}
