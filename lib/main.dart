import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpimobile/app/core/theme/theme_config.dart';
import 'app/core/bindings/application_bindings.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'KPI Mobile',
            initialBinding: ApplicationBindings(),
            initialRoute: snapshot.data != null ? Routes.BOTTOM_NAVIGATION : Routes.LOGIN,
            getPages: AppPages.routes,
            theme: ThemeConfig().getThemeData,
          );
        }),
  );
}
