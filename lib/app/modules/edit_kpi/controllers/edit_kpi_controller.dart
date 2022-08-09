import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditKpiController extends GetxController {
  TextEditingController kategoriC = TextEditingController();
  TextEditingController kraC = TextEditingController();
  TextEditingController deskripsiC = TextEditingController();
  TextEditingController rumusC = TextEditingController();
  TextEditingController bobotC = TextEditingController();
  TextEditingController targetC = TextEditingController();
  TextEditingController satuanC = TextEditingController();
  TextEditingController sumberDataC = TextEditingController();
  TextEditingController perhatianC = TextEditingController();
  TextEditingController nilai4C = TextEditingController();
  TextEditingController nilai3C = TextEditingController();
  TextEditingController nilai2C = TextEditingController();
  TextEditingController nilai1C = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var kategoriItem = [
    'STRATEGIS',
    'TEKNIS',
  ];
  var kra = [
    'Laba Bersih',
    'Gap ROIC to WACC',
    'Realisasi Biaya Rutin Unit Kerja',
    'Gap Pelaksanaan Program Kerja Strategis Unit Kerja',
    'Indeks Kepuasan Kerja & Keterikatan Karyawan PI Holding',
    'Peningkatan Akhlak Value Internalization Index PI Holding',
  ];
  var ktgrItm = "";
  var krazItm = "";

  updateText(argum) {
    kategoriC.text = argum[0]['kategori'];
    deskripsiC.text = argum[0]['deskripsi'];
    kraC.text = argum[0]['kra'];
    rumusC.text = argum[0]['rumus'];
    bobotC.text = argum[0]['bobot'].toString();
    targetC.text = argum[0]['target'];
    satuanC.text = argum[0]['satuan'];
    sumberDataC.text = argum[0]['sumberData'];
    perhatianC.text = argum[0]['perhatian'];
    nilai4C.text = argum[0]['nilai4'];
    nilai3C.text = argum[0]['nilai3'];
    nilai2C.text = argum[0]['nilai2'];
    nilai1C.text = argum[0]['nilai1'];
  }

  updateKpi(idKpi, id) async {
    await firestore.collection("kpi").doc(idKpi).collection("kpiuser").doc(id).update({
      "kategori": kategoriC.text,
      "kra": kraC.text,
      "deskripsi": deskripsiC.text,
      "rumus": rumusC.text,
      "bobot": int.tryParse(bobotC.text)!.toInt(),
      "target": targetC.text,
      "satuan": satuanC.text,
      "sumberData": sumberDataC.text,
      "perhatian": perhatianC.text,
      "nilai4": nilai4C.text,
      "nilai3": nilai3C.text,
      "nilai2": nilai2C.text,
      "nilai1": nilai1C.text,
      "updatedAt": DateTime.now(),
    });
    Get.back();
  }
}
