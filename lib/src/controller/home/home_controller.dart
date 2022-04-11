import 'package:get/get.dart';
import 'package:water_tracker/src/data/model/model.dart';
import 'package:water_tracker/src/data/model/photos_model.dart';

import 'package:water_tracker/src/data/repository/posts_repository.dart';
import 'package:water_tracker/src/routes/app_pages.dart';

class HomeController extends GetxController {
  final MyRepository repository;
  HomeController({required this.repository}) : assert(repository != null);

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
