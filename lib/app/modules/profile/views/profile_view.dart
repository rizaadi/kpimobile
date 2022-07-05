import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kpimobile/app/routes/app_pages.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/theme/theme_config.dart';
import '../../../core/widgets/list_container.dart';
import '../../../core/widgets/list_three_container.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final profileC = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: profileC.streamUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              Map<String, dynamic> user = snapshot.data!.data()!;
              String role = snapshot.data!.data()!["role"];
              return Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profil",
                      style: Get.textTheme.headline5,
                    )
                  ],
                ),
                const SizedBox(height: 19),
                CircleAvatar(
                    radius: 49,
                    backgroundImage: NetworkImage(
                        'https://ui-avatars.com/api/?background=26A0C9&color=fff&name=${user['nama']}')),
                const SizedBox(height: 37),
                ListContainer(
                  title: "Perusahaan",
                  value: "${user['perusahaan']}",
                  color: ThemeConfig.colors.Gray_primary,
                ),
                ListContainer(
                  title: "Nama Karyawan",
                  value: "${user['nama']}",
                  color: Colors.white,
                ),
                ListContainer(
                  title: "Badge",
                  value: "${user['badge']}",
                  color: ThemeConfig.colors.Gray_primary,
                ),
                ListContainer(
                  title: "Jabatan",
                  value: "${user['jabatan']}",
                  color: Colors.white,
                ),
                ListContainer(
                  title: "Unit Kerja",
                  value: "${user['unitKerja']}",
                  color: ThemeConfig.colors.Gray_primary,
                ),
                role == "Karyawan"
                    ? ListThreeContainer(
                        name1: "${user['atasan1']}",
                        name2: "${user['atasan2']}",
                        name3: "${user['atasan3']}",
                        color: Colors.white,
                      )
                    : const SizedBox(),
                Container(
                  color: ThemeConfig.colors.Gray_primary,
                  width: Get.width,
                  height: 1,
                ),
                const SizedBox(height: 16),
                Obx(() => ElevatedButton.icon(
                    onPressed: profileC.isLoading.isFalse
                        ? () async {
                            if (profileC.isLoading.isFalse) {
                              profileC.isLoading.value = true;
                              await FirebaseAuth.instance.signOut();
                              profileC.isLoading.value = false;
                              Get.offAllNamed(Routes.LOGIN);
                            }
                          }
                        : null,
                    icon: SvgPicture.asset('assets/icons/log-out.svg'),
                    label: profileC.isLoading.isFalse
                        ? const Text("Logout")
                        : const CircularProgressIndicator(
                            color: Colors.white,
                          )))
              ]);
            } else {
              return const Center(child: Text("No Data"));
            }
          }),
    )));
  }
}
