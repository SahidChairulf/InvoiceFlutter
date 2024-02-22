import 'package:appstate/app/data/model/meeting_model.dart';
import 'package:appstate/app/modules/meetings/controllers/meetings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditMeetingView extends StatelessWidget {
  final Meeting meeting;
  final MeetingsController controller = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final RxString category = 'Biasa Saja'.obs;
  final RxString status = 'Online'.obs;
  final RxString dateMeeting = ''.obs;
  final TextEditingController addressController = TextEditingController();
  final TextEditingController evaluationController = TextEditingController();

  EditMeetingView({required this.meeting}) {
    titleController.text = meeting.meetingTitle!;
    descriptionController.text = meeting.meetingDeskripsi!;
    category.value = meeting.meetingKategori!;
    status.value = meeting.meetingStatus!;
    dateMeeting.value = meeting.meetingSchedule!;
    addressController.text = meeting.meetingAddress!;
    evaluationController.text = meeting.meetingEvaluation!;
    // Ensure that meeting.meetingStatus is a valid value
    status.value = ['Online', 'Offline'].contains(status.value) ? status.value : 'Online';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      dateMeeting.value = "${picked.year}-${picked.month}-${picked.day}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Meetings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                margin: EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: titleController,
                          decoration:
                              InputDecoration(labelText: 'Masukan Judul'),
                        ),
                        TextFormField(
                          controller: descriptionController,
                          decoration:
                              InputDecoration(labelText: 'Masukan Deskripsi'),
                        ),
                        Obx(
                          () => DropdownButtonFormField<String>(
                            value: category.value,
                            items: ['Biasa Saja', 'Tengah-Tengah', 'Penting']
                                .map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                            onChanged: (newValue) {
                              category.value = newValue!;
                            },
                            decoration:
                                InputDecoration(labelText: 'Kategori Meeting'),
                          ),
                        ),
                        Obx(
                          () => DropdownButtonFormField<String>(
                            value: status.value,
                            items: ['Online', 'Offline']
                                .map((String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                                .toList(),
                            onChanged: (newValue) {
                              status.value = newValue!;
                            },
                            decoration:
                                InputDecoration(labelText: 'Status Meeting'),
                          ),
                        ),
                        InkWell(
                          onTap: () => _selectDate(context),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Tanggal Lahir',
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Obx(() => Text(dateMeeting.value)),
                                Icon(Icons.calendar_today),
                              ],
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: addressController,
                          decoration: InputDecoration(labelText: 'ALAMAT'),
                        ),
                        TextFormField(
                          controller: evaluationController,
                          decoration: InputDecoration(labelText: 'EVALUATION'),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (_validateInput()) {
                              controller.editMeetings(
                                meeting,
                                titleController.text,
                                descriptionController.text,
                                category.value,
                                status.value,
                                dateMeeting.value,
                                addressController.text,
                                evaluationController.text,
                              );
                            }
                          },
                          child: Text('Simpan'),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool _validateInput() {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        category.value.isEmpty ||
        status.value.isEmpty ||
        dateMeeting.value.isEmpty ||
        addressController.text.isEmpty ||
        evaluationController.text.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi');
      return false;
    }
    return true;
  }
}
