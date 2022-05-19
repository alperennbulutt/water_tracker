import 'package:get/get.dart';
import 'package:water_tracker/src/bindings/dashboard_binding.dart';
import 'package:water_tracker/src/bindings/details_binding.dart';
import 'package:water_tracker/src/bindings/gender_binging.dart';
import 'package:water_tracker/src/bindings/home_binding.dart';
import 'package:water_tracker/src/bindings/my_app_binding.dart';
import 'package:water_tracker/src/bindings/presentation_binding.dart';
import 'package:water_tracker/src/bindings/profile_binding.dart';
import 'package:water_tracker/src/bindings/settings_binding.dart';
import 'package:water_tracker/src/bindings/statistics_binding.dart';
import 'package:water_tracker/src/ui/dashboard/dashboard_page.dart';
import 'package:water_tracker/src/ui/details-x/details_page.dart';
import 'package:water_tracker/src/ui/gender/choose_gender_page.dart';
import 'package:water_tracker/src/ui/home/home_page.dart';
import 'package:water_tracker/src/ui/login/login_page.dart';
import 'package:water_tracker/src/ui/my_app.dart';
import 'package:water_tracker/src/ui/presentation/presentation_page.dart';
import 'package:water_tracker/src/ui/profile/profile_page.dart';
import 'package:water_tracker/src/ui/register/register_page.dart';
import 'package:water_tracker/src/ui/settings/settings_page.dart';
import 'package:water_tracker/src/ui/statistics/statistics_page.dart';
import 'package:water_tracker/src/ui/weight/choose_female_weight.dart';
import 'package:water_tracker/src/ui/weight/choose_male_weight.dart';

part 'app_route_names.dart';

class AppPages {
  static final pages = [
    // MyApp page
    GetPage(name: Routes.MyApp, page: () => MyApp(), binding: MyAppBinding()),
    // Daashboard page
    GetPage(
        name: Routes.Dashboard,
        page: () => DashboardPage(),
        binding: DashboardBinding()),
    GetPage(
        name: Routes.CHOOSEMALEWEIGHTPAGE,
        page: () => ChooseMaleWeight(),
        binding: PresentationBinding()),
    GetPage(
        name: Routes.CHOOSEFEMALEWEIGHTPAGE,
        page: () => ChooseFemaleWeight(),
        binding: PresentationBinding()),
    GetPage(
        name: Routes.CHOOSEGENDERPAGE,
        page: () => ChooseGender(),
        binding: GenderBinding()),
    GetPage(
        name: Routes.REGISTERPAGE,
        page: () => RegisterPage(),
        binding: PresentationBinding()),
    GetPage(
        name: Routes.LOGINPAGE,
        page: () => LoginPage(),
        binding: PresentationBinding()),
    GetPage(
        name: Routes.INITIAL,
        page: () => PresenttionPage(),
        binding: PresentationBinding()),

    //Statistics
    GetPage(
        name: Routes.Statistics,
        page: () => StatisticsPage(),
        binding: StatisticsBinding()),

    // Profile
    GetPage(
        name: Routes.Statistics,
        page: () => ProfilePage(),
        binding: ProfileBinding()),

    // Settings page
    GetPage(
        name: Routes.Statistics,
        page: () => SettingsPage(),
        binding: SettingsBinding()),

    // Home Page
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    // Details Page
    GetPage(
        name: Routes.DETAILS,
        page: () => DetailsPage(),
        binding: DetailsBinding()),
  ];
}
