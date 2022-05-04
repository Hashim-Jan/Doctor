import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_page_route.dart';
import 'package:doctors_de_peshawar/ui/screens/dashboard_screen/dashboard_screen.dart';
import 'package:flutter/material.dart';

errorAppointmentDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        title: Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              radius: 10,
              backgroundColor: blueColor,
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        content: Container(
          height: 270,
          child: Column(
            children: [
              Text("Sorry!"),
              SizedBox(height: 10),
              Image.asset(
                "assets/icons/error_icon.png",
                scale: 2,
              ),
              SizedBox(height: 10),
              Text("Your appointment can't be proceeded"),
              SizedBox(height: 5),
              Text("Please go back and try again!"),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  CustomPageRoute(
                    page: DashboardScreen(),
                  ),
                  (route) => false);
            },
          ),
        ],
      );
    },
  );
}
