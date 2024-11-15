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
      applicationName: '[DEV] กรุช่างไทย',
      gruChangThaiApiServerUrl: 'https://36fe-167-235-243-206.ngrok-free.app',
    );
  }

  static AppConfig prod() {
    return AppConfig(
      applicationName: 'กรุช่างไทย',
      gruChangThaiApiServerUrl: 'https://api-gruchangthai.vercel.app',
    );
  }

  @override
  String toString() {
    return 'AppConfig{applicationName: $applicationName, gruChangThaiApiServerUrl: $gruChangThaiApiServerUrl}';
  }
}
