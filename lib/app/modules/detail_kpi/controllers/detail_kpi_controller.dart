import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailKpiController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
    print("${idKpi + id}");
    await firestore
        .collection("kpi")
        .doc(idKpi)
        .collection("kpiuser")
        .doc(id)
        .delete();
    Get.back();
  }
}
