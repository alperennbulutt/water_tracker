import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/controller/login/login_controller.dart';
import 'package:water_tracker/src/repository/login/login_repo.dart';
import 'package:water_tracker/src/services/api.dart';
import 'package:water_tracker/src/utils/routes/app_pages.dart';

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
                  onChanged: (value) {
                    if (value.length <= 0) {
                      print('hiçbir veriniz yok');
                    }
                  },
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
                  onChanged: (value) {
                    if (value.length <= 0) {
                      print('hiçbir veriniz yok');
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Hesabınız yok mu?'),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.REGISTERPAGE),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  if (usernameController.value.text.length > 0 &&
                      passwordController.value.text.length > 0) {
                    controller.signIn(usernameController.value.text.trim(),
                        passwordController.value.text.trim());
                  } else {
                    showDialog(
                        context: context,
                        builder: (ctxt) => new AlertDialog(
                              title: Text(
                                  "Kullanıcı adı veya şifre girilmemiş!",
                                  textAlign: TextAlign.center),
                            ));
                  }
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
