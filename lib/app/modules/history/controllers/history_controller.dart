import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getListKpi() async* {
    String uid = auth.currentUser!.uid;
    final docUser = await firestore.collection("users").doc(uid).get();
    List<dynamic> listKpi = docUser.data()!['kpi'];
    yield* firestore
        .collection("kpi")
        .where("id", whereIn: listKpi)
        .orderBy("updatedAt", descending: true)
        .snapshots();
  }
}
