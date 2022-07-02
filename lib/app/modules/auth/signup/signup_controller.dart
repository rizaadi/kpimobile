import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController pass2C = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  void signUp() async {
    if (emailC.text.isNotEmpty &&
        passC.text.isNotEmpty &&
        pass2C.text.isNotEmpty) {
      if (passC.text == pass2C.text) {
        try {
          UserCredential userCredential =
              await auth.createUserWithEmailAndPassword(
                  email: emailC.text, password: passC.text);
          Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
          print(userCredential.user);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            Get.snackbar('Terjadi Kesalahan', 'Password terlalu lemah');
          } else if (e.code == 'email-already-in-use') {
            Get.snackbar('Terjadi Kesalahan', 'Email sudah terdaftar');
          }
        } catch (e) {
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
