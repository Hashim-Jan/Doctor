import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_page_route.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/rounded_buton.dart';
import 'package:doctors_de_peshawar/ui/screens/auth/sign_in_screen/sign_in_provider.dart';
import 'package:doctors_de_peshawar/ui/screens/auth/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  // const SignInScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignInProvider(),
      child: Consumer<SignInProvider>(
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
                          child: Text("Email"),
                        ),
                        Card(
                          child: TextFormField(
                            onChanged: (value) {
                              model.appUser.email = value.trim();
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
                              model.appUser.password = value.trim();
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
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("Don't have an account "),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  CustomPageRoute(
                                    page: SignUpScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Sign up",
                                style:
                                    TextStyle(color: blueColor, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        RoundedButton(
                          onPressed: () {
                            model.loginUser(context);
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
}
