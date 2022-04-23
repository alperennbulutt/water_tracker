import 'package:get/get.dart';
import 'package:water_tracker/src/repository/posts_repository.dart';
import 'package:water_tracker/src/services/api.dart';

import '../controller/my_app/my_app_controller.dart';

class MyAppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAppController>(() =>
        MyAppController(repository: MyRepository(apiClient: MyApiClient())));
  }
}
