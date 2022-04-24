import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/controller/register/register_controller.dart';
import 'package:water_tracker/src/repository/register/register_repo.dart';
import 'package:water_tracker/src/services/api.dart';

class TestPage extends StatelessWidget {
  final controller = Get.put(RegisterController(
      repository: RegisterRepository(apiClient: MyApiClient())));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [],
      ),
    );
  }
}
