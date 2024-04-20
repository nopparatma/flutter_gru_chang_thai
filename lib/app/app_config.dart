class AppConfig {
  final String applicationName;
  final String gruChangThaiApiServerUrl;

  static AppConfig _instance = AppConfig._internal('', '');

  factory AppConfig({
    required String applicationName,
    required String gruChangThaiApiServerUrl,
  }) {
    _instance = AppConfig._internal(
      applicationName,
      gruChangThaiApiServerUrl,
    );
    return _instance;
  }

  AppConfig._internal(
    this.applicationName,
    this.gruChangThaiApiServerUrl,
  );

  static AppConfig get instance {
    return _instance;
  }

  // Environment Flavor Config
  static AppConfig dev() {
    return AppConfig(
      applicationName: 'GruChang Thai Gold Smith DEV',
      gruChangThaiApiServerUrl: 'https://localhost:6923',
    );
  }

  static AppConfig prod() {
    return AppConfig(
      applicationName: 'GruChang Thai Gold Smith',
      gruChangThaiApiServerUrl: 'https://gruchangthaiservice.up.railway.app',
    );
  }

  @override
  String toString() {
    return 'AppConfig{applicationName: $applicationName, gruChangThaiApiServerUrl: $gruChangThaiApiServerUrl}';
  }
}
