import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailKpiController extends GetxController {
  TextEditingController gradingC = TextEditingController();
  TextEditingController pencapaianC = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  RxString role = "".obs;
  var gradingItem = [
    '4. > 10',
    '4. > 5',
    '4. > 81',
    '4. > 16',
    '4. > 33',
    '4. > 100',
  ];

  Stream<DocumentSnapshot<Map<String, dynamic>>> getDetailKpiKaryawan(
      uid) async* {
    yield* firestore.collection("kpi").doc(uid).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getListKpiKaryawan(uid) async* {
    yield* firestore
        .collection("kpi")
        .doc(uid)
        .collection("kpiuser")
        .snapshots();
  }

  deleteKpiUser(idKpi, id) async {
    await firestore
        .collection("kpi")
        .doc(idKpi)
        .collection("kpiuser")
        .doc(id)
        .delete()
        .then((value) => {totalBobot(idKpi)});
    Get.back();
  }

  //FIXME: DELETE atasan user error
  deleteKpi(idKpi) async {
    String uid = auth.currentUser!.uid;
    await firestore.collection("kpi").doc(idKpi).delete().then((value) => {
          firestore.collection('users').doc(uid).update({
            'kpi': FieldValue.arrayRemove([idKpi])
          }),
          firestore.collection("users").doc(uid).get().then((value) => {
                firestore
                    .collection("users")
                    .doc(value.data()!['uidAtasan'])
                    .update({
                  'kpi': FieldValue.arrayRemove([idKpi])
                }),
              })
        });
    Get.back();
  }

  submitKpi(idKpi) async {
    await firestore.collection("kpi").doc(idKpi).update({
      "status": ["Pending", "Monitoring"],
      "updatedAt": DateTime.now(),
    });
    final docKpi = await firestore.collection("kpi").doc(idKpi).get();
    await firestore
        .collection("users")
        .where('uid', isEqualTo: docKpi.data()!['uid'])
        .get()
        .then((value) => {
              firestore
                  .collection("users")
                  .doc(value.docs[0].data()['uidAtasan'])
                  .update({
                "notif": FieldValue.arrayUnion([
                  {
                    "nama": docKpi.data()!['nama'],
                    "periode": docKpi.data()!['periode'],
                    "tanggal": DateTime.now(),
                  }
                ])
              })
            });
    Get.back();
  }

  terimaKpi(idKpi) async {
    await firestore.collection("kpi").doc(idKpi).update({
      "status": ["Selesai", "Penilaian"],
      "updatedAt": DateTime.now(),
    });
    final docKpi = await firestore.collection("kpi").doc(idKpi).get();
    await firestore
        .collection("users")
        .where("uidAtasan", isEqualTo: auth.currentUser!.uid)
        .get()
        .then((value) => {
              value.docs.forEach((element) => {
                    firestore
                        .collection("users")
                        .doc(element.data()['uid'])
                        .update({
                      "notif": FieldValue.arrayUnion([
                        {
                          "nama": element.data()['nama'],
                          "periode": docKpi.data()!['periode'],
                          "status": "Disetujui",
                          "tanggal": DateTime.now(),
                        }
                      ])
                    })
                  })
            });
    Get.back();
  }

  tolakKpi(idKpi) async {
    await firestore.collection("kpi").doc(idKpi).update({
      "status": ["Ditolak", "Monitoring"],
      "updatedAt": DateTime.now(),
    });
    //delete field percapaian & grading in collection kpiuser
    await firestore
        .collection("kpi")
        .doc(idKpi)
        .collection("kpiuser")
        .get()
        .then((value) => {
              value.docs.forEach((element) => {
                    firestore
                        .collection("kpi")
                        .doc(idKpi)
                        .collection("kpiuser")
                        .doc(element.id)
                        .update({
                      "pencapaian": FieldValue.delete(),
                      "grading": FieldValue.delete(),
                    })
                  })
            });
    //notif karyawan
    final docKpi = await firestore.collection("kpi").doc(idKpi).get();
    await firestore
        .collection("users")
        .where("uidAtasan", isEqualTo: auth.currentUser!.uid)
        .get()
        .then((value) => {
              value.docs.forEach((element) => {
                    firestore
                        .collection("users")
                        .doc(element.data()['uid'])
                        .update({
                      "notif": FieldValue.arrayUnion([
                        {
                          "nama": element.data()['nama'],
                          "periode": docKpi.data()!['periode'],
                          "status": "Ditolak",
                          "tanggal": DateTime.now(),
                        }
                      ])
                    })
                  })
            });

    Get.back();
  }

  totalBobot(idKpi) async {
    num total = 0;
    await firestore
        .collection("kpi")
        .doc(idKpi)
        .collection("kpiuser")
        .get()
        .then((value) {
      for (var element in value.docs) {
        total += element.data()['bobot'];
      }
    }).then((value) => {
              firestore.collection("kpi").doc(idKpi).update({
                "totalBobot": total,
              })
            });
  }

  getUserRole() async {
    String uid = auth.currentUser!.uid;
    final docUser = await firestore.collection("users").doc(uid).get();
    return docUser.data()!['role'];
  }

  addPencapaianKPIAtasan(idKpi, idKpiUser) async {
    if (pencapaianC.text.isEmpty) {
      Get.snackbar("Error", "Pencapaian tidak boleh kosong");
    } else {
      await firestore
          .collection("kpi")
          .doc(idKpi)
          .collection("kpiuser")
          .doc(idKpiUser)
          .update({
        "pencapaian": pencapaianC.text,
        "updatedAt": DateTime.now(),
      });
      Get.back();
    }
  }

  addGradingKPIAtasan(idKpi, idKpiUser) async {
    if (gradingC.text.isEmpty || gradingC.text == "Kosong") {
      Get.snackbar("Error", "Grading tidak boleh kosong");
    } else {
      await firestore
          .collection("kpi")
          .doc(idKpi)
          .collection("kpiuser")
          .doc(idKpiUser)
          .update({
        "grading": gradingC.text,
        "updatedAt": DateTime.now(),
      });
      Get.back();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUserRole().then((value) {
      role.value = value;
    });
  }
}
