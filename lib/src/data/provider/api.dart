import 'dart:convert';
import 'package:water_tracker/src/constants/endpoints.dart';
import 'package:water_tracker/src/data/model/model.dart';
import 'package:water_tracker/src/data/model/photos_model.dart';
import 'package:http/http.dart' as http;

class MyApiClient {
  late http.Client httpClient;

  getAll() async {
    try {
      var response =
          await httpClient.get(Uri.parse(EndPoint.base_url + EndPoint.posts));
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        List<MyModel> listMyModel =
            jsonResponse.map((model) => MyModel.fromJson(model)).toList();
        return listMyModel;
      } else
        print('error');
    } catch (_) {}
  }

  // get photos from api
  getPhotos() async {
    try {
      var response =
          await httpClient.get(Uri.parse(EndPoint.base_url + EndPoint.photos));
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        List<PhotosModel> listMyModel =
            jsonResponse.map((model) => PhotosModel.fromJson(model)).toList();
        return listMyModel;
      } else
        print('error');
    } catch (_) {}
  }

  getId(id) async {
    try {
      var response = await httpClient.get(Uri.parse('baseUrlid'));
      if (response.statusCode == 200) {
        //Map<String, dynamic> jsonResponse = json.decode(response.body);
      } else
        print('erro -get');
    } catch (_) {}
  }
}
