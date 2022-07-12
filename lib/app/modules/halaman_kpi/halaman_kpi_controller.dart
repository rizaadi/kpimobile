import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class HalamanKpiController extends GetxController {
  TextEditingController periodeC = TextEditingController();
  TextEditingController jabatanC = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxString role = "".obs;
  var periodeItem = [
    'Quarter 1',
    'Quarter 2',
    'Quarter 3',
  ];
  var jabatanUnitItem = [
    'VP Remunerisasi & Manj. Kinerja/Departement Remunerasi & Manj. Kinerja',
    'Jabatan/Unit Kerja',
    'Jabatan/Unit Kerja 2',
  ];

  Stream<QuerySnapshot<Map<String, dynamic>>> getListKpiKaryawan() async* {
    String uid = auth.currentUser!.uid;
    final docUser = await firestore.collection("users").doc(uid).get();
    List<dynamic> listKpi = docUser.data()!['kpi'];
    yield* firestore
        .collection("kpi")
        .where("id", whereIn: listKpi.isEmpty ? ['lala'] : listKpi)
        .snapshots();
  }

  void addKpi() async {
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
                firestore
                    .collection("users")
                    .doc(value.data()!['uidAtasan'])
                    .update({
                  "kpi": FieldValue.arrayUnion([value2.id]),
                }),
                firestore.collection("kpi").doc(value2.id).update({
                  "id": value2.id,
                }),
                Get.back(),
                Get.toNamed(Routes.DETAIL_KPI, arguments: value2.id)
              })
        });
  }

  getUserRole() async {
    String uid = auth.currentUser!.uid;
    final docUser = await firestore.collection("users").doc(uid).get();
    return docUser.data()!['role'];
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getListKpiAtasan() async* {
    log("getListKpiAtasan");

    yield* firestore.collection("kpi").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>
      getListKpiApprovalAtasan() async* {
    log("getListKpiApprovalAtasan");
    String uid = auth.currentUser!.uid;
    final docUser = await firestore.collection("users").doc(uid).get();
    List<dynamic> listKpi = docUser.data()!['kpi'];
    yield* firestore
        .collection("kpi")
        .where("id", whereIn: listKpi)
        .where("status", arrayContains: "Pending")
        .snapshots();
  }

  @override
  void onInit() {
    super.onInit();
    getUserRole().then((value) {
      role.value = value;
    });
  }
}
