import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/controller/home/home_controller.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:intl/intl.dart';
import 'package:water_tracker/src/utils/routes/app_pages.dart';

import '../../models/photos_model.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  late PhotosModel photosModel;

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final now = new DateTime.now();
    String formatter = DateFormat('yMd').format(now);
    return Scaffold(
        appBar: AppBar(
          title: Text(formatter),
          toolbarHeight: 110,
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
            Text('HomePage'),
          ],
        ));
  }
}
