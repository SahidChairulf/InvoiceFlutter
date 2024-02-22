import 'package:appstate/helpers/size_helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
   RegisterView({Key? key}) : super(key: key);
   final RegisterController registerController = RegisterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 4,
                    margin: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "REGISTER",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            SizedBox(
                                height: 18,
                              ),
                              TextFormField(
                                onChanged: registerController.onFullnameChanged,
                                decoration: InputDecoration(
                                  hintText: "Full Name",
                                  border: OutlineInputBorder(),
                                ),
                                // onChanged: (value) =>
                                //     paymentController.fullName.value = value,
                              ),
                               SizedBox(
                                height: 18,
                              ),
                              TextFormField(
                                onChanged: registerController.onUsernameChanged,
                                decoration: InputDecoration(
                                  hintText: "User Name",
                                  border: OutlineInputBorder(),
                                ),
                                // onChanged: (value) =>
                                //     paymentController.fullName.value = value,
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              TextFormField(
                                onChanged: registerController.onEmailChanged,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  border: OutlineInputBorder(),
                                ),
                                // onChanged: (value) =>
                                //     paymentController.fullName.value = value,
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              TextFormField(
                                onChanged: registerController.onPasswordChanged,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  border: OutlineInputBorder(),
                                ),
                                // onChanged: (value) =>
                                //     paymentController.fullName.value = value,
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              SizedBox(
                                  width: displayHeight(context) * 0.8,
                                  height: displayHeight(context) * 0.075,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  10),
                                          side: BorderSide(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      "Sumbit",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                     onPressed: () {
                                    registerController.register();
                                    // Get.to(OutputPayment());
                                  },
                                  )),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
