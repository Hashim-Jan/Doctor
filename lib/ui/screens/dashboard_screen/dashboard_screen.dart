import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_page_route.dart';
import 'package:doctors_de_peshawar/ui/screens/appointment_screen/appointment_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/doctor_screen/doctor_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/profile_screen/profile_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/record_screen/record_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/side_bar_screen/side_bar_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  // const DashboardScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlueColor,
      drawer: SideBarScreen(),
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 10),
        //     child: Icon(
        //       Icons.person,
        //       size: 25,
        //       // color: blueColor,
        //     ),
        //   ),
        // ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: DashboardCard(
                      title: "Appointments",
                      icon: "assets/icons/appo_icon.png",
                      onPressed: () {
                        Navigator.push(
                          context,
                          CustomPageRoute(page: AppointmentScreen()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: DashboardCard(
                      title: "Records",
                      icon: "assets/icons/record_icon.png",
                      onPressed: () {
                        Navigator.push(
                          context,
                          CustomPageRoute(page: RecordScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: DashboardCard(
                      title: "Doctors",
                      icon: "assets/icons/doctors_icon.png",
                      onPressed: () {
                        Navigator.push(
                          context,
                          CustomPageRoute(
                            page: DoctorScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: DashboardCard(
                      title: "Account Settings",
                      icon: "assets/icons/account_icon.png",
                      onPressed: () {
                        Navigator.push(
                          context,
                          CustomPageRoute(
                            page: ProfileScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final title;
  final icon;
  final onPressed;

  DashboardCard({this.title, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
          child: Column(
            children: [
              Text(
                "$title",
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Expanded(child: Image.asset('$icon')),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
