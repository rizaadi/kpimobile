import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_controller.dart';

class SignupPage extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 52, 16, 0),
                child: Text('Create account', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Text(
                      'Enter your account details below or',
                    ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: const EdgeInsets.only(left: 3)),
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "login",
                        style: TextStyle(fontWeight: FontWeight.w600, decoration: TextDecoration.underline),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text("Email"),
                  TextField(
                    controller: controller.emailC,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(6)),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text("Password"),
                  TextField(
                    controller: controller.passC,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(6)),
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text("Confirm Password"),
                  TextField(
                    controller: controller.pass2C,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(6)),
                    ),
                  ),
                ]),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
                child: Obx(() => ElevatedButton(
                      onPressed: controller.isLoading.isFalse
                          ? () async {
                              controller.isLoading.value = true;
                              await controller.signUp();
                              controller.isLoading.value = false;
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 23),
                          primary: const Color(0xff26A0C9),
                          minimumSize: const Size.fromHeight(50),
                          shadowColor: const Color.fromARGB(255, 80, 207, 250),
                          elevation: 10),
                      child: controller.isLoading.isFalse
                          ? const Text(
                              "Create account",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                            )
                          : const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                    )),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
