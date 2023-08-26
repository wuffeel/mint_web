# Mint Web

Mint doctor web-portal

### To run application with flavor env variable:
- development: ```flutter run --dart-define=flavor="dev"```
- staging: ```flutter run --dart-define=flavor="stg"```
- production: ```flutter run --dart-define=flavor="prod"```

### Build:
```flutter build web --flavor=FLAVOR --dart-define=flavor=FLAVOR```

### Setting up firebase environment config:
```
flutterfire config \
--project=FIREBASE_PROJECT_ID \
--out=lib/firebase_options_FLAVOR.dart
```
