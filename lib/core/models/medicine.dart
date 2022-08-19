class Medicine {
  String? medicalRecordId;
  String? medicineName;
  String? instruction;
  String? medicineId;

  Medicine({
    this.medicineName,
    this.instruction,
    this.medicalRecordId,
    this.medicineId,
  });

  Medicine.formJson(json, id) {
    this.medicineId = id;
    this.medicineName = json['medicineName'];
    this.instruction = json['instruction'];
    this.medicalRecordId = json['medicalRecordId'];
  }
}
