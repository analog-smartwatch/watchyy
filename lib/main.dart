import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:watchyy/i18n/i18n.dart';
import 'package:watchyy/locations/locations.dart';
import 'package:watchyy/singletons/singletons.dart';
import 'package:watchyy/styles/styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await AppSharedPreferences().init();

  final currentLocale = AppSharedPreferences().locale;
  if (currentLocale != null) {
    await AppSharedPreferences().setLocale(currentLocale);
    LocaleSettings.setLocale(currentLocale);
  }

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final app = runApp(
    TranslationProvider(
      child: const ProviderScope(
        child: App(),
      ),
    ),
  );

  if (!kDebugMode) {
    return SentryFlutter.init(
      (options) {
        options
          ..dsn = 'dsn'
          ..tracesSampleRate = 1.0;
      },
      appRunner: () => app,
    );
  } else {
    return app;
  }
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MediaQuery.withClampedTextScaling(
      minScaleFactor: 0.7,
      maxScaleFactor: 2,
      child: MaterialApp.router(
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        // routerConfig: getNotConnectedRouter(context),
        routerConfig: getRouter(),
        debugShowCheckedModeBanner: false,
        theme: lightThemeData,
        darkTheme: darkThemeData,
      ),
    );
  }
}
