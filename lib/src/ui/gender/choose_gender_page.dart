import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/controller/register/register_controller.dart';
import 'package:water_tracker/src/repository/register/register_repo.dart';
import 'package:water_tracker/src/services/api.dart';
import 'package:water_tracker/src/utils/routes/app_pages.dart';

import '../../widgets/custom_gradient_text.dart';

class ChooseGender extends StatelessWidget {
  final controller = Get.put(RegisterController(
      repository: RegisterRepository(apiClient: MyApiClient())));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Align(
            child: SvgPicture.asset(
              "assets/gender/choose_gender.svg",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            child: GradientText(
              'Choose your Gender',
              style: const TextStyle(fontSize: 20),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(27, 174, 238, 1),
                Color.fromRGBO(255, 69, 147, 1),
              ]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: Align(
                child: GestureDetector(
                    onTap: () => controller.gender.value = 'Male',
                    child: SvgPicture.asset("assets/gender/choose_male.svg")),
              )),
              Expanded(
                  child: Align(
                child: GestureDetector(
                    onTap: () => controller.gender.value = 'Female',
                    child: SvgPicture.asset("assets/gender/choose_female.svg")),
              )),
            ],
          ),
          Spacer(),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Align(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    onPressed: () {},
                    child: Icon(Icons.arrow_back_ios),
                  ),
                )),
                Expanded(
                    child: Align(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    onPressed: () async {
                      await controller.saveLocalRegisterInformations();
                      Get.toNamed(Routes.CHOOSEFEMALEWEIGHTPAGE);
                      // localStorage.saveString(LocalStorageConstants.gender, )
                    },
                    child: const Text('NEXT'),
                  ),
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
