import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final localStorage = GetStorage();

// remove local value
  removeLocalValue(String key) {
    localStorage.remove(key);
  }

  // remove all local value
  removeAllLovalValue() {
    localStorage.erase();
  }

// String ---------------------------------------------------------------
  saveString(String key, String value) {
    localStorage.write(key, value);
  }

  String getString(String key) {
    return localStorage.read(key) == null ? '' : localStorage.read(key);
  }

  // boolean ------------------------------------------------------------
  saveBoolean(String key, bool value) {
    localStorage.write(key, value);
  }

  getBoolean(key) {
    return localStorage.read(key) == null ? false : localStorage.read(key);
  }
  // ------------------------------------------------------------------------

// int  ------------------------------------------------------------------------
  saveInt(String key, int value) {
    localStorage.write(key, value);
  }

  int getInt(key) {
    return localStorage.read(key) == null ? 0 : localStorage.read(key);
  }

  // double ----------------------------------------------------------------------
  saveDouble(String key, double value) {
    localStorage.write(key, value);
  }

  double getDouble(key) {
    return localStorage.read(key) == null ? 0.0 : localStorage.read(key);
  }

  // ------------------------------------------------------------------------------

  // Array ------------------------------------------------------------------------
  saveArray(String key, List value) {
    localStorage.write(key, value);
  }

  List getList(key) {
    return localStorage.read(key) == null ? [] : localStorage.read(key);
  }
}
