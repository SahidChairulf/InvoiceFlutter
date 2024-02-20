import 'package:appstate/app/modules/payment/views/payment_output_view.dart';
import 'package:appstate/helpers/size_helper.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  PaymentView({Key? key}) : super(key: key);
  final PaymentController paymentController = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PaymentView'),
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
                                "INVOICE",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Full Name",
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) =>
                                    paymentController.fullName.value = value,
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Place Brith",
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) =>
                                    paymentController.placeBirth.value = value,
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              InkWell(
                                onTap: () =>
                                    paymentController.selectDate(context),
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    hintText: "Date Birth",
                                    border: OutlineInputBorder(),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Date Birth'),
                                      Obx(() {
                                        return Text(
                                          'Selected Date: ${paymentController.dateBirth.value}',
                                          style: TextStyle(fontSize: 16),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Row(
                                children: [
                                  Obx(() => Radio(
                                      value: 'Laki-Laki',
                                      groupValue:
                                          paymentController.gender.value,
                                      onChanged: (value) => paymentController
                                          .gender.value = value!)),
                                  Text('Laki-Laki'),
                                  Obx(() => Radio(
                                      value: 'Perempuan',
                                      groupValue:
                                          paymentController.gender.value,
                                      onChanged: (value) => paymentController
                                          .gender.value = value!)),
                                  Text('Perempuan')
                                ],
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "email",
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) =>
                                    paymentController.email.value = value,
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Country",
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) =>
                                    paymentController.country.value = value,
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              for (String membership
                                  in paymentController.getMembershipList())
                                Obx(() => CheckboxListTile(
                                    title: Text(membership),
                                    value: paymentController
                                            .selectedMember.value ==
                                        membership,
                                    onChanged: (value) => paymentController
                                        .toggleMembership(membership))),
                              SizedBox(
                                height: 18,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Card Number",
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) =>
                                    paymentController.cardNumber.value = value,
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              InkWell(
                                onTap: () =>
                                    paymentController.selectExperiedDate(context),
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    hintText: "Experied Date",
                                    border: OutlineInputBorder(),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Experied Date'),
                                      Obx(() {
                                        return Text(
                                          'Selected Date: ${paymentController.experiedDate.value}',
                                          style: TextStyle(fontSize: 16),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Obx(() {
                                if (paymentController
                                    .selectedMember.isNotEmpty) {
                                  return Column(
                                    children: [
                                      Text(
                                        'Harga Yang Harus di Bayar: ${paymentController.totalHarga}',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Deskripsi: ${paymentController.description}',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  );
                                } else {
                                  return SizedBox.shrink();
                                }
                              }),
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
                                      // paymentController.submitForm();
                                      Get.to(OutputPayment());
                                    },
                                  )),
                              // Obx(() {
                              //   if (paymentController.isFormSubmitted.value) {
                              //     return Text(
                              //       'Output: ${paymentController.fullName} , ${paymentController.placeBirth} , ${paymentController.dateBirth} ,${paymentController.gender} , ${paymentController.email} , ${paymentController.country} , ${paymentController.membership} ,${paymentController.cardNumber} ,${paymentController.experiedDate}',
                              //       style: TextStyle(fontSize: 16.0),
                              //     );
                              //   } else {
                              //     return SizedBox.shrink();
                              //   }
                              // }),
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
        ));
  }
}
