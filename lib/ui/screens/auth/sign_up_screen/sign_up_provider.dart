import 'package:doctors_de_peshawar/core/constants/date_formates.dart';
import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/core/models/appuser.dart';
import 'package:doctors_de_peshawar/core/models/custom_auth_result.dart';
import 'package:doctors_de_peshawar/core/services/auth_services.dart';
import 'package:doctors_de_peshawar/core/view_model/base_view_model.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_page_route.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_snackbar.dart';
import 'package:doctors_de_peshawar/ui/locator.dart';
import 'package:doctors_de_peshawar/ui/screens/dashboard_screen/dashboard_screen.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends BaseViewModel {
  final forrmKey = GlobalKey<FormState>();
  AppUser appUser = AppUser();
  CustomAuthResult customAuthResult = CustomAuthResult();
  final _authServices = locator<AuthServices>();

  signUpUser(BuildContext context) async {
    if (appUser.dateOfBirth != null) {
      if (forrmKey.currentState!.validate()) {
        appUser.createdAt = DateTime.now();
        setState(ViewState.busy);
        customAuthResult = await _authServices.signUpUserWithEmail(appUser);

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
    } else {
      customSnackBar(context, "Please select date of birth");
      print("");
    }
  }

  ///
  /// pick birthday
  ///
  pickBirthday(value) {
    appUser.dateOfBirth = date.format(value);
    notifyListeners();
  }
}
