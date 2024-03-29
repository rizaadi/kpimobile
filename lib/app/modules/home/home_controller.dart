import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpimobile/app/routes/app_pages.dart';

import '../../core/widgets/notif_snackbar.dart';

class HomeController extends GetxController {
  final RxBool isLoading = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController periodeC = TextEditingController();
  TextEditingController jabatanC = TextEditingController();
  var periodeItem = [
    'Quarter 1',
    'Quarter 2',
    'Quarter 3',
  ];
  var jabatanUnitItem = [
    'VP Remunerisasi & Manj. Kinerja/Departement Remunerasi & Manj. Kinerja',
  ];
  Stream<DocumentSnapshot<Map<String, dynamic>>> streamRole() async* {
    String uid = auth.currentUser!.uid;

    yield* firestore.collection("users").doc(uid).snapshots();
  }

  void addKpi() async {
    if (periodeC.text.isEmpty) {
      notifSnackBar('Error', 'Periode tidak boleh kosong');
    } else if (jabatanC.text.isEmpty) {
      notifSnackBar('Error', 'Jabatan tidak boleh kosong');
    } else {
      isLoading.value = true;
      log(isLoading.value.toString());
      String uid = auth.currentUser!.uid;
      await firestore.collection("users").doc(uid).get().then((value) => {
            firestore.collection("kpi").add({
              "atasan1": value.data()!['atasan1'],
              "atasan2": value.data()!['atasan2'],
              "atasan3": value.data()!['atasan3'],
              "badge": value.data()!['badge'],
              "jabatan": jabatanC.text,
              "nama": value.data()!['nama'],
              "perusahaan": value.data()!['perusahaan'],
              "periode": periodeC.text,
              "unitKerja": value.data()!['unitKerja'],
              "status": ["Draft"],
              "createdAt": DateTime.now(),
              "updatedAt": DateTime.now(),
            }).then((value2) => {
                  firestore.collection("users").doc(uid).update({
                    "kpi": FieldValue.arrayUnion([value2.id]),
                  }),
                  firestore.collection("users").doc(value.data()!['uidAtasan']).update({
                    "kpi": FieldValue.arrayUnion([value2.id]),
                  }),
                  firestore.collection("kpi").doc(value2.id).update({
                    "id": value2.id,
                  }),
                  Get.back(),
                  Get.toNamed(Routes.DETAIL_KPI, arguments: value2.id)
                })
          });
      isLoading.value = false;
      log(isLoading.value.toString());
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getListHistoryKpi() async* {
    String uid = auth.currentUser!.uid;
    final docUser = await firestore.collection("users").doc(uid).get();
    List<dynamic> listKpi = docUser.data()!['kpi'];
    yield* firestore
        .collection("kpi")
        .where("id", whereIn: listKpi)
        .orderBy("updatedAt", descending: true)
        .limit(2)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSumKpi() async* {
    String uid = auth.currentUser!.uid;
    final docUser = await firestore.collection("users").doc(uid).get();
    List<dynamic> listKpi = docUser.data()!['kpi'];
    yield* firestore.collection("kpi").where("id", whereIn: listKpi).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSumMonitoring() async* {
    String uid = auth.currentUser!.uid;
    final docUser = await firestore.collection("users").doc(uid).get();
    List<dynamic> listKpi = docUser.data()!['kpi'];
    yield* firestore
        .collection("kpi")
        .where("id", whereIn: listKpi)
        .where("status", arrayContains: "Monitoring")
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSumPenilaian() async* {
    String uid = auth.currentUser!.uid;
    final docUser = await firestore.collection("users").doc(uid).get();
    List<dynamic> listKpi = docUser.data()!['kpi'];
    yield* firestore
        .collection("kpi")
        .where("id", whereIn: listKpi)
        .where("status", arrayContains: "Penilaian")
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSumOnTrack() async* {
    String uid = auth.currentUser!.uid;
    final docUser = await firestore.collection("users").doc(uid).get();
    List<dynamic> listKpi = docUser.data()!['kpi'];
    yield* firestore
        .collection("kpi")
        .where("id", whereIn: listKpi)
        .where("status", arrayContains: "OnTrack")
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSumBehindTarget() async* {
    String uid = auth.currentUser!.uid;
    final docUser = await firestore.collection("users").doc(uid).get();
    List<dynamic> listKpi = docUser.data()!['kpi'];
    yield* firestore
        .collection("kpi")
        .where("id", whereIn: listKpi)
        .where("status", arrayContains: "BehindTarget")
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSumInactive() async* {
    String uid = auth.currentUser!.uid;
    final docUser = await firestore.collection("users").doc(uid).get();
    List<dynamic> listKpi = docUser.data()!['kpi'];
    yield* firestore
        .collection("kpi")
        .where("id", whereIn: listKpi)
        .where("status", arrayContains: "Inactive")
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getListKpiAtasan() async* {
    yield* firestore.collection("kpi").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getListKpiApprovalAtasan() async* {
    String uid = auth.currentUser!.uid;
    final docUser = await firestore.collection("users").doc(uid).get();
    List<dynamic> listKpi = docUser.data()!['kpi'];
    log(name: "Approval Atasan", listKpi.toString());
    yield* firestore
        .collection("kpi")
        .where("id", whereIn: listKpi)
        .where("status", arrayContains: "Pending")
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getListHistoryKpiAtasan() async* {
    String uid = auth.currentUser!.uid;
    final docUser = await firestore.collection("users").doc(uid).get();
    List<dynamic> listKpi = docUser.data()!['kpi'];
    yield* firestore
        .collection("kpi")
        .where("id", whereIn: listKpi)
        .orderBy("updatedAt", descending: true)
        .limit(2)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSumMonitoringAtasan() async* {
    yield* firestore.collection("kpi").where("status", arrayContains: "Monitoring").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSumPenilaianAtasan() async* {
    yield* firestore.collection("kpi").where("status", arrayContains: "Penilaian").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSumOnTrackAtasan() async* {
    yield* firestore.collection("kpi").where("status", arrayContains: "OnTrack").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSumBehindTargetAtasan() async* {
    yield* firestore.collection("kpi").where("status", arrayContains: "BehindTarget").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSumInactiveAtasan() async* {
    yield* firestore.collection("kpi").where("status", arrayContains: "Inactive").snapshots();
  }
}
