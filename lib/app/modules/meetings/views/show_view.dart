// detail_pasien_view.dart
import 'package:appstate/app/data/model/meeting_model.dart';
import 'package:flutter/material.dart';

class DetailMeetingView extends StatelessWidget {
  final Meeting meeting;

  DetailMeetingView({required this.meeting});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pasien'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${meeting.meetingTitle}'),
            Text('Deskripsi: ${meeting.meetingDeskripsi}'),
            Text('Kategori: ${meeting.meetingKategori}'),
            Text('Status: ${meeting.meetingStatus}'),
            Text('Tanggal: ${meeting.meetingSchedule}'),
            Text('Alamat: ${meeting.meetingAddress}'),
            Text('Evaluasi: ${meeting.meetingEvaluation}'),
          ],
        ),
      ),
    );
  }
}