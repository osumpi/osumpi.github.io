import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:website/src/routes/main/main.dart';

import 'settings/settings_controller.dart';

class OsumPiWebsite extends StatelessWidget {
  const OsumPiWebsite({final Key? key, required final this.settingsController})
      : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(final BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (final context, final child) {
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
          // directory.
          onGenerateTitle: (final context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          onGenerateRoute: (final routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (final context) {
                return MainPage();
              },
            );
          },
        );
      },
    );
  }
}
