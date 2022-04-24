import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final localStorage = GetStorage();

// remove local value
  removeLocalValue(String key) {
    localStorage.remove(key);
  }

// String ---------------------------------------------------------------
  saveString(String key, String value) {
    localStorage.write(key, value);
  }

  String getString(String key) {
    return localStorage.read(key);
  }

// int  ------------------------------------------------------------------------
  saveInt(String key, int value) {
    localStorage.write(key, value);
  }

  int getInt(key) {
    return localStorage.read(key);
  }

  // Array ------------------------------------------------------------------------
  saveArray(String key, List value) {
    localStorage.write(key, value);
  }

  List getList(key) {
    return localStorage.read(key);
  }
}
