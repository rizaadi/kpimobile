import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn() async {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailC.text,
          password: passC.text,
        );
        if (userCredential.user != null) {
          isLoading.value = false;
          Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
        }
        isLoading.value = false;
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        if (e.code == 'user-not-found') {
          Get.snackbar('Terjadi Kesalahan', 'User tidak ditemukan');
        } else if (e.code == 'wrong-password') {
          Get.snackbar('Terjadi Kesalahan', 'Password salah');
        }
      }
    } else {
      Get.snackbar('Terjadi Kesalahan', 'Email dan Password tidak boleh kosong');
    }
  }
}
