import 'package:watchyy/i18n/i18n.dart';
import 'package:watchyy/singletons/singletons.dart';

Future<void> setup() async {
  await AppSharedPreferences().init();

  final currentLocale = AppSharedPreferences().locale;
  if (currentLocale != null) {
    await AppSharedPreferences().setLocale(currentLocale);
    LocaleSettings.setLocale(currentLocale);
  }
}
