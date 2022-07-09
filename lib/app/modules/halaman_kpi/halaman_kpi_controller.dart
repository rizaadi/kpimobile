import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HalamanKpiController extends GetxController {
  TextEditingController periodeC = TextEditingController();
  TextEditingController jabatanC = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
        .where("id", whereIn: listKpi)
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
            "tanggal": DateTime.now(),
          }).then((value) => {
                firestore.collection("users").doc(uid).update({
                  "kpi": FieldValue.arrayUnion([value.id]),
                }),
                firestore.collection("kpi").doc(value.id).update({
                  "id": value.id,
                })
              })
        });
  }
}
