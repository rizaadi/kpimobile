import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxList allKpi = [].obs;
  RxList results = [].obs;
  final _selectedChip = 10.obs;
  get selectedChip => _selectedChip.value;
  set selectedChip(index) => _selectedChip.value = index;

  Stream<QuerySnapshot<Map<String, dynamic>>> getListKpi() async* {
    String uid = auth.currentUser!.uid;
    final docUser = await firestore.collection("users").doc(uid).get();
    List<dynamic> listKpi = docUser.data()!['kpi'];
    log(name: 'historyLog', listKpi.toString());
    yield* firestore
        .collection("kpi")
        .where("id", whereIn: listKpi.isEmpty ? ['lala'] : listKpi)
        .orderBy("updatedAt", descending: true)
        .snapshots();
  }

  filterChip(int index) async {
    if (index == 0) {
      results.value = allKpi
          .where((item) => item['status'].toString().contains("Ditolak"))
          .toList();
    } else if (index == 1) {
      results.value = allKpi
          .where((item) => item['status'].toString().contains("Pending"))
          .toList();
    } else if (index == 2) {
      results.value = allKpi
          .where((item) => item['status'].toString().contains("Selesai"))
          .toList();
    } else if (index == 3) {
      results.value = allKpi
          .where((item) => item['status'].toString().contains("Draft"))
          .toList();
    } else {
      results.value = allKpi;
    }
  }

  @override
  void onInit() {
    super.onInit();
    results.value = allKpi;
  }
}
