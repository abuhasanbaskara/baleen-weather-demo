import 'package:baleen_weather_app_test/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class ErrorMessageUtil {

  static String getErrorTitle(String? code, BuildContext context) {
    switch (code) {
      case '401':
        return AppLocalizations.of(context)!.unauthorized;
      case '404':
        return AppLocalizations.of(context)!.cityNotFound;
      case '500':
        return AppLocalizations.of(context)!.internalServerError;
      case 'No internet connection':
        return AppLocalizations.of(context)!.noInternet;
      default:
        return AppLocalizations.of(context)!.somethingWrong;
    }
  }

  static String getErrorMessage(String? code, BuildContext context) {
    switch (code) {
      case '401':
        return AppLocalizations.of(context)!.pleaseCheckApi;
      case '404':
        return AppLocalizations.of(context)!.tryUsingSimpler;
      case '500':
        return AppLocalizations.of(context)!.pleaseTryAgain;
      case 'No internet connection':
        return AppLocalizations.of(context)!.pleaseCheckInternet;
      default:
        return AppLocalizations.of(context)!.pleaseTryAgain;
    }
  }
}