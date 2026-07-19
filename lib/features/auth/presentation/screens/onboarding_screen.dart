import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/text_styles.dart';

class _OnboardingPage {
  const _OnboardingPage(this.icon, this.title, this.subtitle);
  final IconData icon;
  final String title;
  final String subtitle;
}

const _pages = [
  _OnboardingPage(
    Icons.bolt_outlined,
    'Задачи рядом с тобой',
    'Помощь по дому, доставка, разовая подработка — уже сегодня.',
  ),
  _OnboardingPage(
    Icons.payments_outlined,
    'Оплата сразу после задачи',
    'Деньги поступают на кошелёк сразу после подтверждения выполнения.',
  ),
  _OnboardingPage(
    Icons.verified_user_outlined,
    'Проверенные пользователи',
    'Рейтинги и верификация — чтобы работать было безопасно.',
  ),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;

  void _next() {
    if (_page < _pages.length - 1) {
      _controller.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    } else {
      context.go(RouteNames.welcome);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: TextButton(
                  onPressed: () => context.go(RouteNames.welcome),
                  child: const Text('Пропустить'),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (i) => setState(() => _page = i),
                itemBuilder: (context, i) {
                  final page = _pages[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(page.icon, size: 64, color: AppColors.accent),
                        const SizedBox(height: AppSpacing.xxl),
                        Text(page.title, style: AppTextStyles.heading1, textAlign: TextAlign.center),
                        const SizedBox(height: AppSpacing.sm),
                        Text(page.subtitle, style: AppTextStyles.bodySm, textAlign: TextAlign.center),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (i) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i == _page ? AppColors.accent : AppColors.border,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xxl),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _next,
                  child: Text(_page == _pages.length - 1 ? 'Начать' : 'Далее'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
