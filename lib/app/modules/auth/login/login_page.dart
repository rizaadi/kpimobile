import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginPage'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: const Text('LoginPage',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 6, 16, 0),
            child: const Text('Login below or create an account'),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 48, 16, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Email"),
              const TextField(),
            ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(16, 48, 16, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Password"),
              const TextField(),
            ]),
          ),
          Center(
            child: ElevatedButton(onPressed: () {}, child: Text("Login")),
          )
        ],
      ),
    );
  }
}
