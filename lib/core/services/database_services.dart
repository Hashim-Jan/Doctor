import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_de_peshawar/core/models/appuser.dart';

class DatabaseServices {
  final _ref = FirebaseFirestore.instance;
  registerUser(AppUser appUser) async {
    try {
      await _ref
          .collection("Patient")
          .doc(appUser.userId)
          .set(appUser.toJson());
    } catch (e) {
      print('Exception@registerPatient ===> $e');
    }
  }

  Future<AppUser> getUser(String id) async {
    try {
      final snapshot = await _ref.collection("Patient").doc(id).get();
      return AppUser.fromJson(snapshot.data(), snapshot.id);
    } catch (e) {
      print('Exception@getPatient ===> $e');
      return AppUser();
    }
  }

  Future<bool> updateUserProfile(AppUser appUser) async {
    try {
      await _ref
          .collection("Patient")
          .doc(appUser.userId)
          .update(appUser.toJson());
      return true;
    } catch (e) {
      print('Exception@updatePatient ===> $e');
      return false;
    }
  }
}
