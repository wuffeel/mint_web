abstract class StorageRepository {
  Future<String?> getLinkByStorageUrl(String? storageUrl);

  Future<String> uploadUserPhoto(String filePath, String userId);
}
