class Appointment {
  String? appointmentId;
  String? doctorId;
  String? patientId;
  String? doctorName;
  String? patientName;
  DateTime? appointmentAt;
  String? appointmentFor;
  int? patientAge;
  String? patientCnic;
  String? gender;
  DateTime? appointmentDay;
  String? appointmentTime;
  String? patientContactNumber;

  Appointment({
    this.appointmentId,
    this.doctorId,
    this.patientId,
    this.doctorName,
    this.patientName,
    this.appointmentAt,
    this.appointmentFor,
    this.patientAge,
    this.patientCnic,
    this.gender,
    this.appointmentDay,
    this.appointmentTime,
    this.patientContactNumber,
  });

  Appointment.fromJson(json, id) {
    this.appointmentId = id;
    this.doctorId = json["doctorId"];
    this.patientId = json["patientId"];
    this.doctorName = json["doctorName"];
    this.patientName = json["patientName"];
    this.appointmentAt = json["appointmentAt"].toDate();
    this.appointmentFor = json["appointmentFor"];
    this.patientAge = json["patientAge"];
    this.patientCnic = json["patientCnic"];
    this.gender = json["gender"];
    this.appointmentDay = json["appointmentDay"].toDate();
    this.appointmentTime = json["appointmentTime"];
    this.patientContactNumber = json["patientContactNumber"];
  }

  toJson() {
    return {
      "doctorId": this.doctorId,
      "patientId": this.patientId,
      "doctorName": this.doctorName,
      "patientName": this.patientName,
      "appointmentAt": this.appointmentAt,
      "appointmentFor": this.appointmentFor,
      "patientAge": this.patientAge,
      "patientCnic": this.patientCnic,
      "gender": this.gender,
      "appointmentDay": this.appointmentDay,
      "appointmentTime": this.appointmentTime,
      "patientContactNumber": this.patientContactNumber,
    };
  }
}
