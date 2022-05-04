import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_page_route.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/rounded_buton.dart';
import 'package:doctors_de_peshawar/ui/screens/auth/sign_in_screen/sign_in_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/auth/sign_up_screen/sign_up_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
      child: Consumer<SignUpProvider>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            backgroundColor: lightBlueColor,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: model.forrmKey,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Image.asset(
                          'assets/logos/logo2.png',
                          scale: 2.3,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Image.asset('assets/images/auth_image.png'),
                        SizedBox(
                          height: 20,
                        ),
                        // Text(
                        //   "Mobile Number",
                        //   style: TextStyle(
                        //       fontSize: 20, fontWeight: FontWeight.bold),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Text("The code will be sent to mobile number"),
                        SizedBox(
                          height: 20,
                        ),

                        ///
                        /// Email
                        ///
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Username"),
                        ),
                        Card(
                          child: TextFormField(
                            onChanged: (value) {
                              model.appUser.userName = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter username";
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 12),
                              hintText: 'username',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        ///
                        /// phone number
                        ///
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Phone Number"),
                        ),
                        Card(
                          child: TextFormField(
                            onChanged: (value) {
                              model.appUser.phoneNumber = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter valid phone number";
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 12),
                              hintText: 'Enter phone number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        ///
                        /// date of brith
                        ///
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Date of birth"),
                        ),
                        Card(
                          child: GestureDetector(
                            onTap: () {
                              _showDatePicker(context, model);
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 10),
                              height: 47,
                              width: double.infinity,
                              child: model.appUser.dateOfBirth == null
                                  ? Text("Pick date of birth")
                                  : Text("${model.appUser.dateOfBirth}"),
                            ),
                          ),
                          // TextFormField(
                          //   onChanged: (value) {
                          //     model.appUser.dateOfBirth = value;
                          //   },
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return "Please enter date of birth";
                          //     }
                          //   },
                          //   decoration: InputDecoration(
                          //     contentPadding:
                          //         EdgeInsets.symmetric(horizontal: 12),
                          //     hintText: 'Enter Date of birth',
                          //     border: OutlineInputBorder(
                          //       borderSide: BorderSide.none,
                          //     ),
                          //   ),
                          // ),
                        ),
                        SizedBox(height: 10),

                        ///
                        /// Email
                        ///
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Email"),
                        ),
                        Card(
                          child: TextFormField(
                            onChanged: (value) {
                              model.appUser.email = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter valid email";
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 12),
                              hintText: 'Enter email',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        ///
                        /// Password
                        ///
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("Password"),
                        ),
                        Card(
                          child: TextFormField(
                            obscureText: true,
                            onChanged: (value) {
                              model.appUser.password = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter password";
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 12),
                              hintText: 'password',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text("Already have an account?"),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  CustomPageRoute(
                                    page: SignInScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Sign in",
                                style:
                                    TextStyle(color: blueColor, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        RoundedButton(
                          onPressed: () {
                            model.signUpUser(context);
                            // model.verifyPhoneNumber(context);
                          },
                          title: "Continue",
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///
  /// Pick date
  ///
  Future<void> _showDatePicker(
      BuildContext context, SignUpProvider model) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950, 8),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      model.pickBirthday(picked);
    }
  }
}
