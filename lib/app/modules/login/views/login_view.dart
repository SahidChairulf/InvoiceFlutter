import 'package:appstate/helpers/size_helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final LoginController loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
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
                              "LOGIN",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            TextFormField(
                              onChanged: loginController.onUsernameChanged,
                              decoration: InputDecoration(
                                hintText: "User Name",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            TextFormField(
                              onChanged: loginController.onPasswordChanged,
                              decoration: InputDecoration(
                                hintText: "Password",
                                border: OutlineInputBorder(),
                              ),
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
                                    loginController.login();
                                    // Get.to(OutputPayment());
                                  },
                                )),
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                              children: [
                                Text('already have an account?'),
                                SizedBox(
                                  width: 18,
                                ),
                                ElevatedButton(
                                  onPressed: () =>
                                      loginController.goToRegister(),
                                  child: Text('register'),
                                ),
                              ],
                            )
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
      ),
    );
  }
}
