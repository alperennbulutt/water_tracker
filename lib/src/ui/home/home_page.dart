import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/controller/home/home_controller.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../models/photos_model.dart';

// ignore: must_be_immutable
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
          Row(children: [
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
                          Color(0xFFCC2B5E),
                          Color(0xFF753A88)
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
                        color: Color(0xFF753A88),
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
                                color: Color(0xFFCC2B5E))))
                  ])
            ]),
          ]),
          Row(
            children: [
              Column(
                children: [
                  Text("günlük hedef"),
                  SizedBox(
                    height: 20,
                  ),
                  Text("tamamlanan"),
                ],
              ),
              Column()
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}
