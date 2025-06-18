import 'package:baleen_weather_app_test/services/location_service.dart';
import 'package:baleen_weather_app_test/utils/app_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';

class LocationRepository {
  final LocationService _locationService = LocationService();
  final Logger _logger = Logger();

  Future<Position?> getCurrentLocation() async {
    try {
      Position position = await _locationService.determinePosition();
      return position;
    } catch (e) {
      if (kDebugMode) {
        _logger.e("${AppStrings.errorGettingLocation} $e");
      }

      if (e.toString().contains(AppStrings.denied) || e.toString().contains(AppStrings.disabled)) {
        rethrow;
      }
      return null;
    }
  }

  Future<String?> getLatitude() async {
    try {
      Position? position = await getCurrentLocation();
      return position?.latitude.toString();
    } catch (e) {
      if (kDebugMode) {
        _logger.e("${AppStrings.errorGettingLatitude} $e");
      }
      return null;
    }
  }

  Future<String?> getLongitude() async {
    try {
      Position? position = await getCurrentLocation();
      return position?.longitude.toString();
    } catch (e) {
      if (kDebugMode) {
        print("${AppStrings.errorGettingLongitude} $e");
      }
      return null;
    }
  }

  Future<Position?> getAllCurrentLocationInfo() async {
    try {
      Position? position = await getCurrentLocation();
      return position;
    } catch (e) {
      if (kDebugMode) {
        print("${AppStrings.errorGettingAllCurrentLocation} $e");
      }

      if (e.toString().contains(AppStrings.denied) || e.toString().contains(AppStrings.disabled)) {
        rethrow;
      }

      return null;
    }
  }
}
