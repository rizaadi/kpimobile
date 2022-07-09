import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpimobile/app/routes/app_pages.dart';

class HomeController extends GetxController {
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
    'Jabatan/Unit Kerja',
    'Jabatan/Unit Kerja 2',
  ];
  Stream<DocumentSnapshot<Map<String, dynamic>>> streamRole() async* {
    String uid = auth.currentUser!.uid;

    yield* firestore.collection("users").doc(uid).snapshots();
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
            "tanggal": DateTime.now(),
          }).then((value) => {
                firestore.collection("users").doc(uid).update({
                  "kpi": FieldValue.arrayUnion([value.id]),
                }),
                firestore.collection("kpi").doc(value.id).update({
                  "id": value.id,
                }),
                Get.back(),
                Get.toNamed(Routes.DETAIL_KPI, arguments: value.id)
              })
        });
  }
}
