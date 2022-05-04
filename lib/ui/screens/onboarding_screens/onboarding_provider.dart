import 'package:doctors_de_peshawar/core/view_model/base_view_model.dart';
import 'package:doctors_de_peshawar/ui/screens/auth/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';

class OnboardingProvider extends BaseViewModel {
  int onBoardingScreenLenght = 3;
  int currentScreen = 0;
  OnboardingProvider() {
    currentScreen = 0;
  }

  List<String> bodies = [
    "Find your Doctor",
    "Store your Medical Records",
    "Book Appointment Online & Physical",
  ];
  List<String> imagesPath = [
    "assets/images/find_doctor.png",
    "assets/images/medical_image.png",
    "assets/images/book_app_image.png",
  ];

  changeScreen(int value, BuildContext context) {
    print("current value ==>$currentScreen ");
    print("index value ==> $value");
    currentScreen = value;
    if (currentScreen == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
      );
    }
    notifyListeners();
  }

  changeScreenManually(BuildContext context) {
    if (currentScreen == 2) {
      currentScreen = currentScreen;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SignInScreen(),
        ),
      );
    } else if (currentScreen >= 0 && currentScreen < 2) {
      currentScreen++;
    } else if (currentScreen == 3) {}
    print("Screen ==> $currentScreen");
    notifyListeners();
  }
}
