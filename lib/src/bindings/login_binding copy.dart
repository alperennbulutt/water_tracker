import 'package:get/get.dart';
import 'package:water_tracker/src/controller/presentation/presentation_controller.dart';
import 'package:water_tracker/src/data/provider/api.dart';
import 'package:water_tracker/src/data/repository/presentation_repository.dart';

class PresentationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PresentationController>(
        () => PresentationController(PresentationRepository(MyApiClient())));
  }
}
