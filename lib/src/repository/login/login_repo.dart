import 'package:firebase_auth/firebase_auth.dart';
import 'package:water_tracker/src/services/api.dart';

class LoginRepository {
  final MyApiClient apiClient;

  LoginRepository({required this.apiClient});
}
