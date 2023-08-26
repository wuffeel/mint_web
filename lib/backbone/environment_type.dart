enum EnvironmentType { dev, prod, stg }

extension EnvironmentTypeToShortString on EnvironmentType {
  String toShortString() => toString().split('.').last;
}
