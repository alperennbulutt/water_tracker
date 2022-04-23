import 'package:get/get.dart';
import 'package:water_tracker/src/controller/presentation/presentation_controller.dart';

import '../repository/presentation_repository.dart';
import '../services/api.dart';

class PresentationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PresentationController>(
        () => PresentationController(PresentationRepository(MyApiClient())));
  }
}
