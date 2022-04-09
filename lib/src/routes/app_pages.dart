import 'package:get/get.dart';
import 'package:water_tracker/src/bindings/details_binding.dart';
import 'package:water_tracker/src/bindings/home_binding.dart';
import 'package:water_tracker/src/ui/details/details_page.dart';
import 'package:water_tracker/src/ui/home/home_page.dart';
import 'package:water_tracker/src/ui/presentation/presentation_page.dart';
import 'package:water_tracker/src/ui/second_page/second_page.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => PresenttionPage(),
        binding: HomeBinding()),
    // Details Page
    GetPage(
        name: Routes.DETAILS,
        page: () => DetailsPage(),
        binding: DetailsBinding()),

    // Second Page
    GetPage(name: Routes.SECONDPAGE, page: () => SecondPage()),
  ];
}
