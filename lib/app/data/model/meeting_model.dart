class Meeting {
  int? id;
  String? meetingTitle;
  String? meetingDeskripsi;
  String? meetingKategori;
  String? meetingStatus;
  String? meetingSchedule;
  String? meetingAddress;
  String? meetingEvaluation;
  String? createdAt;
  String? updatedAt;

  Meeting(
      {this.id,
      this.meetingTitle,
      this.meetingDeskripsi,
      this.meetingKategori,
      this.meetingStatus,
      this.meetingSchedule,
      this.meetingAddress,
      this.meetingEvaluation,
      this.createdAt,
      this.updatedAt});

  Meeting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    meetingTitle = json['meeting_title'];
    meetingDeskripsi = json['meeting_deskripsi'];
    meetingKategori = json['meeting_kategori'];
    meetingStatus = json['meeting_status'];
    meetingSchedule = json['meeting_schedule'];
    meetingAddress = json['meeting_address'];
    meetingEvaluation = json['meeting_evaluation'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['meeting_title'] = this.meetingTitle;
    data['meeting_deskripsi'] = this.meetingDeskripsi;
    data['meeting_kategori'] = this.meetingKategori;
    data['meeting_status'] = this.meetingStatus;
    data['meeting_schedule'] = this.meetingSchedule;
    data['meeting_address'] = this.meetingAddress;
    data['meeting_evaluation'] = this.meetingEvaluation;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
