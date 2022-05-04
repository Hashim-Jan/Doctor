import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final title;
  final onPressed;
  RoundedButton({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: blueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '$title',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
