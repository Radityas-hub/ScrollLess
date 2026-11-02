class AppConfig {
  const AppConfig._();

  static const demoMode = bool.fromEnvironment(
    'DEMO_MODE',
    defaultValue: false,
  );
}
