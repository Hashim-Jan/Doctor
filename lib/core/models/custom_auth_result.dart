import 'package:firebase_auth/firebase_auth.dart';

class CustomAuthResult {
  String? errorMessage;
  User? user;
  bool? status;

  CustomAuthResult({
    this.errorMessage,
    this.user,
    this.status,
  });
}
