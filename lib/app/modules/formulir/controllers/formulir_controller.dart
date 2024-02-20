import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormulirController extends GetxController {
  var nama = ''.obs;
  var tanggalLahir = ''.obs;
  var agama = ''.obs;
  var jenisKelamin = 'laki-laki'.obs;
  var alamat = ''.obs;
  final List<String> hobilist = [
    'Menari',
    'Membaca',
    'Beryanyi',
    'Berenang',
    'Sepak Bola'
  ];
  var hobi = <String>[].obs;

  List<String> getHobiList() => hobilist;

  var isFormSubmitted = false.obs;
  // var selectedDate = ''.obs;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      tanggalLahir.value = formattedDate;
    }
  }

  void toggleHobi(String hobiValue) {
    if (hobi.contains(hobiValue)) {
      hobi.remove(hobiValue);
    } else {
      hobi.add(hobiValue);
    }
  }

  void submitForm() {
    print(
        'Biodata: $nama ,$tanggalLahir ,$agama ,$jenisKelamin ,$alamat ,${hobi.value}');
    isFormSubmitted.value = true;
  }
}
