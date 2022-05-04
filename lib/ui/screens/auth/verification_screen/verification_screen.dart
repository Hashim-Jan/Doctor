// import 'package:doctors_de_peshawar/core/constants/colors.dart';
// import 'package:doctors_de_peshawar/core/enums/view_state.dart';
// import 'package:doctors_de_peshawar/ui/custom_widget/rounded_buton.dart';
// import 'package:doctors_de_peshawar/ui/screens/auth/sign_in_screen/sign_in_provider.dart';
// import 'package:doctors_de_peshawar/ui/screens/auth/sign_in_screen/sign_in_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:provider/provider.dart';

// class VerificationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SignInProvider>(
//       builder: (context, model, child) => ModalProgressHUD(
//         inAsyncCall: model.state == ViewState.busy,
//         child: Scaffold(
//           backgroundColor: lightBlueColor,
//           body: SingleChildScrollView(
//             child: SafeArea(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 20),
//                     Image.asset(
//                       'assets/logos/logo2.png',
//                       scale: 2.3,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Image.asset('assets/images/auth_image.png'),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       "Verification",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text("Enter the code we have sent to ${model.phoneNumber}"),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Card(
//                       child: TextFormField(
//                         onChanged: (value) {
//                           model.smsCode = value.trim();
//                         },
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.symmetric(horizontal: 12),
//                           hintText: 'Enter code',
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     RoundedButton(
//                       onPressed: () {
//                         model.siginInWithPhone(context);
//                       },
//                       title: "Continue",
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Resend Code",
//                           style: TextStyle(color: Colors.red),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => SignInScreen(),
//                               ),
//                             );
//                           },
//                           child: Text("Change Number"),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
