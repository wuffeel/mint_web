# About the project

This is a Mint web application for doctors. It is a platform for doctors to
manage their patients and appointments.

# Features

- Clean Architecture
- Appointments table
- Patient consultations table
- Doctor profile management
- Consultations analytics
- Chat with patients
- Notifications about consultations and chat messages

# Built With

- [Flutter](https://flutter.dev/) - Cross platform framework to build applications with single codebase
- [Firebase](https://firebase.google.com/) - Backend as a service. Used for authentication, database, storage,
notifications and Cloud Functions backend.
- [Flutter Bloc](https://bloclibrary.dev/) - State management library
- [GetIt](https://pub.dev/packages/get_it) & [Injectable](https://pub.dev/packages/injectable) - Dependency injection

# Getting Started

## Build & Run

#### Resolve Flutter dependencies:
```
flutter pub get
```

#### To run application with flavor env variable:
- development: ```flutter run --dart-define=flavor="dev"```
- staging: ```flutter run --dart-define=flavor="stg"```
- production: ```flutter run --dart-define=flavor="prod"```

#### To build web application for flavor:
```
flutter build web --flavor=FLAVOR --dart-define=flavor=FLAVOR
```

## Firebase

### Setting up firebase environment config:
```
flutterfire config \
--project=FIREBASE_PROJECT_ID \
--out=lib/firebase_options_FLAVOR.dart
```

### Deploy app to Firebase Hosting:
```
firebase deploy --only hosting
```
