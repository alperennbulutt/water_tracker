import 'package:get/get.dart';
import 'package:water_tracker/src/bindings/details_binding.dart';
import 'package:water_tracker/src/bindings/home_binding.dart';
import 'package:water_tracker/src/bindings/presentation_binding.dart';
import 'package:water_tracker/src/ui/details-x/details_page.dart';
import 'package:water_tracker/src/ui/home/home_page.dart';
import 'package:water_tracker/src/ui/presentation/presentation_page.dart';

part 'app_route_names.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => PresenttionPage(),
        binding: PresentationBinding()),

    // Home Page
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    // Details Page
    GetPage(
        name: Routes.DETAILS,
        page: () => DetailsPage(),
        binding: DetailsBinding()),
  ];
}
