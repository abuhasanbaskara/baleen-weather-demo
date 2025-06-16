import 'package:baleen_weather_app_test/utils/assets.dart';

class WeatherLottieUtil {

  static String getLottieAsset(int? code) {
    if (code == null) {
      return Assets.animationUnknown;
    }

    if (code >= 200 && code <= 232) {
      return Assets.thunderstorm;
    } else if (code >= 300 && code <= 321) {
      return Assets.rain;
    } else if (code >= 500 && code <= 531) {
      return Assets.rain;
    } else if (code >= 600 && code <= 622) {
      return Assets.snow;
    } else if (code == 800) {
      return Assets.clear;
    } else if (code >= 801 && code <= 804) {
      return Assets.cloud;
    } else {
      return Assets.defaultAtmosphere;
    }
  }

}
