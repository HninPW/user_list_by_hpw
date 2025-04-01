enum Environment { local, staging, production }

class Config {
  static const String _localUrl = "https://jsonplaceholder.typicode.com";
  static const String _stagingUrl = "https://staging-api.example.com";
  static const String _productionUrl = "https://production-api.example.com";

  static late Environment environment;

  static String get baseUrl {
    switch (environment) {
      case Environment.staging:
        return _stagingUrl;
      case Environment.production:
        return _productionUrl;
      case Environment.local:
      default:
        return _localUrl;
    }
  }
}