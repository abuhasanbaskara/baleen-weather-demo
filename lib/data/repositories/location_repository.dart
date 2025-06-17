import 'package:baleen_weather_app_test/services/location_service.dart';
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
        _logger.e('Error getting location: $e');
      }

      if (e.toString().contains('denied') || e.toString().contains('disabled')) {
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
        _logger.e('Error getting latitude: $e');
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
        print('Error getting longitude: $e');
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
        print('Error getting All Current Location Info: $e');
      }

      if (e.toString().contains('denied') || e.toString().contains('disabled')) {
        rethrow;
      }

      return null;
    }
  }
}
