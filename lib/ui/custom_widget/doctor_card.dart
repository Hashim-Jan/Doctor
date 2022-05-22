import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/core/models/doctor.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_divider.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_page_route.dart';
import 'package:doctors_de_peshawar/ui/screens/conversation_screen/live_chat_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/doctor_profile/doctor_profile_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/request_placement_screen/book_appointment_screen/book_appointment_screen.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  Doctor? doctor;
  final bookAppointment;
  final viewProfile;
  final chat;
  DoctorCard({this.doctor, this.bookAppointment, this.chat, this.viewProfile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ///
          /// top area
          ///
          Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                  ),
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${doctor!.docName}",
                    style: TextStyle(
                      fontSize: 18,
                      color: blueColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Cardiologist ",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${doctor!.education}",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      Text(
                        "${doctor!.address}",
                        maxLines: 1,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 20),

          ///
          ///
          Material(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: viewProfile,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text("View Profile"),
              ),
            ),
          ),
          SizedBox(height: 20),

          CustomDivider(),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: chat,
                  child: Material(
                    elevation: 5,
                    color: blueColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.chat,
                            color: Colors.white,
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Chat",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Material(
                  color: blueColor,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: bookAppointment,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Text(
                        "Book Appointment",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
