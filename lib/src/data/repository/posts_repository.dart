import 'package:water_tracker/src/data/provider/api.dart';
import 'package:meta/meta.dart';

class MyRepository {
  final MyApiClient apiClient;

  MyRepository({required this.apiClient}) : assert(apiClient != null);

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
