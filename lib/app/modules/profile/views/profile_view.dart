import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:kpimobile/app/routes/app_pages.dart';

import '../../../core/theme/theme_config.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final profileC = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Profil",
              style: Get.textTheme.headline5,
            ),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/edit.svg'))
          ],
        ),
        const SizedBox(height: 19),
        const CircleAvatar(
            radius: 49,
            backgroundImage: NetworkImage(
                'https://s3-alpha.figma.com/profile/46915882-ffc5-4a0c-b3e9-663f14c427e0')),
        const SizedBox(height: 37),
        Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: ThemeConfig.colors.Gray_primary,
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Perusahaan",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "PT. PUPUK INDONESIA",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  )
                ]),
          ),
        ),
        Container(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Nama Karyawan",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "Nendra Ariyanto",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  )
                ]),
          ),
        ),
        Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: ThemeConfig.colors.Gray_primary,
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Bagde", style: TextStyle(fontSize: 12)),
                  Text(
                    "1200051",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  )
                ]),
          ),
        ),
        Container(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Jabatan", style: TextStyle(fontSize: 12)),
                  Text(
                    "VP Remunerisasi & Manj. Kinerja",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  )
                ]),
          ),
        ),
        Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ThemeConfig.colors.Gray_primary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Unit Kerja", style: TextStyle(fontSize: 12)),
                  Expanded(
                    child: Text(
                      "Departement Remunerasi & Manj. Kinerja",
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                  )
                ]),
          ),
        ),
        Container(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Atasan Langsung", style: TextStyle(fontSize: 12)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Joko Wido Harjoso",
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                      Text(
                        "SVP Sumber Daya Manusia",
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                      Text(
                        "Kompartemen Sumber Daya Manusia",
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
        Container(
          color: ThemeConfig.colors.Gray_primary,
          width: Get.width,
          height: 1,
        ),
        const SizedBox(height: 16),
        Obx(() => ElevatedButton.icon(
            onPressed: profileC.isLoading.isFalse ? () async {
              if (profileC.isLoading.isFalse) {
                profileC.isLoading.value = true;
                await FirebaseAuth.instance.signOut();
                profileC.isLoading.value = false;
                Get.offAllNamed(Routes.LOGIN);
              }
            } : null,
            icon: SvgPicture.asset('assets/icons/log-out.svg'),
            label: profileC.isLoading.isFalse
                ? const Text("Logout")
                : const CircularProgressIndicator(
                    color: Colors.white,
                  )))
      ]),
    )));
  }
}
