import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  RxString role = "".obs;

  getUserRole() async {
    String uid = auth.currentUser!.uid;
    final docUser = await firestore.collection("users").doc(uid).get();
    return docUser.data()!['role'];
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getNotifKaryawan() async* {
    String uid = auth.currentUser!.uid;
    yield* firestore.collection("users").doc(uid).snapshots();
  }

  @override
  void onInit() {
    super.onInit();
    getUserRole().then((value) {
      role.value = value;
    });
  }
}
