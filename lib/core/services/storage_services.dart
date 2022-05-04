import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageServices {
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadUserProfileImage(File image, String uuid) async {
    // final imagePath = image.path;
    try {
      var reference = _storage.ref().child("userProfileImages/$uuid");
      var uploadImage = reference.putFile(image);
      TaskSnapshot snapshot =
          await uploadImage.whenComplete(() => print('User image uploaded'));
      final imageUrl = snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print("Exception@userImageUpdate ===> $e");
      return null;
    }
  }
}
