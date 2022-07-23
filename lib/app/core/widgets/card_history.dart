import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kpimobile/app/core/widgets/status_badge.dart';
import 'package:kpimobile/app/routes/app_pages.dart';

class CardHistory extends StatelessWidget {
  const CardHistory(
      {Key? key,
      required this.status,
      required this.periode,
      required this.namaPerusahaan})
      : super(key: key);
  final String status;
  final String periode;
  final String namaPerusahaan;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.toNamed(Routes.DETAIL_KPI);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 6),
        color: const Color(0xffEEFAFC),
        elevation: 5,
        shadowColor: const Color(0xffEEFAFC),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(6, 15, 6, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/briefcase.svg',
                          color: Colors.black,
                          height: 12,
                          width: 12,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          namaPerusahaan,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/calendar.svg',
                          color: Colors.black,
                          height: 12,
                          width: 12,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          periode,
                          style: const TextStyle(fontSize: 11),
                        )
                      ],
                    ),
                  ],
                ),
                StatusBadge(status: status)
              ],
            ),
          )
        ]),
      ),
    );
  }
}
