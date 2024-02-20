import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/formulir_controller.dart';

import 'package:intl/intl.dart';

class FormulirView extends GetView<FormulirController> {
  FormulirView({Key? key}) : super(key: key);

  final FormulirController formulirController = FormulirController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FormulirView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Nama'),
                          onChanged: (value) =>
                              formulirController.nama.value = value,
                        ),
                        SizedBox(height: 16.0),
                        InkWell(
                          onTap: () => formulirController.selectDate(context),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Date Lahir',
                              hintText: 'Pick Date',
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Date Lahir'),
                                Obx(() {
                                  return Text(
                                    'Selected Date: ${formulirController.tanggalLahir.value}',
                                    style: TextStyle(fontSize: 16),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        DropdownButtonFormField(
                          items: [
                            'islam',
                            'kristen',
                            'hindu',
                            'budha',
                            'lainya',
                          ]
                              .map((agama) => DropdownMenuItem(
                                  value: agama, child: Text(agama)))
                              .toList(),
                          onChanged: (value) =>
                              formulirController.agama.value = value.toString(),
                          decoration: InputDecoration(labelText: 'Agama'),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          children: [
                            Obx(() => Radio(
                                value: 'Laki-Laki',
                                groupValue:
                                    formulirController.jenisKelamin.value,
                                onChanged: (value) => formulirController
                                    .jenisKelamin.value = value!)),
                            Text('Laki-Laki'),
                            Obx(() => Radio(
                                value: 'Perempuan',
                                groupValue:
                                    formulirController.jenisKelamin.value,
                                onChanged: (value) => formulirController
                                    .jenisKelamin.value = value!)),
                            Text('Perempuan')
                          ],
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          maxLines: 3,
                          decoration: InputDecoration(labelText: 'Alamat'),
                          onChanged: (value) =>
                              formulirController.alamat.value = value,
                        ),
                        SizedBox(height: 16.0),
                        for (String hobi in formulirController.getHobiList())
                          Obx(() => CheckboxListTile(
                              title: Text(hobi),
                              value: formulirController.hobi.contains(hobi),
                              onChanged: (value) =>
                                  formulirController.toggleHobi(hobi))),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () => formulirController.submitForm(),
                          child: Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Obx(() {
                    if (formulirController.isFormSubmitted.value) {
                      return Text(
                        'Output: ${formulirController.nama} , ${formulirController.tanggalLahir} , ${formulirController.agama} ,${formulirController.jenisKelamin} , ${formulirController.alamat} , ${formulirController.hobi}',
                        style: TextStyle(fontSize: 16.0),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }),
                ],
              )),
        ));
  }
}
