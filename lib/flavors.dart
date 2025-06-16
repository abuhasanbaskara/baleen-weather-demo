enum Flavor {
  staging,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.staging:
        return 'Ballen Weather Staging';
      case Flavor.production:
        return 'Ballen Weather';
      default:
        return 'title';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.staging:
        return 'https://api.openweathermap.org/data/2.5/';
      case Flavor.production:
        return 'https://api.openweathermap.org/data/2.5/';
      default:
        return '';
    }
  }

  static String get appId {
    switch (appFlavor) {
      case Flavor.staging:
        return '517d8ce094956e4284d8d2c93809bb95';
      case Flavor.production:
        return '517d8ce094956e4284d8d2c93809bb95';
      default:
        return '';
    }
  }

}
