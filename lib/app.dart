import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/config/app_config.dart';
import 'core/theme/app_theme.dart';
import 'features/language/locale_controller.dart';
import 'features/splash/splash_screen.dart';
import 'l10n/app_localizations.dart';

class VpnApp extends StatelessWidget {
  const VpnApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeController = context.watch<LocaleController>();

    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      locale: localeController.locale,
      localizationsDelegates: AppL10n.localizationsDelegates,
      supportedLocales: AppL10n.supportedLocales,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        // Subsequent screens registered in their respective phases
      },
    );
  }
}
