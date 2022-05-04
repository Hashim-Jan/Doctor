import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/ui/screens/onboarding_screens/onboarding_base_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/onboarding_screens/onboarding_provider.dart';
// import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  // const OnboardingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingProvider(),
      child: Consumer<OnboardingProvider>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: lightBlueColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: PageView.builder(
                    itemCount: model.onBoardingScreenLenght,
                    itemBuilder: (context, index) {
                      return OnboardingBaseScreen(
                        textBody: model.bodies[model.currentScreen],
                        image: model.imagesPath[model.currentScreen],
                      );
                    },
                    onPageChanged: (value) {
                      print("Current Onboarding Screen ==> $value");

                      model.changeScreen(value, context);
                    },
                  ),
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Align(
                //       alignment: Alignment.bottomCenter,
                //       child: Padding(
                //         padding: EdgeInsets.symmetric(horizontal: 110),
                //         child: RectangularButton(
                //           onTap: () {
                //             model.changeScreenManually(context);
                //           },
                //           title: 'Next',
                //         ),
                //       ),
                //     ),
                //     SizedBox(height: 10),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         GestureDetector(
                //           onTap: () {
                //             Navigator.pushReplacement(
                //               context,
                //               CustomPageRoute(
                //                 page: SignInScreen(),
                //               ),
                //             );
                //           },
                //           child: Text('Skip'),
                //         ),
                //         DotsIndicator(
                //           dotsCount: model.onBoardingScreenLenght,
                //           position: model.currentScreen.toDouble(),
                //           decorator: DotsDecorator(
                //             size: Size.square(7),
                //             activeSize: Size(25.0, 7.0),
                //             activeShape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(5.0),
                //             ),
                //           ),
                //         ),
                //         SizedBox(width: 33),
                //       ],
                //     ),
                //     SizedBox(height: 20),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
