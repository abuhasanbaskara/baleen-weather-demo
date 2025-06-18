// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get settings => 'Settings';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get theme => 'Theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get search => 'Search...';

  @override
  String get fiveDayForecast => '5-DAY FORECAST';

  @override
  String get english => 'English';

  @override
  String get japanese => 'Japanese';

  @override
  String get refreshSuccess => 'Refresh Success';

  @override
  String get understood => 'Understood';

  @override
  String get locationDisabled => 'Location is disabled';

  @override
  String get pleaseEnableLocation => 'Please enable location services in settings to use this feature';

  @override
  String get later => 'Later';

  @override
  String get now => 'Now';

  @override
  String get myLocation => 'My Location';

  @override
  String get unauthorized => 'Unauthorized';

  @override
  String get cityNotFound => 'City Not Found';

  @override
  String get internalServerError => 'Internal Server Error';

  @override
  String get noInternet => 'No Internet Connection';

  @override
  String get somethingWrong => 'Something went wrong';

  @override
  String get pleaseCheckApi => 'Please check your API key or login credentials';

  @override
  String get tryUsingSimpler => 'Try using a simpler city name (ex: Tokyo)';

  @override
  String get pleaseTryAgain => 'Please try again later';

  @override
  String get pleaseCheckInternet => 'Please check your internet connection';

  @override
  String get searchTips => 'Please search city first to show the weather forecast\n(ex: Tokyo)';

  @override
  String get localTime => 'Local Time';
}
