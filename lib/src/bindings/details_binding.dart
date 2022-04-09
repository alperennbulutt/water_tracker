import 'package:get/get.dart';


import 'package:http/http.dart' as http;
import 'package:water_tracker/src/controller/details/details_controller.dart';
import 'package:water_tracker/src/data/provider/api.dart';
import 'package:water_tracker/src/data/repository/posts_repository.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() {
      return DetailsController(
          repository: MyRepository(apiClient: MyApiClient()));
    });
  }
}
