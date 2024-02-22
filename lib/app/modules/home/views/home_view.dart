import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'HomeView is working',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/profile');
            },
            child: Text('Move To Profile Page'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/counter');
            },
            child: Text('Move To Counter Page'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/formulir');
            },
            child: Text('Move To Formulir Page'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/payment');
            },
            child: Text('Move To Payment Page'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/login');
            },
            child: Text('Move To Login Page'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/meetings');
            },
            child: Text('Move To Meeting Page'),
          ),
        ],
      )),
    );
  }
}
