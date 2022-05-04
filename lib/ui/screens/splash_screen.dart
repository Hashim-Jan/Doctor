import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/core/services/auth_services.dart';
import 'package:doctors_de_peshawar/ui/locator.dart';
import 'package:doctors_de_peshawar/ui/screens/dashboard_screen/dashboard_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/onboarding_screens/onbaording_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  // const SplashScreen({ Key? key }) : super(key: key);
//
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authServices = locator<AuthServices>();
  splashScreenDelay() async {
    await Future.delayed(Duration(seconds: 3));
    if (_authServices.user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    splashScreenDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Center(
        child: Image.asset(
          'assets/logos/logo.png',
          scale: 2,
        ),
      ),
    );
  }
}
