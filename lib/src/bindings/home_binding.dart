import 'package:get/get.dart';
import 'package:water_tracker/src/controller/home/home_controller.dart';
import 'package:water_tracker/src/services/api.dart';

import '../repository/posts_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(repository: MyRepository(apiClient: MyApiClient()));
    });
  }
}
