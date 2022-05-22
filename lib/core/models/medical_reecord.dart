class MedicalRecord {
  String? medicalRecordId;
  String? doctorName;
  String? doctorId;
  String? patientName;
  String? patientId;
  String? problem;
  String? precaution;
  DateTime? addedAt;

  MedicalRecord({
    this.medicalRecordId,
    this.doctorName,
    this.patientName,
    this.addedAt,
    this.doctorId,
    this.patientId,
    this.precaution,
    this.problem,
  });

  MedicalRecord.fromJson(json, id) {
    this.medicalRecordId = id;
    this.doctorName = json['doctorName'];
    this.patientName = json['patientName'];
    this.addedAt = json['addedAt'].toDate();
    this.doctorId = json['doctorId'];
    this.patientId = json['patientId'];
    this.precaution = json['precaution'] ?? "";
    this.problem = json['problem'];
  }
}
