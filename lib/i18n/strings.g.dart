/// Generated file. Do not edit.
///
/// Original: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 34 (17 per locale)
///
/// Built on 2025-03-21 at 21:46 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	fr(languageCode: 'fr', build: _StringsFr.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsGeneralEn general = _StringsGeneralEn._(_root);
	late final _StringsScreensEn screens = _StringsScreensEn._(_root);
}

// Path: general
class _StringsGeneralEn {
	_StringsGeneralEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsGeneralBottomNavigationEn bottom_navigation = _StringsGeneralBottomNavigationEn._(_root);
	String get try_again => 'Try again';
}

// Path: screens
class _StringsScreensEn {
	_StringsScreensEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsScreensMyWatchesEn my_watches = _StringsScreensMyWatchesEn._(_root);
	late final _StringsScreensHomeEn home = _StringsScreensHomeEn._(_root);
	late final _StringsScreensSettingsEn settings = _StringsScreensSettingsEn._(_root);
	late final _StringsScreensScanningEn scanning = _StringsScreensScanningEn._(_root);
}

// Path: general.bottom_navigation
class _StringsGeneralBottomNavigationEn {
	_StringsGeneralBottomNavigationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get home => 'Home';
	String get settings => 'Settings';
}

// Path: screens.my_watches
class _StringsScreensMyWatchesEn {
	_StringsScreensMyWatchesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My Watches';
	String get button_add_watch => 'Add watch';
	String get info_no_watch_linked => 'No watch linked yet';
}

// Path: screens.home
class _StringsScreensHomeEn {
	_StringsScreensHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String battery_level({required Object level}) => 'Battery ${level}%';
}

// Path: screens.settings
class _StringsScreensSettingsEn {
	_StringsScreensSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	String get info => 'Info';
	String get firmware_version => 'Firmware version';
}

// Path: screens.scanning
class _StringsScreensScanningEn {
	_StringsScreensScanningEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Scanning';
	String get nothing_found => 'Nothing found';
	String get stop_scan => 'Stop scan';
	String get cannot_find_anything => 'Couldn’t find anything';
	String get around_me => 'Around me';
	String get new_scan => 'New scan';
	String get found => 'Found';
}

// Path: <root>
class _StringsFr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsFr _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsGeneralFr general = _StringsGeneralFr._(_root);
	@override late final _StringsScreensFr screens = _StringsScreensFr._(_root);
}

// Path: general
class _StringsGeneralFr implements _StringsGeneralEn {
	_StringsGeneralFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override late final _StringsGeneralBottomNavigationFr bottom_navigation = _StringsGeneralBottomNavigationFr._(_root);
	@override String get try_again => 'Réessayer';
}

// Path: screens
class _StringsScreensFr implements _StringsScreensEn {
	_StringsScreensFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override late final _StringsScreensMyWatchesFr my_watches = _StringsScreensMyWatchesFr._(_root);
	@override late final _StringsScreensHomeFr home = _StringsScreensHomeFr._(_root);
	@override late final _StringsScreensSettingsFr settings = _StringsScreensSettingsFr._(_root);
	@override late final _StringsScreensScanningFr scanning = _StringsScreensScanningFr._(_root);
}

// Path: general.bottom_navigation
class _StringsGeneralBottomNavigationFr implements _StringsGeneralBottomNavigationEn {
	_StringsGeneralBottomNavigationFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Accueil';
	@override String get settings => 'Paramètres';
}

// Path: screens.my_watches
class _StringsScreensMyWatchesFr implements _StringsScreensMyWatchesEn {
	_StringsScreensMyWatchesFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mes montres';
	@override String get button_add_watch => 'Ajouter montre';
	@override String get info_no_watch_linked => 'Aucune montre n\'est encore liée';
}

// Path: screens.home
class _StringsScreensHomeFr implements _StringsScreensHomeEn {
	_StringsScreensHomeFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String battery_level({required Object level}) => 'Batterie ${level}%';
}

// Path: screens.settings
class _StringsScreensSettingsFr implements _StringsScreensSettingsEn {
	_StringsScreensSettingsFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paramètres';
	@override String get info => 'Info';
	@override String get firmware_version => 'Version logiciel';
}

// Path: screens.scanning
class _StringsScreensScanningFr implements _StringsScreensScanningEn {
	_StringsScreensScanningFr._(this._root);

	@override final _StringsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Scan en cours';
	@override String get nothing_found => 'Rien trouvé';
	@override String get stop_scan => 'Arrêter le scan';
	@override String get cannot_find_anything => 'Rien n\'a été trouvé';
	@override String get around_me => 'Autour de moi';
	@override String get new_scan => 'Nouveau scan';
	@override String get found => 'Trouvé';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'general.bottom_navigation.home': return 'Home';
			case 'general.bottom_navigation.settings': return 'Settings';
			case 'general.try_again': return 'Try again';
			case 'screens.my_watches.title': return 'My Watches';
			case 'screens.my_watches.button_add_watch': return 'Add watch';
			case 'screens.my_watches.info_no_watch_linked': return 'No watch linked yet';
			case 'screens.home.battery_level': return ({required Object level}) => 'Battery ${level}%';
			case 'screens.settings.title': return 'Settings';
			case 'screens.settings.info': return 'Info';
			case 'screens.settings.firmware_version': return 'Firmware version';
			case 'screens.scanning.title': return 'Scanning';
			case 'screens.scanning.nothing_found': return 'Nothing found';
			case 'screens.scanning.stop_scan': return 'Stop scan';
			case 'screens.scanning.cannot_find_anything': return 'Couldn’t find anything';
			case 'screens.scanning.around_me': return 'Around me';
			case 'screens.scanning.new_scan': return 'New scan';
			case 'screens.scanning.found': return 'Found';
			default: return null;
		}
	}
}

extension on _StringsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'general.bottom_navigation.home': return 'Accueil';
			case 'general.bottom_navigation.settings': return 'Paramètres';
			case 'general.try_again': return 'Réessayer';
			case 'screens.my_watches.title': return 'Mes montres';
			case 'screens.my_watches.button_add_watch': return 'Ajouter montre';
			case 'screens.my_watches.info_no_watch_linked': return 'Aucune montre n\'est encore liée';
			case 'screens.home.battery_level': return ({required Object level}) => 'Batterie ${level}%';
			case 'screens.settings.title': return 'Paramètres';
			case 'screens.settings.info': return 'Info';
			case 'screens.settings.firmware_version': return 'Version logiciel';
			case 'screens.scanning.title': return 'Scan en cours';
			case 'screens.scanning.nothing_found': return 'Rien trouvé';
			case 'screens.scanning.stop_scan': return 'Arrêter le scan';
			case 'screens.scanning.cannot_find_anything': return 'Rien n\'a été trouvé';
			case 'screens.scanning.around_me': return 'Autour de moi';
			case 'screens.scanning.new_scan': return 'Nouveau scan';
			case 'screens.scanning.found': return 'Trouvé';
			default: return null;
		}
	}
}
