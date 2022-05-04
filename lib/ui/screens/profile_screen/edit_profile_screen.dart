import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/core/constants/styles.dart';
import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_back_button.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/rounded_buton.dart';
import 'package:doctors_de_peshawar/ui/screens/profile_screen/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  // const EditProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: Consumer<ProfileProvider>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Edit profile"),
              centerTitle: true,
              leading: CustomBackButton(),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: model.formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          model.userProfileImage == null
                              ? CircleAvatar(
                                  radius: 60,
                                )
                              : CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      FileImage(model.userProfileImage!),
                                ),
                          GestureDetector(
                            onTap: () {
                              model.pickImageFromGallery();
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.camera_alt,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        onChanged: (value) {
                          model.name = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your name";
                          }
                        },
                        decoration: searchStyle.copyWith(
                          hintText: "Your name",
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        onChanged: (value) {
                          model.dateOfBirth = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter correct Date of Birth";
                          }
                        },
                        decoration: searchStyle.copyWith(
                          hintText: "Your date of birth",
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      RoundedButton(
                        title: "Save",
                        onPressed: () {
                          model.updateUserProfile(context);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
