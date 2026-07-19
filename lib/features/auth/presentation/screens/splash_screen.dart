import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/route_names.dart';
import '../../../../core/theme/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // TODO(auth-feature): check real session here and route straight to
    // the correct shell if already authenticated. For now this always
    // routes to onboarding (UI-only phase).
    Future.delayed(const Duration(milliseconds: 900), () {
      if (mounted) context.go(RouteNames.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('SMENA', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28)),
      ),
    );
  }
}
