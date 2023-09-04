import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../utils/file_utils.dart';
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

  @override
  Future<String> uploadUserPhoto(String filePath, String userId) async {
    final storage = await _firebaseInitializer.storage;

    final file = File(filePath);
    final extension = FileUtils.getFileExtension(file.path);
    final storagePath = 'users/$userId.$extension';
    await storage.ref().child(storagePath).putFile(file);
    return storagePath;
  }
}
