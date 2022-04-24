import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/controller/register/register_controller.dart';
import 'package:water_tracker/src/repository/register/register_repo.dart';
import 'package:water_tracker/src/services/api.dart';
import 'package:water_tracker/src/ui/login/login_page.dart';
import 'package:water_tracker/src/utils/device/device_utils.dart';
import 'package:water_tracker/src/utils/routes/app_pages.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLogin = false;

  final controller = Get.put(RegisterController(
      repository: RegisterRepository(apiClient: MyApiClient())));
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  @override
  Widget build(BuildContext context) {
    return isLogin == true
        ? LoginPage()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: GestureDetector(
              onTap: () => DeviceUtils.hideKeyboard(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SvgPicture.asset("assets/login/water_drop.svg"),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Username',
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Confirm Password',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Giriş Yapın'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Sign in',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: style,
                      onPressed: () async {
                        if (passwordController.text ==
                            confirmPasswordController.text) {
                          await controller.signUp(
                              usernameController.text, passwordController.text);

                          Get.toNamed(Routes.HOME);
                        } else {
                          Get.defaultDialog(
                              middleText: 'Parolanız Doğrulanamadı', title: '');
                        }
                      },
                      child: const Text('Kayıt Ol'),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
