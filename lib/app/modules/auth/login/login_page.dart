import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpimobile/app/routes/app_pages.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 52, 16, 0),
              child: Text('Welcome Back!',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Text('Login below or'),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.only(left: 3)),
                    onPressed: () {
                      Get.toNamed(Routes.SIGNUP);
                    },
                    child: const Text(
                      "create an account",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email"),
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(6)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Password"),
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(6)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                  ]),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
              child: ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 23),
                    primary: const Color(0xff26A0C9),
                    minimumSize: const Size.fromHeight(50),
                    shadowColor: const Color.fromARGB(255, 80, 207, 250),
                    elevation: 10),
                child: const Text(
                  "Sign in",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
