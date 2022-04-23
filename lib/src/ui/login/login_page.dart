import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/controller/login/login_controller.dart';
import 'package:water_tracker/src/repository/login/login_repo.dart';
import 'package:water_tracker/src/services/api.dart';

import '../../utils/device/device_utils.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginControllerController(
      repository: LoginRepository(apiClient: MyApiClient())));
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => DeviceUtils.hideKeyboard(context),
          child: Column(
            children: [
              SvgPicture.asset("assets/login/water_drop.svg"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                  controller: usernameController,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  print('username : ' + usernameController.value.text);
                  print('password : ' + passwordController.value.text);
                  controller.userName.value = usernameController.value.text;
                  controller.password.value = passwordController.value.text;

                  controller.signIn(usernameController.value.text.trim(),
                      passwordController.value.text.trim());
                },
                child: const Text('Giriş Yap'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
