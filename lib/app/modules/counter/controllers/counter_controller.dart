import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  final count = 0.obs;
  @override
  void increment() {
    if (count.value < 100) {
      count.value++;
    } else {
      Get.snackbar('warning', 'maksimum value',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
          icon: Icon(Icons.notifications));
    }
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    } else {
      Get.snackbar('warning', 'maksimum value',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
          icon: Icon(Icons.notifications));
    }
  }
}
