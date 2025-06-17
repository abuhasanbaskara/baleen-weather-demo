import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtil {
  static Future<bool> hasConnection() async {
    final result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
