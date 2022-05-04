import 'package:flutter/material.dart';

class OnboardingBaseScreen extends StatelessWidget {
  final image;
  final title;
  final textBody;

  OnboardingBaseScreen({this.title, this.textBody, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Column(
          children: [
            // OrientationBuilder(
            //   builder: (context, orientation) {
            //     return orientation == Orientation.portrait
            //         ? SizedBox(
            //             height: 50.h,
            //           )
            //         : SizedBox();
            //   },
            // ),
            SizedBox(height: 60),
            Image.asset(
              "assets/logos/logo2.png",
              scale: 2.4,
            ),
            SizedBox(height: 40),
            Text(
              '$textBody',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
            Spacer(),
            Image.asset(
              "$image",
              scale: 1.2,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
