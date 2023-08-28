import 'package:injectable/injectable.dart';

import '../abstract/storage_repository.dart';
import 'firebase_initializer.dart';

@Injectable(as: StorageRepository)
class FirebaseStorageRepository implements StorageRepository {
  FirebaseStorageRepository(this._firebaseInitializer);

  final FirebaseInitializer _firebaseInitializer;

  @override
  Future<String?> getLinkByStorageUrl(String? storageUrl) async {
    final storage = await _firebaseInitializer.storage;
    if (storageUrl != null) {
      return storage.ref().child(storageUrl).getDownloadURL();
    }

    return null;
  }
}
