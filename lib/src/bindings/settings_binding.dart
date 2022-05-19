import 'package:get/get.dart';
import 'package:water_tracker/src/repository/posts_repository.dart';
import 'package:water_tracker/src/services/api.dart';

import '../controller/settings/settings_controller.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() =>
        SettingsController(repository: MyRepository(apiClient: MyApiClient())));
  }
}
