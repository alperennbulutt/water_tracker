import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:water_tracker/src/constants/local_storage_constants.dart';
import 'package:water_tracker/src/controller/home/home_controller.dart';
import 'package:water_tracker/src/data/local_storage.dart';
import 'package:water_tracker/src/repository/posts_repository.dart';
import 'package:water_tracker/src/services/api.dart';
import 'package:water_tracker/src/services/firestore.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    final localStorage = LocalStorage();
    final firestoreService = FirestoreService();
    final controller = Get.put(
        HomeController(repository: MyRepository(apiClient: MyApiClient())));

    final now = new DateTime.now();
    String formatter = DateFormat('yMd').format(now);

    TextEditingController completedUserInputWaterValue =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => {
                  FirebaseAuth.instance.signOut(),
                },
            child: Icon(Icons.logout)),
        title: Text(formatter),
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Obx(
                () => SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(
                      minimum: 0,
                      maximum: 100,
                      showLabels: false,
                      showTicks: false,
                      radiusFactor: 0.7,
                      axisLineStyle: AxisLineStyle(
                          cornerStyle: CornerStyle.bothCurve,
                          color: Colors.black12,
                          thickness: 25),
                      pointers: <GaugePointer>[
                        RangePointer(
                            value: controller.volumeValue.value,
                            cornerStyle: CornerStyle.bothCurve,
                            width: 25,
                            sizeUnit: GaugeSizeUnit.logicalPixel,
                            gradient: const SweepGradient(colors: <Color>[
                              Color(0XFFBBDEFB),
                              Color(0xFF1565C0)
                            ], stops: <double>[
                              0.25,
                              0.75
                            ])),
                        MarkerPointer(
                            value: controller.volumeValue.value,
                            enableDragging: true,
                            onValueChanged: controller.onVolumeChanged,
                            markerHeight: 34,
                            markerWidth: 34,
                            markerType: MarkerType.circle,
                            color: Color(0xFF0D47A1),
                            borderWidth: 2,
                            borderColor: Colors.white54)
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            angle: 90,
                            axisValue: 5,
                            positionFactor: 0.2,
                            widget: Text(
                                controller.volumeValue.value.ceil().toString() +
                                    '%',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF536DFE))))
                      ])
                ]),
              ),
            ]),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Card(
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Günlük Hedef',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    ),
                                    Obx(
                                      () => Text(
                                        " ${controller.goalsOfDrinkWater().toString().replaceAll(regex, '')} bardak",
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 15),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Card(
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Tamamlanan',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    ),
                                    Obx(
                                      () => Text(
                                        "${controller.completedOfDrinkWater(completedUserInputWaterValue.text).toString().replaceAll(regex, '') + " bardak"}",
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 15),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.blue)))),
                  child: Row(children: [Icon(Icons.add), Text("Ekle")]),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: 20,
                              right: 20,
                              left: 20,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            height: 200,
                            color: Colors.white,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 16),
                                    child: TextField(
                                      controller: completedUserInputWaterValue,
                                      autofocus: true,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Kaç bardak su içtiniz ?',
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    '(1 Su Bardağı : 200 mL)',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                                side: BorderSide(
                                                    color: Colors.blue)))),
                                    child: const Text('Kaydet'),
                                    onPressed: () => {
                                      controller.waterGoals.value =
                                          controller.volumeValue.value * 2,
                                      localStorage.saveDouble(
                                          LocalStorageConstants
                                              .amountOfWaterDrunk,
                                          controller.volumeValue.value),
                                      controller.completedOfDrinkWater(
                                          completedUserInputWaterValue.text),
                                      Get.back(),
                                      Get.defaultDialog(
                                        onConfirm: () => Get.back(),
                                        title: 'Kayıt Edildi',
                                        middleText:
                                            "Su miktarınız ayarlanmıştır",
                                      ),
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
