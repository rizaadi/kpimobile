import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DetailKpiController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
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
}
