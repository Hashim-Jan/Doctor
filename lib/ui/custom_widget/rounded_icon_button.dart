import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final title;
  final onTap;
  RoundedIconButton({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.27,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: blueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.chat, color: Colors.white),
            Text(
              "   $title",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
