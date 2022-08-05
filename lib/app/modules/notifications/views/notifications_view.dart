import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/widgets/container_notif.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  final historyC = Get.put(NotificationsController());
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
        SizedBox(
          height: Get.height * 0.8,
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: controller.getNotifKaryawan(),
              builder: (context, snapshot) {
                var notif = snapshot.data?.data()?['notif'];
                if (snapshot.hasData) {
                  var reverseNotif = List.from(notif.reversed);
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Text("No Connections");
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    case ConnectionState.active:
                    case ConnectionState.done:
                      return ListView.builder(
                        itemCount: notif == null ? 0 : notif.length,
                        itemBuilder: (context, index) {
                          return ContainerNotif(
                            tanggal: DateFormat('d MMM yyyy').format(
                                reverseNotif[index]['tanggal'].toDate()),
                            deskripsi: controller.role == 'Karyawan'
                                ? "${reverseNotif[index]['status'] == "Ditolak" ? "Maaf" : "Selamat"} KPI anda atas ${reverseNotif[index]['nama']} pada periode ${reverseNotif[index]['periode']} yang anda ajukan telah ${reverseNotif[index]['status']}"
                                : "KPI baru telah masuk atas nama  ${reverseNotif[index]['nama']} pada periode ${reverseNotif[index]['periode']} ",
                          );
                        },
                      );
                    default:
                      break;
                  }
                }

                return const Text("No data");
              }),
        ),
      ]),
    )));
  }
}
