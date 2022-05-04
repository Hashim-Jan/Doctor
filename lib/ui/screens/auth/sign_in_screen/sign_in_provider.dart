import 'dart:async';
import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/core/models/appuser.dart';
import 'package:doctors_de_peshawar/core/models/custom_auth_result.dart';
import 'package:doctors_de_peshawar/core/services/auth_services.dart';
import 'package:doctors_de_peshawar/core/view_model/base_view_model.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_page_route.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_snackbar.dart';
import 'package:doctors_de_peshawar/ui/locator.dart';
import 'package:doctors_de_peshawar/ui/screens/auth/verification_screen/verification_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/dashboard_screen/dashboard_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class SignInProvider extends BaseViewModel {
  final forrmKey = GlobalKey<FormState>();
  AppUser appUser = AppUser();
  CustomAuthResult customAuthResult = CustomAuthResult();
  final _authServices = locator<AuthServices>();

  loginUser(BuildContext context) async {
    setState(ViewState.busy);
    customAuthResult = await _authServices.loginUser(appUser);
    setState(ViewState.idle);
    if (customAuthResult.user != null) {
      Navigator.pushReplacement(
        context,
        CustomPageRoute(
          page: DashboardScreen(),
        ),
      );
    } else {
      customSnackBar(context, customAuthResult.errorMessage!);
    }
  }
  // String code = "+92";
  // String number = "";
  // String phoneNumber = '';
  // String smsCode = '';
  // String? country = '';
  // bool isVerify = false;
  // late Timer _timer;
  // int otpTime = 60;
  // bool isTimeExpired = false;

  // ///
  // /// verify phone number
  // ///
  // verifyPhoneNumber(BuildContext context) async {
  //   if (forrmKey.currentState!.validate()) {
  //     phoneNumber = code + number;

  //     print("My phone number ===> $phoneNumber");
  //     notifyListeners();
  //     isVerify = await _authServices.verifyPhoneNumber(phoneNumber);
  //     isTimeExpired = false;
  //     if (isVerify) {
  //       startTimer();
  //     }
  //     Navigator.pushReplacement(
  //       context,
  //       CustomPageRoute(
  //         page: VerificationScreen(),
  //       ),
  //     );
  //   }
  // }

  // ///
  // /// count time
  // ///
  // ///
  // /// start timer for OTP
  // ///
  // void startTimer() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   const oneSecond = Duration(seconds: 1);
  //   _timer = new Timer.periodic(
  //     oneSecond,
  //     (Timer timer) {
  //       if (otpTime == 0) {
  //         timer.cancel();
  //         print("When time 0 Second ====> $otpTime");
  //         isTimeExpired = true;
  //         isVerify = false;
  //         otpTime = 60;
  //         print("Second ====> $otpTime");
  //         notifyListeners();
  //       } else {
  //         otpTime--;
  //         print("Second ====> $otpTime");
  //         notifyListeners();
  //       }
  //     },
  //   );
  // }

  // ///
  // /// Sign in with phone number
  // ///
  // siginInWithPhone(BuildContext context) async {
  //   print("SMS Code ====> $smsCode");

  //   setState(ViewState.busy);
  //   customAuthResult = await _authServices.signInWithPhoneNumber(
  //     smsCode.trim(),
  //     phoneNumber.trim(),
  //   );
  //   setState(ViewState.idle);
  //   if (customAuthResult.user != null && customAuthResult.status == true) {
  //     Navigator.pushReplacement(
  //       context,
  //       CustomPageRoute(
  //         page: DashboardScreen(),
  //       ),
  //     );
  //   } else {
  //     await _authServices.logout();
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         CustomPageRoute(
  //           page: SplashScreen(),
  //         ),
  //         (Route<dynamic> route) => false);
  //   }
  // }
}
