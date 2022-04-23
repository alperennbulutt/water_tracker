import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/controller/home/home_controller.dart';
import 'package:water_tracker/src/data/model/photos_model.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:intl/intl.dart';
import 'package:water_tracker/src/utils/routes/app_pages.dart';

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
      body: Container(
        child: GetX<HomeController>(initState: (state) {
          Get.find<HomeController>().getPhotos();
          // Get.find<HomeController>().getAll();
        }, builder: (_) {
          return _.photosList.length < 1
              ? Center(child: const CircularProgressIndicator())
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.toNamed(Routes.SECONDPAGE),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Image.network(_.photosList[index].url)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(_.photosList[index].title == null
                                    ? 'Veri Yok'
                                    : _.photosList[index].title)
                              ],
                            ),
                          ),
                        ],
                      ),
                    );

                    // ListTile(
                    //   title: Text(_.postList[index].title ?? 'a'),
                    //   subtitle: Text(_.postList[index].body ?? 'b'),
                    //   onTap: () => _.details(_.postList[index]),
                    // );
                  },
                  itemCount: _.photosList.length,
                );
        }),
      ),
    );
  }
}
