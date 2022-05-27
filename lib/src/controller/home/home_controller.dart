import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/utils/routes/app_pages.dart';

import '../../models/model.dart';
import '../../models/photos_model.dart';
import '../../repository/posts_repository.dart';

class HomeController extends GetxController {
  final MyRepository repository;
  HomeController({required this.repository});

  final Rx<TextEditingController> waterGoalsTextEditingController =
      TextEditingController().obs;

  // volume Value
  var volumeValue = 0.0.obs;

  void onVolumeChanged(double value) {
    volumeValue.value = value;
  }

  // water goals value
  final waterGoals = 0.0.obs;

// photos -----------------------------------------------------------
  final _photosList = <PhotosModel>[].obs;
  get photosList => _photosList;
  set photosList(value) => _photosList.value = value;

  final _photosModel = PhotosModel().obs;
  get postPhotos => _photosModel.value;
  set postPhotos(value) => _photosModel.value = value;

// -----------------------------------------------------------------

// postModel --------------------------------------------------------
  final _postsList = <MyModel>[].obs;
  get postList => _postsList;
  set postList(value) => _postsList.value = value;

  final _post = MyModel().obs;
  get post => _post.value;
  set post(value) => _post.value = value;

  // ---------------------------------------------------------------

  getAll() {
    repository.getAll().then((data) {
      postList = data;
    });
  }

  getPhotos() {
    repository.getPhotos().then((data) {
      photosList = data;
    });
  }

  // route second page
  goToSecondPage() {
    Get.toNamed(Routes.SECONDPAGE);
  }

  details(value) {
    post = value;
    Get.toNamed(Routes.DETAILS);
  }
}
