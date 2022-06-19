import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/widgets/container_notif.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Notifikasi",
          style: Get.textTheme.headline5,
        ),
        const SizedBox(height: 16),
        const ContainerNotif(
          tanggal: "12 : 05, 26 May 2022",
          deskripsi:
              "Selamat KPI anda atas nama Nendra Ariyanto pada periode 01 Januari 2021 - 31 Desember 2021 yang anda ajukan telah disetujui",
        )
      ]),
    )));
  }
}
