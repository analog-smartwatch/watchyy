import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:watchyy/i18n/i18n.dart';
import 'package:watchyy/locations/locations.dart';
import 'package:watchyy/providers/providers.dart';
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
    final product = ref.watch(productConnectionNotifier);
    final routerConfig =
        product != null ? getRouter() : getNotConnectedRouter();

    return MediaQuery.withClampedTextScaling(
      minScaleFactor: 0.7,
      maxScaleFactor: 2,
      child: MaterialApp.router(
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        routerConfig: routerConfig,
        debugShowCheckedModeBanner: false,
        theme: lightThemeData,
        darkTheme: darkThemeData,
        builder: (context, child) {
          final theme = Theme.of(context);
          final textTheme = theme.textTheme;
          final textColor = theme.colorScheme.onSurface;

          return AppTheme(
            data: AppThemeData(
              appTypography: AppTypography(
                bodyLarge: textTheme.bodyLarge!.copyWith(color: textColor),
                bodyMedium: textTheme.bodyMedium!.copyWith(color: textColor),
                bodySmall: textTheme.bodySmall!.copyWith(color: textColor),
                headlineLarge:
                    textTheme.headlineLarge!.copyWith(color: textColor),
                headlineMedium:
                    textTheme.headlineMedium!.copyWith(color: textColor),
                headlineSmall:
                    textTheme.headlineSmall!.copyWith(color: textColor),
                titleLarge: textTheme.titleLarge!.copyWith(color: textColor),
                titleMedium: textTheme.titleMedium!.copyWith(color: textColor),
                titleSmall: textTheme.titleSmall!.copyWith(color: textColor),
              ),
            ),
            child: child!,
          );
        },
      ),
    );
  }
}
