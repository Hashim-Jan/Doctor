import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  // const CustomDivider({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Divider(
        color: blueColor,
        thickness: 1,
      ),
    );
  }
}
