// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:water_tracker/src/ui/details-x/details_page.dart';
import 'package:water_tracker/src/utils/routes/app_pages.dart';

import '../../models/photos_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PhotosModel photosModel;

  double _volumeValue = 50;

  void onVolumeChanged(double value) {
    setState(() {
      _volumeValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = new DateTime.now();
    String formatter = DateFormat('yMd').format(now);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => FirebaseAuth.instance.signOut(),
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
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SfRadialGauge(axes: <RadialAxis>[
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
                        value: _volumeValue,
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
                        value: _volumeValue,
                        enableDragging: true,
                        onValueChanged: onVolumeChanged,
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
                        widget: Text(_volumeValue.ceil().toString() + '%',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF536DFE))))
                  ])
            ]),
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
                                  Text("2000 mL")
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
                                  Text("1000 mL")
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
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText:
                                        'İçtiğiniz Su Miktarını Giriniz...',
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
                                onPressed: () => Get.back(),
                              )
                            ],
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          print(value.toString());
          if (value == 0) {
            Get.toNamed(Routes.HOME);
          } else if (value == 1) {
            Get.toNamed(Routes.CHOOSEFEMALEWEIGHTPAGE);
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Anasayfa',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'İstatistikler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ayarlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.switch_account),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
