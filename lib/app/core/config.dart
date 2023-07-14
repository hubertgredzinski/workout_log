enum Flavor {
  development,
  staging,
  production,
}

class Config {
  static Flavor appFlavor = Flavor.development;

  static String get version {
    switch (appFlavor) {
      case Flavor.development:
        return 'Developers version';
      case Flavor.staging:
        return 'Staging version';
      case Flavor.production:
        return 'Production version';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.development:
        return 'http://api.weatherapi.com/v1';
      case Flavor.staging:
        return 'http://api.weatherapi.com/v1';
      case Flavor.production:
        return 'http://api.weatherapi.com/v1';
    }
  }
}
