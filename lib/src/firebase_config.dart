import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get platformOptions {
    // Android
    return const FirebaseOptions(
      apiKey:
          'AAAAR33Pv-4:APA91bGTGpCSktIh6sGfhe1UAavrDNuHj6POnMyyDD3llzbReJbzv-e1tQYYRkK_3OHa7Lop0xyWyYP8nAV3wW1oA0vdy624nwre-jSeWvh0wOo30sWwAvD1I2kccu4y_vJvmXnQcoQg',
      appId: '1:307053445102:android:bde45a9d5da1e308c8d8ff',
      messagingSenderId: '307053445102',
      projectId: 'water-tracker-cfabf',
    );
    // if (Platform.isIOS || Platform.isMacOS) {
    //   // iOS and MacOS
    //   // return const FirebaseOptions(
    //   //   apiKey: 'AIzaSyBE9O3AxYbCUJ5a-3C3PYSeh0EIDYoFr10',
    //   //   appId: '1:307053445102:android:bde45a9d5da1e308c8d8ff',
    //   //   messagingSenderId: '307053445102',
    //   //   projectId: 'water-tracker-cfabf',
    //   // );
    // } else

    //   // Android
    //   return const FirebaseOptions(
    //     apiKey: 'AIzaSyBE9O3AxYbCUJ5a-3C3PYSeh0EIDYoFr10',
    //     appId: '1:307053445102:android:bde45a9d5da1e308c8d8ff',
    //     messagingSenderId: '307053445102',
    //     projectId: 'water-tracker-cfabf',
    //   );
  }
}
