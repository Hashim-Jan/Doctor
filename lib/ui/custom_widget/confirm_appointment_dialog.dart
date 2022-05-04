import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_page_route.dart';
import 'package:doctors_de_peshawar/ui/screens/dashboard_screen/dashboard_screen.dart';
import 'package:flutter/material.dart';

confirmAppointmentDialog(BuildContext context) {
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
          height: 280,
          child: Column(
            children: [
              Text("Congratulations"),
              SizedBox(height: 10),
              Image.asset(
                "assets/icons/done_icon.png",
                scale: 2,
              ),
              SizedBox(height: 10),
              Text("Appointment Confirmed"),
              SizedBox(height: 5),
              Text("Please come on time!"),
              SizedBox(height: 5),
              Text("Monday 21,April 2020"),
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
