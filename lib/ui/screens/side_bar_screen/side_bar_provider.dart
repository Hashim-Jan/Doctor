import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/core/services/auth_services.dart';
import 'package:doctors_de_peshawar/core/view_model/base_view_model.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_page_route.dart';
import 'package:doctors_de_peshawar/ui/locator.dart';
import 'package:doctors_de_peshawar/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class SidebarProvider extends BaseViewModel {
  final currentUser = locator<AuthServices>();
  bool isUserLogout = false;

  logoutUser(BuildContext context) async {
    setState(ViewState.busy);
    isUserLogout = await currentUser.logout();
    setState(ViewState.idle);
    if (isUserLogout) {
      Navigator.pushAndRemoveUntil(
          context, CustomPageRoute(page: SplashScreen()), (route) => false);
    }
  }
}
