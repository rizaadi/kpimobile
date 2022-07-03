import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController pass2C = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> signUp() async {
    if (emailC.text.isNotEmpty &&
        passC.text.isNotEmpty &&
        pass2C.text.isNotEmpty) {
      if (passC.text == pass2C.text) {
        try {
          isLoading.value = true;
          UserCredential userCredential =
              await auth.createUserWithEmailAndPassword(
                  email: emailC.text, password: passC.text);
          if (userCredential.user != null) {
            String uId = userCredential.user!.uid;

            await firestore.collection("karyawan").doc(uId).set({
              "uid": uId,
              "email": emailC.text,
              "password": passC.text,
              "role": "karyawan",
              "createdAt": DateTime.now().toIso8601String(),
              "updatedAt": DateTime.now().toIso8601String(),
            });
            isLoading.value = false;
            Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
          }
          isLoading.value = false;
        } on FirebaseAuthException catch (e) {
          isLoading.value = false;
          if (e.code == 'weak-password') {
            Get.snackbar('Terjadi Kesalahan', 'Password terlalu lemah');
          } else if (e.code == 'email-already-in-use') {
            Get.snackbar('Terjadi Kesalahan', 'Email sudah terdaftar');
          }
        } catch (e) {
          isLoading.value = false;
          Get.snackbar('Terjadi Kesalahan', e.toString());
        }
      } else {
        Get.snackbar('Terjadi Kesalahan', 'Password tidak sama');
      }
    } else {
      Get.snackbar(
          'Terjadi Kesalahan', 'Email dan Password tidak boleh kosong');
    }
  }
}
