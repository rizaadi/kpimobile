import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kpimobile/app/modules/history/views/history_view.dart';
import 'package:kpimobile/app/modules/home/home_page.dart';
import 'package:kpimobile/app/modules/notifications/views/notifications_view.dart';
import 'package:kpimobile/app/modules/profile/views/profile_view.dart';

import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationView extends GetView<BottomNavigationController> {
  final screens = [HomePage(), HistoryView(), NotificationsView(), ProfileView()];

  BottomNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: screens,
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              showUnselectedLabels: true,
              showSelectedLabels: true,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                controller.changeIndex(value);
              },
              currentIndex: controller.selectedIndex.value,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/home.svg',
                      color: controller.selectedIndex.value == 0 ? Get.theme.primaryColor : Colors.grey,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/clipboard-2.svg',
                      color: controller.selectedIndex.value == 1 ? Get.theme.primaryColor : Colors.grey,
                    ),
                    label: 'History'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/bell.svg',
                      color: controller.selectedIndex.value == 2 ? Get.theme.primaryColor : Colors.grey,
                    ),
                    label: 'Notifikasi'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/profile.svg',
                      color: controller.selectedIndex.value == 3 ? Get.theme.primaryColor : Colors.grey,
                    ),
                    label: 'Profil'),
              ])),
    );
  }
}
