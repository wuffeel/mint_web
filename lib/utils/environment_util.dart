import '../backbone/environment_type.dart';

class EnvironmentUtil {
  /// Private constant storing the value of the environment type string.
  static const _environment = String.fromEnvironment('flavor');

  /// Attempts to match the environment type string with available values.
  ///
  /// Returns the corresponding [EnvironmentType] if a match is found,
  /// otherwise returns null.
  static EnvironmentType? getApplicationEnvironment() {
    for (final env in EnvironmentType.values) {
      if (env.name == _environment) return env;
    }
    return null;
  }
}
