import 'package:appstate/app/data/model/meeting_model.dart';
import 'package:appstate/app/modules/meetings/views/edit_view.dart';
import 'package:appstate/app/modules/meetings/views/show_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/meetings_controller.dart';

class MeetingsView extends GetView<MeetingsController> {
  MeetingsView({Key? key}) : super(key: key);
  final MeetingsController controller = Get.put(MeetingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MeetingsView'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Get.toNamed('/tambah-meetings');
              },
            ),
          ],
        ),
        body: Obx(() => controller.meetingList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.meetingList.length,
                itemBuilder: (context, index) {
                  var meeting = controller.meetingList[index];
                  return ListTile(
                    title: Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Nama Meeting : ${meeting.meetingTitle ?? "Default Title"}',
                              // Other Text widget properties...
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Get.to(() => EditMeetingView(meeting: meeting));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.visibility),
                              onPressed: () {
                                Get.to(
                                    () => DetailMeetingView(meeting: meeting));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                // Show a confirmation dialog before deleting
                                showDeleteConfirmation(context, meeting);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )));
  }

  void showDeleteConfirmation(BuildContext context, Meeting meeting) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Pasien'),
          content:
              Text('Are you sure you want to delete ${meeting.meetingTitle}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Call the deletePasien method from the controller
                controller.deleteMeeting(meeting);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
