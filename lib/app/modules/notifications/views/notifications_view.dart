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
                print("notif : $notif");
                if (snapshot.hasData) {
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
                            tanggal: DateFormat('d MMM yyyy')
                                .format(notif?[index]['tanggal'].toDate()),
                            deskripsi:
                                "Selamat KPI anda atas ${notif?[index]['nama']} pada periode ${notif?[index]['periode']} yang anda ajukan telah ${notif?[index]['status']}",
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
