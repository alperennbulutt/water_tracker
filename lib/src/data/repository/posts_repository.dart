import 'package:water_tracker/src/data/provider/api.dart';

class MyRepository {
  final MyApiClient apiClient;

  MyRepository({required this.apiClient});

  getAll() {
    return apiClient.getAll();
  }

  getPhotos() {
    return apiClient.getPhotos();
  }

  getId(id) {
    return apiClient.getId(id);
  }
}
