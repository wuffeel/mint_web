import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

import '../../../backbone/environment_type.dart';
import '../../../firebase/firebase_options_dev.dart' as dev;
import '../../../firebase/firebase_options_prod.dart' as prod;
import '../../../firebase/firebase_options_stg.dart' as stg;
import '../../../utils/environment_util.dart';

@lazySingleton
class FirebaseInitializer {
  FirebaseInitializer() {
    _init();
  }

  final _firebaseCompleter = Completer<FirebaseApp>();

  Future<void> _init() async {
    try {
      final app = await Firebase.initializeApp(options: _getFirebaseOptions());
      _firebaseCompleter.complete(app);
    } catch (e, s) {
      log('Firebase initialization error: $e');
      _firebaseCompleter.completeError(e, s);
    }
  }

  /// Retrieves the appropriate Firebase configuration options based on the
  /// application environment.
  ///
  /// This method checks the current application environment using
  /// [EnvironmentUtil.getApplicationEnvironment] and returns the corresponding
  /// Firebase configuration options.
  ///
  /// If the environment is not recognized, it falls back to using the default
  /// options for the 'dev' environment.
  ///
  /// Returns the [FirebaseOptions] instance for the selected environment.
  FirebaseOptions _getFirebaseOptions() {
    final environment = EnvironmentUtil.getApplicationEnvironment();
    if (environment == null) return dev.DefaultFirebaseOptions.currentPlatform;

    switch (environment) {
      case EnvironmentType.dev:
        return dev.DefaultFirebaseOptions.currentPlatform;
      case EnvironmentType.prod:
        return prod.DefaultFirebaseOptions.currentPlatform;
      case EnvironmentType.stg:
        return stg.DefaultFirebaseOptions.currentPlatform;
    }
  }
}
