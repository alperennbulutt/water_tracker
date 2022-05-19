import 'package:get/get.dart';
import 'package:water_tracker/src/controller/profile/profile_controller.dart';
import 'package:water_tracker/src/repository/posts_repository.dart';
import 'package:water_tracker/src/services/api.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() =>
        ProfileController(repository: MyRepository(apiClient: MyApiClient())));
  }
}
