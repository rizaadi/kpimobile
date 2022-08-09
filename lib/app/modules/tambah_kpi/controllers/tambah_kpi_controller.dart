import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TambahKpiController extends GetxController {
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
  TextEditingController catatanC = TextEditingController();
  RxBool isTextEmpty = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addGetKpi(idKpi) async {
    String uid = auth.currentUser!.uid;
    await firestore.collection("kpi").doc(idKpi).collection("kpiuser").add({
      "catatan": [
        {"isiCatatan": catatanC.text, "tanggal": DateTime.now(), "uid": uid}
      ],
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
      "createdAt": DateTime.now(),
      "updatedAt": DateTime.now(),
    }).then((value) => {
          firestore.collection("kpi").doc(idKpi).update({
            "totalBobot": FieldValue.increment(int.tryParse(bobotC.text)!.toInt()),
          })
        });
  }

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
  void validatorText() {
    if (kategoriC.text.isEmpty) {
      isTextEmpty.value = true;
      Get.snackbar('Terjadi Kesalahan', 'Kategori tidak boleh kosong');
    } else if (kraC.text.isEmpty) {
      isTextEmpty.value = true;
      Get.snackbar('Terjadi Kesalahan', 'KRA tidak boleh kosong');
    } else if (deskripsiC.text.isEmpty) {
      isTextEmpty.value = true;
      Get.snackbar('Terjadi Kesalahan', 'Deskripsi tidak boleh kosong');
    } else if (rumusC.text.isEmpty) {
      isTextEmpty.value = true;
      Get.snackbar('Terjadi Kesalahan', 'Rumus tidak boleh kosong');
    } else if (bobotC.text.isEmpty) {
      isTextEmpty.value = true;
      Get.snackbar('Terjadi Kesalahan', 'Bobot tidak boleh kosong');
    } else if (targetC.text.isEmpty) {
      isTextEmpty.value = true;
      Get.snackbar('Terjadi Kesalahan', 'Target tidak boleh kosong');
    } else if (satuanC.text.isEmpty) {
      isTextEmpty.value = true;
      Get.snackbar('Terjadi Kesalahan', 'Satuan tidak boleh kosong');
    } else if (sumberDataC.text.isEmpty) {
      isTextEmpty.value = true;
      Get.snackbar('Terjadi Kesalahan', 'Sumber Data tidak boleh kosong');
    } else if (perhatianC.text.isEmpty) {
      isTextEmpty.value = true;
      Get.snackbar('Terjadi Kesalahan', 'Perlu Perhatian tidak boleh kosong');
    } else if (nilai4C.text.isEmpty) {
      isTextEmpty.value = true;
      Get.snackbar('Terjadi Kesalahan', 'Nilai 4 tidak boleh kosong');
    } else if (nilai3C.text.isEmpty) {
      isTextEmpty.value = true;
      Get.snackbar('Terjadi Kesalahan', 'Nilai 3 tidak boleh kosong');
    } else if (nilai2C.text.isEmpty) {
      isTextEmpty.value = true;
      Get.snackbar('Terjadi Kesalahan', 'Nilai 2 tidak boleh kosong');
    } else if (nilai1C.text.isEmpty) {
      isTextEmpty.value = true;
      Get.snackbar('Terjadi Kesalahan', 'Nilai 1 tidak boleh kosong');
    } else if (catatanC.text.isEmpty) {
      isTextEmpty.value = true;
      Get.snackbar('Terjadi Kesalahan', 'Catatan tidak boleh kosong');
    } else if (int.tryParse(bobotC.text) is! int) {
      isTextEmpty.value = true;
      Get.snackbar('Terjadi Kesalahan', 'Bobot harus angka');
    } else {
      isTextEmpty.value = false;
    }
  }
}
