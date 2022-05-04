import 'package:doctors_de_peshawar/ui/custom_widget/custom_back_button.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_page_route.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/rounded_buton.dart';
import 'package:doctors_de_peshawar/ui/screens/profile_screen/edit_profile_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/profile_screen/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  // const ProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: Consumer<ProfileProvider>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text("Profile"),
            centerTitle: true,
            leading: CustomBackButton(),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    model.currentUser.appUser.userImageUrl == null
                        ? CircleAvatar(
                            radius: 60,
                          )
                        : CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                "${model.currentUser.appUser.userImageUrl}"),
                          ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "Name",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Row(
                              children: [
                                Icon(Icons.person),
                                SizedBox(width: 20),
                                Text("${model.currentUser.appUser.userName}"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "Phone number",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Row(
                              children: [
                                Icon(Icons.phone),
                                SizedBox(width: 20),
                                Text(
                                    "${model.currentUser.appUser.phoneNumber}"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            "Date of birth",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Row(
                              children: [
                                Icon(Icons.calendar_today),
                                SizedBox(width: 20),
                                Text(
                                    "${model.currentUser.appUser.dateOfBirth}"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        RoundedButton(
                          title: "Update Profile",
                          onPressed: () {
                            Navigator.push(
                              context,
                              CustomPageRoute(
                                page: EditProfileScreen(),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
