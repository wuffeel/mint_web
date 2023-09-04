import 'package:injectable/injectable.dart';

import '../../../data/repository/abstract/storage_repository.dart';
import '../abstract/storage_service.dart';

@Injectable(as: StorageService)
class FirebaseStorageService implements StorageService {
  FirebaseStorageService(this._storageRepository);

  final StorageRepository _storageRepository;

  @override
  Future<String?> getLinkByStorageUrl(String? storageUrl) {
    return _storageRepository.getLinkByStorageUrl(storageUrl);
  }

  @override
  Future<String> uploadUserPhoto(String filePath, String userId) {
    return _storageRepository.uploadUserPhoto(filePath, userId);
  }
}
