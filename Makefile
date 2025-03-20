run:
	flutter run

get:
	flutter pub get

translate:
	dart run slang

build-mobile:
	make build-ios
	make build-android

build-ios:
	flutter build ipa

build-android:
	flutter build appbundle