import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water_tracker/src/controller/dashboard/dashboard_controller.dart';
import 'package:water_tracker/src/repository/posts_repository.dart';
import 'package:water_tracker/src/services/api.dart';
import 'package:water_tracker/src/ui/home/home_page.dart';
import 'package:water_tracker/src/ui/profile/profile_page.dart';
import 'package:water_tracker/src/ui/settings/settings_page.dart';
import 'package:water_tracker/src/ui/statistics/statistics_page.dart';

import '../error_page/error_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController(
        repository: MyRepository(apiClient: MyApiClient())));

    Widget changePage(int index) {
      if (index == 0) {
        return HomePage();
      } else if (index == 1) {
        return StatisticsPage();
      } else if (index == 2) {
        return ProfilePage();
      } else if (index == 3) {
        return SettingsPage();
      } else {
        return ErrorPage();
      }
    }

    return Scaffold(
      body: Obx(
        () => changePage(controller.currentIndex.value),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          onTap: (value) {
            controller.currentIndex.value = value;
            print(value.toString());
            changePage(controller.currentIndex.value);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Anasayfa',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined),
              label: 'İstatistikler',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.switch_account),
              label: 'Profil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Ayarlar',
            ),
          ],
        ),
      ),
    );
  }
}
