import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/core/constants/styles.dart';
import 'package:doctors_de_peshawar/core/models/doctor.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_back_button.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_divider.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_page_route.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/rounded_buton.dart';
import 'package:doctors_de_peshawar/ui/screens/request_placement_screen/book_appointment_screen/book_appointment_provider.dart';
import 'package:doctors_de_peshawar/ui/screens/request_placement_screen/select_appointment_date_screen/select_appointment_date_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingAppointmentScreen extends StatelessWidget {
  Doctor? doctor;
  BookingAppointmentScreen({this.doctor});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookAppointmentProvider>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Patient Details"),
          centerTitle: true,
          leading: CustomBackButton(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
              key: model.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 50,
                    ),
                    title: Text("Dr. Robort Wethal"),
                    subtitle: Text("Dermatoligist "),
                  ),
                  // SizedBox(height: 20),
                  CustomDivider(),
                  SizedBox(height: 20),
                  Text(
                    "Booking For?",
                    style: TextStyle(color: blueColor),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            model.bookAppointmentForPatient();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              color: model.isForMe ? blueColor : lightBlueColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: blueColor),
                            ),
                            child: Row(
                              children: [
                                model.isForMe
                                    ? Icon(Icons.done, color: Colors.white)
                                    : Container(),
                                model.isForMe
                                    ? SizedBox(width: 10)
                                    : Container(),
                                Text(
                                  "Myself",
                                  style: TextStyle(
                                    color: model.isForMe
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            model.bookAppointmentForPatient();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              color: model.isForSomeone
                                  ? blueColor
                                  : lightBlueColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: blueColor),
                            ),
                            child: Row(
                              children: [
                                model.isForSomeone
                                    ? Icon(Icons.done, color: Colors.white)
                                    : Container(),
                                model.isForSomeone
                                    ? SizedBox(width: 10)
                                    : Container(),
                                Text(
                                  "Someone else",
                                  style: TextStyle(
                                    color: model.isForSomeone
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  model.isForMe ? Container() : SizedBox(height: 15),
                  model.isForMe
                      ? Container()
                      : Text(
                          "Full Name",
                          style: TextStyle(color: blueColor),
                        ),
                  model.isForMe
                      ? Container()
                      : TextFormField(
                          onChanged: (value) {
                            model.appointment.patientName = value.trim();
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter phone number";
                            }
                          },
                          decoration: textFieldDecoration.copyWith(
                            hintText: "Your name",
                          ),
                        ),
                  SizedBox(height: 15),
                  Text(
                    "Phone number",
                    style: TextStyle(color: blueColor),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      model.appointment.patientContactNumber = value.trim();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter phone number";
                      }
                    },
                    decoration: textFieldDecoration.copyWith(
                      hintText: "Your your phone number",
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Age",
                    style: TextStyle(color: blueColor),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      model.appointment.patientAge = int.parse(value.trim());
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter age";
                      }
                    },
                    decoration: textFieldDecoration.copyWith(
                      hintText: "Enter age",
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "CNIC",
                    style: TextStyle(color: blueColor),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      model.appointment.patientCnic = value.trim();
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter CNIC number";
                      }
                    },
                    decoration: textFieldDecoration.copyWith(
                      hintText: "Enter CNIC number",
                    ),
                  ),
                  SizedBox(height: 20),

                  ///
                  ///
                  Text(
                    "Gender",
                    style: TextStyle(color: blueColor),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            model.selectGender();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              color: model.isMale ? blueColor : lightBlueColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: blueColor),
                            ),
                            child: Row(
                              children: [
                                model.isMale
                                    ? Icon(Icons.done, color: Colors.white)
                                    : Container(),
                                model.isMale
                                    ? SizedBox(width: 10)
                                    : Container(),
                                Text(
                                  "Male",
                                  style: TextStyle(
                                    color: model.isMale
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            model.selectGender();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              color:
                                  model.isFemale ? blueColor : lightBlueColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: blueColor),
                            ),
                            child: Row(
                              children: [
                                model.isFemale
                                    ? Icon(Icons.done, color: Colors.white)
                                    : Container(),
                                model.isFemale
                                    ? SizedBox(width: 10)
                                    : Container(),
                                Text(
                                  "Female",
                                  style: TextStyle(
                                    color: model.isFemale
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  RoundedButton(
                    title: "Proceed",
                    onPressed: () {
                      print("Button pressed");

                      model.moveToNextScreen(context, doctor!);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
