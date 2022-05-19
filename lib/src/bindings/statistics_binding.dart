import 'package:get/get.dart';
import 'package:water_tracker/src/repository/posts_repository.dart';
import 'package:water_tracker/src/services/api.dart';

import '../controller/statistics/statistics_controller.dart';

class StatisticsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatisticsController>(() => StatisticsController(
        repository: MyRepository(apiClient: MyApiClient())));
  }
}
