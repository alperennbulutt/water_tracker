import 'package:get/get.dart';
import 'package:water_tracker/src/repository/register/register_repo.dart';

class RegisterController extends GetxController {
  final RegisterRepository repository;
  RegisterController({required this.repository});

  final userName = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;
}
