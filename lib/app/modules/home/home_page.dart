import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kpimobile/app/core/widgets/card_history.dart';
import 'package:kpimobile/app/core/widgets/card_monitor.dart';
import 'package:kpimobile/app/core/widgets/card_monitor_admin.dart';
import 'package:kpimobile/app/core/widgets/status_badge.dart';
import 'package:kpimobile/app/routes/app_pages.dart';

import '../../core/theme/theme_config.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Item 1';
  String users = "Atasan";
  final homeC = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: homeC.streamRole(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  String role = snapshot.data!.data()!['role'];
                  Map<String, dynamic> user = snapshot.data!.data()!;
                  if (role == "Karyawan") {
                    return ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        const SizedBox(height: 38),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Hello",
                                    style: Get.theme.textTheme.headline5),
                                Text(
                                  "${user['nama']}",
                                  style: Get.theme.textTheme.headline5
                                      ?.copyWith(fontWeight: FontWeight.normal),
                                )
                              ],
                            ),
                            CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                    'https://ui-avatars.com/api/?background=26A0C9&color=fff&name=${user['nama']}')),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text("Status KPI",
                            style: Get.theme.textTheme.subtitle1
                                ?.copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 13),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.HALAMANKPI);
                              },
                              child: StreamBuilder<
                                      QuerySnapshot<Map<String, dynamic>>>(
                                  stream: homeC.getSumOnTrack(),
                                  builder: (context, snapshot) {
                                    var kpi = snapshot.data?.docs.length ?? 0;
                                    if (snapshot.hasData) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.none:
                                          return const CardMonitor(
                                            status: 'On Track',
                                            value: '-',
                                          );
                                        case ConnectionState.waiting:
                                          return const CircularProgressIndicator();
                                        case ConnectionState.active:
                                        case ConnectionState.done:
                                          return CardMonitor(
                                            status: 'On Track',
                                            value: kpi.toString(),
                                          );
                                        default:
                                          break;
                                      }
                                    }
                                    return const CardMonitor(
                                      status: 'On Track',
                                      value: '-',
                                    );
                                  }),
                            )),
                            const SizedBox(width: 6),
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.HALAMANKPI);
                              },
                              child: StreamBuilder<
                                      QuerySnapshot<Map<String, dynamic>>>(
                                  stream: homeC.getSumBehindTarget(),
                                  builder: (context, snapshot) {
                                    var kpi = snapshot.data?.docs.length ?? 0;
                                    if (snapshot.hasData) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.none:
                                          return const CardMonitor(
                                            status: 'Behind Target',
                                            value: '-',
                                          );
                                        case ConnectionState.waiting:
                                          return const CircularProgressIndicator();
                                        case ConnectionState.active:
                                        case ConnectionState.done:
                                          return CardMonitor(
                                            status: 'Behind Target',
                                            value: kpi.toString(),
                                          );
                                        default:
                                          break;
                                      }
                                    }
                                    return const CardMonitor(
                                      status: 'Behind Target',
                                      value: '-',
                                    );
                                  }),
                            )),
                            const SizedBox(width: 6),
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.HALAMANKPI);
                              },
                              child: StreamBuilder<
                                      QuerySnapshot<Map<String, dynamic>>>(
                                  stream: homeC.getSumInactive(),
                                  builder: (context, snapshot) {
                                    var kpi = snapshot.data?.docs.length ?? 0;
                                    if (snapshot.hasData) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.none:
                                          return const CardMonitor(
                                            status: 'Inactive',
                                            value: '-',
                                          );
                                        case ConnectionState.waiting:
                                          return const CircularProgressIndicator();
                                        case ConnectionState.active:
                                        case ConnectionState.done:
                                          return CardMonitor(
                                            status: 'Inactive',
                                            value: kpi.toString(),
                                          );
                                        default:
                                          break;
                                      }
                                    }
                                    return const CardMonitor(
                                      status: 'Inactive',
                                      value: '-',
                                    );
                                  }),
                            )),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text("Approval Request",
                            style: Get.theme.textTheme.subtitle1
                                ?.copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 13),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.HALAMANKPI);
                              },
                              child: StreamBuilder<
                                      QuerySnapshot<Map<String, dynamic>>>(
                                  stream: homeC.getSumKpi(),
                                  builder: (context, snapshot) {
                                    var kpi = snapshot.data?.docs.length ?? 0;
                                    if (snapshot.hasData) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.none:
                                          return const CardMonitor(
                                            status: 'KPI',
                                            value: '-',
                                          );
                                        case ConnectionState.waiting:
                                          return const CircularProgressIndicator();
                                        case ConnectionState.active:
                                        case ConnectionState.done:
                                          return CardMonitor(
                                            status: 'KPI',
                                            value: kpi.toString(),
                                          );
                                        default:
                                          break;
                                      }
                                    }
                                    return const CardMonitor(
                                      status: 'KPI',
                                      value: '-',
                                    );
                                  }),
                            )),
                            const SizedBox(width: 6),
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.HALAMANKPI);
                              },
                              child: StreamBuilder<
                                      QuerySnapshot<Map<String, dynamic>>>(
                                  stream: homeC.getSumMonitoring(),
                                  builder: (context, snapshot) {
                                    var kpi = snapshot.data?.docs.length ?? 0;
                                    if (snapshot.hasData) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.none:
                                          return const CardMonitor(
                                            status: 'Monitoring',
                                            value: '-',
                                          );
                                        case ConnectionState.waiting:
                                          return const CircularProgressIndicator();
                                        case ConnectionState.active:
                                        case ConnectionState.done:
                                          return CardMonitor(
                                            status: 'Monitoring',
                                            value: kpi.toString(),
                                          );
                                        default:
                                          break;
                                      }
                                    }
                                    return const CardMonitor(
                                      status: 'Monitoring',
                                      value: '-',
                                    );
                                  }),
                            )),
                            const SizedBox(width: 6),
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.HALAMANKPI);
                              },
                              child: StreamBuilder<
                                      QuerySnapshot<Map<String, dynamic>>>(
                                  stream: homeC.getSumPenilaian(),
                                  builder: (context, snapshot) {
                                    var kpi = snapshot.data?.docs.length ?? 0;
                                    if (snapshot.hasData) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.none:
                                          return const CardMonitor(
                                            status: 'Penilaian',
                                            value: '-',
                                          );
                                        case ConnectionState.waiting:
                                          return const CircularProgressIndicator();
                                        case ConnectionState.active:
                                        case ConnectionState.done:
                                          return CardMonitor(
                                            status: 'Penilaian',
                                            value: kpi.toString(),
                                          );
                                        default:
                                          break;
                                      }
                                    }
                                    return const CardMonitor(
                                      status: 'Penilaian',
                                      value: '-',
                                    );
                                  }),
                            )),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("KPI Terakhir",
                                style: Get.theme.textTheme.subtitle1
                                    ?.copyWith(fontWeight: FontWeight.w600)),
                            TextButton(
                                onPressed: () {
                                  //FIXME : belum muncul detail kpi
                                  Get.toNamed(Routes.HALAMANKPI);
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  "Lihat Semua",
                                  style: Get.theme.textTheme.bodyText2,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Flexible(
                          child: StreamBuilder<
                                  QuerySnapshot<Map<String, dynamic>>>(
                              stream: homeC.getListHistoryKpi(),
                              builder: (context, snapshot) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data?.docs.length ?? 0,
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic>? kpi = snapshot
                                        .data?.docs
                                        .elementAt(index)
                                        .data();
                                    // log(name: "HIstoryHome", kpi.toString());
                                    if (snapshot.hasData) {
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.none:
                                          return const Text("No Connections");
                                        case ConnectionState.waiting:
                                          return const CircularProgressIndicator();
                                        case ConnectionState.active:
                                        case ConnectionState.done:
                                          return CardHistory(
                                            namaPerusahaan: kpi?['perusahaan'],
                                            periode: kpi?['periode'],
                                            status: kpi?['status'][0],
                                          );
                                        default:
                                          break;
                                      }
                                    }
                                    return const Text("No data");
                                  },
                                );
                              }),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "KPI",
                          style: Get.theme.textTheme.subtitle1
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                            icon: const Icon(Icons.zoom_out_map_outlined),
                            label: const Text("Tambah KPI"),
                            onPressed: () {
                              Get.defaultDialog(
                                  title: "Form penyusunan KPI individu",
                                  textCancel: "Cancel",
                                  textConfirm: "Selanjutnya",
                                  radius: 10,
                                  titleStyle: const TextStyle(fontSize: 16),
                                  titlePadding: const EdgeInsets.all(16),
                                  contentPadding: const EdgeInsets.all(16),
                                  buttonColor: Get.theme.primaryColor,
                                  cancelTextColor:
                                      ThemeConfig.colors.Black_primary,
                                  confirmTextColor: Colors.white,
                                  cancel: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary:
                                              ThemeConfig.colors.Gray_primary),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        "Batal",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  confirm: ElevatedButton(
                                      onPressed: () {
                                        controller.addKpi();
                                      },
                                      child: const Text("Selanjutnya")),
                                  content: SizedBox(
                                    width: Get.width,
                                    child: Column(
                                      children: [
                                        DropdownButtonFormField(
                                            isExpanded: true,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            hint: const Text(
                                                "Periode Penyusunan KPI"),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            items: controller.periodeItem
                                                .map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items,
                                                    style: const TextStyle(
                                                        fontSize: 13)),
                                              );
                                            }).toList(),
                                            onChanged: (String? value) {
                                              controller.periodeC.text = value!;
                                            }),
                                        const SizedBox(height: 16),
                                        DropdownButtonFormField(
                                            isExpanded: true,
                                            hint: const Text(
                                                "Jabatan / Unit Kerja"),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            items: controller.jabatanUnitItem
                                                .map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(
                                                  items,
                                                  style: const TextStyle(
                                                      fontSize: 13),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? value) {
                                              controller.jabatanC.text = value!;
                                            })
                                      ],
                                    ),
                                  ));
                            })
                      ],
                    );
                  } else {
                    //! ADMIN PAGE
                    return ListView(
                      // padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        Container(
                          width: Get.width,
                          padding: const EdgeInsets.fromLTRB(16, 38, 16, 25),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  radius: 35,
                                  backgroundImage: NetworkImage(
                                      'https://ui-avatars.com/api/?background=26A0C9&color=fff&name=${user['nama']}')),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user['nama'],
                                    style: Get.theme.textTheme.headline5
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  const StatusBadge(status: "Admin")
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.HALAMANKPI);
                                    },
                                    child: CardMonitorAdmin(
                                      status: 'On Track',
                                      value: '1',
                                    ),
                                  )),
                                  const SizedBox(width: 6),
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.HALAMANKPI);
                                    },
                                    child: CardMonitorAdmin(
                                      status: 'Behind Target',
                                      value: '19',
                                    ),
                                  )),
                                  const SizedBox(width: 6),
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.HALAMANKPI);
                                    },
                                    child: CardMonitorAdmin(
                                      status: 'Inactive',
                                      value: '1',
                                    ),
                                  )),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: GestureDetector(
                                          onTap: () {
                                            Get.toNamed(Routes.HALAMANKPI);
                                          },
                                          child: CardMonitorAdmin(
                                            status: 'KPI',
                                            value: '7',
                                          ))),
                                  const SizedBox(width: 6),
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.HALAMANKPI);
                                    },
                                    child: CardMonitorAdmin(
                                      status: 'Monitoring',
                                      value: '4',
                                    ),
                                  )),
                                  const SizedBox(width: 6),
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.HALAMANKPI);
                                    },
                                    child: CardMonitorAdmin(
                                      status: 'Penilaian',
                                      value: '12',
                                    ),
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "KPI",
                                  style: Get.theme.textTheme.subtitle1
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.HALAMANKPI,
                                              arguments: "approval");
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 20, 20, 13),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.32),
                                                      blurRadius: 29,
                                                      spreadRadius: 0,
                                                      offset:
                                                          const Offset(0, 10))
                                                ]),
                                            child: Column(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/check-circle.svg',
                                                  color: ThemeConfig
                                                      .colors.Blue_primary,
                                                  height: 36,
                                                  width: 36,
                                                ),
                                                const SizedBox(height: 6),
                                                Text("Approval",
                                                    style: Get
                                                        .textTheme.subtitle1!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                StreamBuilder<
                                                        QuerySnapshot<
                                                            Map<String,
                                                                dynamic>>>(
                                                    stream: controller
                                                        .getListKpiApprovalAtasan(),
                                                    builder:
                                                        (context, snapshot) {
                                                      var sumKpi = snapshot.data
                                                              ?.docs.length ??
                                                          "0";
                                                      if (snapshot.hasData) {
                                                        switch (snapshot
                                                            .connectionState) {
                                                          case ConnectionState
                                                              .none:
                                                            return const Text(
                                                                "- Waiting Approval");
                                                          case ConnectionState
                                                              .waiting:
                                                            return const CircularProgressIndicator();
                                                          case ConnectionState
                                                              .active:
                                                          case ConnectionState
                                                              .done:
                                                            return Text(
                                                                "$sumKpi Waiting Approval");
                                                          default:
                                                            break;
                                                        }
                                                      }
                                                      return const Text(
                                                          "- Waiting Approval");
                                                    })
                                              ],
                                            )),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.HALAMANKPI,
                                              arguments: "listkpi");
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 20, 20, 13),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.32),
                                                      blurRadius: 29,
                                                      spreadRadius: 0,
                                                      offset:
                                                          const Offset(0, 10))
                                                ]),
                                            child: Column(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/list.svg',
                                                  color: ThemeConfig
                                                      .colors.Blue_primary,
                                                  height: 36,
                                                  width: 36,
                                                ),
                                                const SizedBox(height: 6),
                                                Text("List KPI",
                                                    style: Get
                                                        .textTheme.subtitle1!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                StreamBuilder<
                                                        QuerySnapshot<
                                                            Map<String,
                                                                dynamic>>>(
                                                    stream: controller
                                                        .getListKpiAtasan(),
                                                    builder:
                                                        (context, snapshot) {
                                                      var sumKpi = snapshot.data
                                                              ?.docs.length ??
                                                          "0";
                                                      if (snapshot.hasData) {
                                                        switch (snapshot
                                                            .connectionState) {
                                                          case ConnectionState
                                                              .none:
                                                            return const Text(
                                                                "- KPI");
                                                          case ConnectionState
                                                              .waiting:
                                                            return const CircularProgressIndicator();
                                                          case ConnectionState
                                                              .active:
                                                          case ConnectionState
                                                              .done:
                                                            return Text(
                                                                "$sumKpi KPI");
                                                          default:
                                                            break;
                                                        }
                                                      }
                                                      return const Text(
                                                          "- KPI");
                                                    })
                                              ],
                                            )),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                        const SizedBox(height: 30),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("KPI Terakhir",
                                        style: Get.theme.textTheme.subtitle1
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600)),
                                    TextButton(
                                        onPressed: () {
                                          Get.toNamed(Routes.HALAMANKPI);
                                        },
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: Size.zero,
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        child: Text(
                                          "Lihat Semua",
                                          style: Get.theme.textTheme.bodyText2,
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 13,
                                ),
                                StreamBuilder<
                                        QuerySnapshot<Map<String, dynamic>>>(
                                    stream: homeC.getListHistoryKpiAtasan(),
                                    builder: (context, snapshot) {
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            snapshot.data?.docs.length ?? 0,
                                        itemBuilder: (context, index) {
                                          Map<String, dynamic>? kpi = snapshot
                                              .data?.docs
                                              .elementAt(index)
                                              .data();
                                          // log(name: "HIstoryHome", kpi.toString());
                                          if (snapshot.hasData) {
                                            switch (
                                                snapshot.connectionState) {
                                              case ConnectionState.none:
                                                return const Text(
                                                    "No Connections");
                                              case ConnectionState.waiting:
                                                return const CircularProgressIndicator();
                                              case ConnectionState.active:
                                              case ConnectionState.done:
                                                return CardHistory(
                                                  namaPerusahaan:
                                                      kpi?['perusahaan'],
                                                  periode: kpi?['periode'],
                                                  status: kpi?['status'][0],
                                                );
                                              default:
                                                break;
                                            }
                                          }
                                          return const Text("No data");
                                        },
                                      );
                                    }),
                              ],
                            )),
                      ],
                    );
                  }
                })));
  }
}
