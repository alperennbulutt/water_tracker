import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/controller/home/home_controller.dart';
import 'package:water_tracker/src/data/model/photos_model.dart';
import 'package:water_tracker/src/routes/app_pages.dart';

class HomePage extends GetView<HomeController> {
  late PhotosModel photosModel;

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
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
