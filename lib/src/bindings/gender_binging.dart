import 'package:get/get.dart';
import 'package:water_tracker/src/controller/gender/gender_controller.dart';
import 'package:water_tracker/src/repository/posts_repository.dart';
import 'package:water_tracker/src/services/api.dart';

class GenderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenderController>(() =>
        GenderController(repository: MyRepository(apiClient: MyApiClient())));
  }
}
