import 'package:get/get.dart';
import 'package:water_tracker/src/data/model/model.dart';
import 'package:water_tracker/src/data/model/photos_model.dart';

import 'package:water_tracker/src/data/repository/posts_repository.dart';
import 'package:water_tracker/src/routes/app_pages.dart';

class HomeController extends GetxController {
  final MyRepository repository;
  HomeController({required this.repository}) : assert(repository != null);

// photos -----------------------------------------------------------
  final _photosList = List<PhotosModel>.empty().obs;
  get photosList => this._photosList.value;
  set photosList(value) => this._photosList.value = value;

  final _photosModel = PhotosModel().obs;
  get postPhotos => this._photosModel.value;
  set postPhotos(value) => this._photosModel.value = value;

// -----------------------------------------------------------------

// postModel --------------------------------------------------------
  // ignore: deprecated_member_use
  final _postsList = List<MyModel>.empty().obs;
  get postList => this._postsList.value;
  set postList(value) => this._postsList.value = value;

  final _post = MyModel().obs;
  get post => this._post.value;
  set post(value) => this._post.value = value;

  // ---------------------------------------------------------------

  getAll() {
    repository.getAll().then((data) {
      this.postList = data;
    });
  }

  getPhotos() {
    repository.getPhotos().then((data) {
      this.photosList = data;
    });
  }

  // route second page
  goToSecondPage() {
    Get.toNamed(Routes.SECONDPAGE);
  }

  details(post) {
    this.post = post;
    Get.toNamed(Routes.DETAILS);
  }
}
