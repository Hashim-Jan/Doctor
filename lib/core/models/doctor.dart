class Doctor {
  String? doctorId;
  String? docName;
  String? address;
  String? education;
  String? specialist;

  Doctor({
    this.doctorId,
    this.address,
    this.docName,
    this.education,
    this.specialist,
  });

  Doctor.formJson(json, id) {
    this.doctorId = id;
    this.address = json["address"];
    this.docName = json["docName"];
    this.education = json["education"];
    this.specialist = json["specialist"];
  }
}
