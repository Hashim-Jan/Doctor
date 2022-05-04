class AppUser {
  String? userId;
  String? userName;
  String? email;
  String? password;
  String? userImageUrl;
  DateTime? createdAt;
  String? phoneNumber;
  String? dateOfBirth;

  AppUser({
    this.userImageUrl,
    this.userName,
    this.userId,
    this.phoneNumber,
    this.createdAt,
    this.email,
    this.password,
    this.dateOfBirth,
  });

  AppUser.fromJson(json, id) {
    this.userId = id;
    this.userName = json['userName'] ?? "";
    this.userImageUrl = json['userImageUrl'];
    this.phoneNumber = json['phoneNumber'];
    this.createdAt = json['createdAt'].toDate();
    this.email = json['email'];
    this.dateOfBirth = json["dateOfBirth"];
  }

  toJson() {
    return {
      'userId': this.userId,
      'userName': this.userName,
      'userImageUrl': this.userImageUrl,
      'phoneNumber': this.phoneNumber,
      'createdAt': this.createdAt,
      "email": this.email,
      "dateOfBirth": this.dateOfBirth,
    };
  }
}
