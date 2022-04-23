import 'package:get/get.dart';

import 'package:water_tracker/src/controller/details/details_controller.dart';
import 'package:water_tracker/src/repository/posts_repository.dart';

import '../services/api.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() {
      return DetailsController(
          repository: MyRepository(apiClient: MyApiClient()));
    });
  }
}
