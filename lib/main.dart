import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'
    hide Provider, StreamProvider;
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:watchyy/ble/ble.dart';
import 'package:watchyy/i18n/i18n.dart';
import 'package:watchyy/locations/locations.dart';
import 'package:watchyy/providers/providers.dart';
import 'package:watchyy/setup.dart';
import 'package:watchyy/styles/styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await setup();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final ble = FlutterReactiveBle();
  final bleLogger = BleLogger(ble: ble);
  final scanner = BleScanner(ble: ble, logMessage: bleLogger.addToLog);
  final monitor = BleStatusMonitor(ble);
  final connector = BleDeviceConnector(
    ble: ble,
    logMessage: bleLogger.addToLog,
  );
  final serviceDiscoverer = BleDeviceInteractor(
    bleDiscoverServices: (deviceId) async {
      await ble.discoverAllServices(deviceId);
      return ble.getDiscoveredServices(deviceId);
    },
    logMessage: bleLogger.addToLog,
    readRssi: ble.readRssi,
  );

  final app = runApp(
    TranslationProvider(
      child: ProviderScope(
        child: MultiProvider(
          providers: [
            Provider.value(value: scanner),
            Provider.value(value: monitor),
            Provider.value(value: connector),
            Provider.value(value: serviceDiscoverer),
            Provider.value(value: bleLogger),
            StreamProvider<BleScannerState?>(
              create: (_) => scanner.state,
              initialData: const BleScannerState(
                discoveredDevices: [],
                scanIsInProgress: false,
              ),
            ),
            StreamProvider<BleStatus?>(
              create: (_) => monitor.state,
              initialData: BleStatus.unknown,
            ),
            StreamProvider<ConnectionStateUpdate>(
              create: (_) => connector.state,
              initialData: const ConnectionStateUpdate(
                deviceId: 'Unknown device',
                connectionState: DeviceConnectionState.disconnected,
                failure: null,
              ),
            ),
          ],
          child: const App(),
        ),
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
        product != null ? getRouter() : getNotConnectedRouter(context);

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
