import 'package:baleen_weather_app_test/utils/app_strings.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception(AppStrings.locationServiceDisabled);
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception(AppStrings.locationPermissionDenied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          AppStrings.locationPermissionDeniedForever);
    }

    // Return the current position
    return await Geolocator.getCurrentPosition();
  }
}
