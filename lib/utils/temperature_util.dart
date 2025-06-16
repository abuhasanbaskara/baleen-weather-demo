class TemperatureUtil {

  static String kelvinToCelsius(double? kelvin) {
    if (kelvin == null) return "Unknown °C";
    final celsius = kelvin - 273.15;
    return "${celsius.toStringAsFixed(0)}°C";
  }

}
