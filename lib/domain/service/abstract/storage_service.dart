abstract class StorageService {
  Future<String?> getLinkByStorageUrl(String? storageUrl);

  Future<String> uploadUserPhoto(String filePath, String userId);
}
