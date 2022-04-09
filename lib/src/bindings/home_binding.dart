import 'package:get/get.dart';
import 'package:water_tracker/src/controller/home/home_controller.dart';
import 'package:water_tracker/src/data/provider/api.dart';
import 'package:water_tracker/src/data/repository/posts_repository.dart';
import 'package:http/http.dart' as http;

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() {
      return HomeController(repository: MyRepository(apiClient: MyApiClient()));
    });
  }
}
