import 'package:watchyy/i18n/i18n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKeys {
  final locale = 'locale';
  final localeInitialValue = 'en';
}

class AppSharedPreferences {
  static late SharedPreferences _instance;
  static AppLocale? _locale = AppLocale.en;

  Future<void> init() async {
    _instance = await SharedPreferences.getInstance();

    final sharedPreferencesKeys = AppSharedPreferences().sharedPreferencesKeys;

    final locale = instance.getString(sharedPreferencesKeys.locale) ??
        sharedPreferencesKeys.localeInitialValue;

    if (locale.isEmpty) {
      _locale = null;
    } else if (locale == 'en') {
      _locale = AppLocale.en;
    } else if (locale == 'fr') {
      _locale = AppLocale.fr;
    }
  }

  Future<void> setLocale(AppLocale appLocale) async {
    final sharedPreferencesKeys = AppSharedPreferences().sharedPreferencesKeys;
    var locale = 'en';

    if (appLocale == AppLocale.fr) {
      locale = 'fr';
    }
    await instance.setString(sharedPreferencesKeys.locale, locale);

    _locale = appLocale;
  }

  SharedPreferences get instance => _instance;
  AppLocale? get locale => _locale;

  SharedPreferencesKeys get sharedPreferencesKeys => SharedPreferencesKeys();
}
