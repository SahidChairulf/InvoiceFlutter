import 'dart:convert';

import 'package:appstate/app/data/model/meeting_model.dart';
import 'package:appstate/app/modules/meetings/views/show_view.dart';
import 'package:appstate/app/providers/api.dart';
import 'package:appstate/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MeetingsController extends GetxController {
  //TODO: Implement MeetingsController
  var meetingList = <Meeting>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var apiUrl = '${Api.baseUrl}meeting';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body)['rows'];
        // print('Api Respoonse $jsonResponse');
        meetingList
            .assignAll(jsonResponse.map((model) => Meeting.fromJson(model)));
      } else {
        throw Exception('Failed to load meeting');
      }
    } catch (e) {
      print('Error during fetching meeting: $e');
    }
  }

  //  fungsi create,
  Future<void> tambahMeetings(
    String meeting_title,
    String meeting_deskripsi,
    String meeting_kategori,
    String meeting_status,
    String meeting_schedule,
    String meeting_address,
  ) async {
    try {
      if (meeting_title.isEmpty ||
          meeting_deskripsi.isEmpty ||
          meeting_kategori.isEmpty ||
          meeting_status.isEmpty ||
          meeting_schedule.isEmpty ||
          meeting_address.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}meeting/add';
      var headers = await Api.getHeaders();

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'meeting_title': meeting_title,
          'meeting_deskripsi': meeting_deskripsi,
          'meeting_kategori': meeting_kategori,
          'meeting_status': meeting_status,
          'meeting_schedule': meeting_schedule,
          'meeting_address': meeting_address,
        },
      );

      if (response.statusCode == 200 ) {
        Get.snackbar('Sukses', 'meeting berhasil ditambahkan');
        fetchData();
        Get.offAndToNamed(Routes.MEETINGS);
      } else {
        print(response.statusCode);
        throw Exception('Failed to add meeting: ${response.body}');
      }
    } catch (e) {
      print('Error during tambah meeting: $e');
      if (e is http.Response) {
        print('Response Body: ${e.body}');
      }
    }
  }

  // edit meetings
  Future<void> editMeetings(
    Meeting meeting,
    String meeting_title,
    String meeting_deskripsi,
    String meeting_kategori,
    String meeting_status,
    String meeting_schedule,
    String meeting_address,
    String meeting_evaluation
  ) async {
    try {
      if (meeting_title.isEmpty ||
          meeting_deskripsi.isEmpty ||
          meeting_kategori.isEmpty ||
          meeting_status.isEmpty ||
          meeting_schedule.isEmpty ||
          meeting_address.isEmpty ||
          meeting_evaluation.isEmpty) {
        Get.snackbar('Error', 'Semua field harus diisi');
        return;
      }

      var apiUrl = '${Api.baseUrl}meeting/${meeting.id}';
      print('API URL: $apiUrl');

      var headers = await Api.getHeaders();

      var response = await http.put(
        Uri.parse(apiUrl),
        headers: headers,
        body: {
          'meeting_title': meeting_title,
          'meeting_deskripsi': meeting_deskripsi,
          'meeting_kategori': meeting_kategori,
          'meeting_status': meeting_status,
          'meeting_schedule': meeting_schedule,
          'meeting_address': meeting_address,
          'meeting_evaluation' : meeting_evaluation
        },
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', 'Pasien berhasil diubah');
        print(response.statusCode);

        fetchData(); // Refresh the pasienList
        Get.offAndToNamed(Routes.MEETINGS);
      } else {
        throw Exception('Failed to edit pasien');
      }
    } catch (e) {
      print('Error during edit pasien: $e');
    }
  }

  // show pasien
  void showPasienDetails(Meeting meeting) {
    Get.to(() => DetailMeetingView(meeting: meeting));
  }


  // delete pasien
  Future<void> deleteMeeting(Meeting meeting) async {
    try {
      var apiUrl = '${Api.baseUrl}meeting/${meeting.id}';
      var headers = await Api.getHeaders();

      var response = await http.delete(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.snackbar('Sukses', ' berhasil dihapus');
        fetchData();
        // Optionally, you can navigate to a different page after deletion
      } else {
        throw Exception('Failed to delete pasien');
      }
    } catch (e) {
      print('Error during delete pasien: $e');
    }
  }
}
