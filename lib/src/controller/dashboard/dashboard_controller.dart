import 'package:get/get.dart';
import 'package:water_tracker/src/repository/posts_repository.dart';

class DashboardController extends GetxController {
  final MyRepository repository;
  DashboardController({required this.repository});
  final currentIndex = 0.obs;
}
