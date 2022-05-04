import 'dart:io';

import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/core/services/auth_services.dart';
import 'package:doctors_de_peshawar/core/services/database_services.dart';
import 'package:doctors_de_peshawar/core/services/storage_services.dart';
import 'package:doctors_de_peshawar/core/view_model/base_view_model.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_snackbar.dart';
import 'package:doctors_de_peshawar/ui/locator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final currentUser = locator<AuthServices>();
  final ImagePicker pick = ImagePicker();
  StorageServices _storageServices = StorageServices();
  DatabaseServices _databaseServices = DatabaseServices();
  File? userProfileImage;
  String? uploadedImage;
  XFile? image;
  bool isImagePicked = false;
  String? name;
  String? dateOfBirth;
  String? uploadedImagePath;
  bool isProfileUpdated = false;

  updateUserProfile(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      currentUser.appUser.userName = name;
      currentUser.appUser.dateOfBirth = dateOfBirth;
      setState(ViewState.busy);
      uploadedImagePath = await _storageServices.uploadUserProfileImage(
          userProfileImage!, currentUser.appUser.userId!);
      print("uploaded Image path ==> $uploadedImagePath");
      currentUser.appUser.userImageUrl = uploadedImagePath;
      isProfileUpdated =
          await _databaseServices.updateUserProfile(currentUser.appUser);

      setState(ViewState.idle);
      if (isProfileUpdated) {
        customSnackBar(context, "Profile Updated successfully");
      } else {
        customSnackBar(context, "Please try again");
      }

      await Future.delayed(Duration(seconds: 2));
      Navigator.pop(context);
    }
  }

  ///
  /// pick image from gallery
  ///
  pickImageFromGallery() async {
    image = await pick.pickImage(source: ImageSource.gallery, imageQuality: 25);
    if (image != null) {
      userProfileImage = File(image!.path);
      isImagePicked = true;
      notifyListeners();
    }
  }
}
