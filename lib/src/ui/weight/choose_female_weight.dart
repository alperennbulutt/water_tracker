import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:water_tracker/src/constants/local_storage_constants.dart';
import 'package:water_tracker/src/controller/register/register_controller.dart';
import 'package:water_tracker/src/data/local_storage.dart';
import 'package:water_tracker/src/services/api.dart';
import 'package:water_tracker/src/ui/dashboard/dashboard_page.dart';

import '../../repository/register/register_repo.dart';

class ChooseFemaleWeight extends StatefulWidget {
  const ChooseFemaleWeight({Key? key}) : super(key: key);

  @override
  State<ChooseFemaleWeight> createState() => _ChooseFemaleWeightState();
}

class _ChooseFemaleWeightState extends State<ChooseFemaleWeight> {
  final controller = Get.put(RegisterController(
      repository: RegisterRepository(apiClient: MyApiClient())));
  int _currentIntValue = 0;
  final localStorage = LocalStorage();
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
              "assets/weight/female/weight_gauge.svg",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
              child: Text(
            'Kilonuzu kg cinsinden giriniz',
            style: TextStyle(
              color: Color.fromRGBO(255, 69, 147, 1),
              fontWeight: FontWeight.bold,
            ),
          )),
          Row(
            children: [
              Expanded(
                  child: Align(
                child: SvgPicture.asset("assets/weight/female/water_drop.svg"),
              )),
              Expanded(
                  child: SizedBox(
                height: 200,
                child: NumberPicker(
                  value: _currentIntValue,
                  minValue: 0,
                  maxValue: 200,
                  step: 1,
                  haptics: true,
                  onChanged: (value) =>
                      setState(() => _currentIntValue = value),
                ),
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
                    onPressed: () {
                      print('pressed');
                      Get.back();
                    },
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
                    onPressed: _currentIntValue == 0
                        ? null
                        : () async {
                            print('user weight' + _currentIntValue.toString());
                            print('user gender:' +
                                localStorage
                                    .getString(LocalStorageConstants.gender));
                            await localStorage.saveInt(
                                LocalStorageConstants.weight, _currentIntValue);

                            await controller.updaUserInformation(
                                localStorage
                                    .getString(LocalStorageConstants.gender),
                                _currentIntValue);

                            Get.offAll(DashboardPage());
                          },
                    child: const Text('Next'),
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
