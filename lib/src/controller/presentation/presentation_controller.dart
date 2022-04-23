import 'package:get/get.dart';

import '../../repository/presentation_repository.dart';

class PresentationController extends GetxController {
  final PresentationRepository repository;

  PresentationController(this.repository);

  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
}
