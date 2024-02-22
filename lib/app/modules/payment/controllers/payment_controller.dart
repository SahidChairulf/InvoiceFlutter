import 'package:appstate/app/modules/payment/views/payment_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentController extends GetxController {
  var fullName = ''.obs;
  var placeBirth = ''.obs;
  var dateBirth = ''.obs;
  var gender = 'Laki-Laki'.obs;
  var email = ''.obs;
  var country = ''.obs;
  var cardNumber = ''.obs;
  var experiedDate = ''.obs;
  var age = ''.obs;

  final List<String> membershipList = ['Regular', 'Gold', 'Platinum', 'VIP'];

  var selectedMember = ''.obs;
  var description = ''.obs;
  var totalHarga = 0.0.obs; // Mengubah menjadi double

  var membership = <String>[].obs;
  List<String> getMembershipList() => membershipList;
  var isFormSubmitted = false.obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      dateBirth.value = formattedDate;

      // Menghitung umur
      final birthDate = picked;
      final currentDate = DateTime.now();
      final ageValue = currentDate.year - birthDate.year + (currentDate.month > birthDate.month || (currentDate.month == birthDate.month && currentDate.day >= birthDate.day) ? 0 : -1);
      // Set nilai umur
      age.value = ageValue.toString();

      // Experied Date
    }
  }

  // experiedDate
  Future<void> selectExperiedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      // Tambahkan 7 hari ke tanggal yang dipilih
      final experiedDateValue = picked.add(Duration(days: 7));

      final formattedDateExperied =
          DateFormat('yyyy-MM-dd').format(experiedDateValue);
      experiedDate.value = formattedDateExperied;
    }
  }

  void toggleMembership(String membershipValue) {
    selectedMember.value = membershipValue;
    totalHarga.value = ListDetail();
  }

  double ListDetail() {
    if (selectedMember.value == 'Regular') {
      description.value = 'Anggota satu bulan';
      return 50000.0;
    } else if (selectedMember.value == 'Gold') {
      description.value = 'Anggota satu bulan + cemilan gratis';
      return 150000.0;
    } else if (selectedMember.value == 'Platinum') {
      description.value =
          'Anggota satu bulan + cemilan + keliling Indonesia gratis';
      return 250000.0;
    } else if (selectedMember.value == 'VIP') {
      description.value =
          'Anggota satu bulan + cemilan + keliling Indonesia gratis + layanan VIP';
      return 500000.0;
    } else {
      description.value = '';
      return 0.0;
    }
  }

  void submitForm() {
    print(
        'Biodata: $fullName ,$placeBirth ,$dateBirth ,$gender ,$email ,$country ,${selectedMember.value} ,${cardNumber} ,${experiedDate} , ${totalHarga}');
    isFormSubmitted.value = true;
    Get.back();
  }
}
