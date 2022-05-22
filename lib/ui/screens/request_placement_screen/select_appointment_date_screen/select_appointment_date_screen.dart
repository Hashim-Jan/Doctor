import 'package:doctors_de_peshawar/core/constants/date_formates.dart';
import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/confirm_appointment_dialog.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_back_button.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_divider.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/rounded_buton.dart';
import 'package:doctors_de_peshawar/ui/screens/request_placement_screen/book_appointment_screen/book_appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SelectAppointmentDateScreen extends StatelessWidget {
  // const SelectAppointmentDateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BookAppointmentProvider>(
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.state == ViewState.busy,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Patient Details"),
            centerTitle: true,
            leading: CustomBackButton(),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  Container(
                    height: 70,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 16,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                  "${onlyDay.format(DateTime(2022, 8, index + 1))}"),

                              // Text("Mon"),
                              Text("${DateTime(2022, 8, index + 1).day}"),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, val) {
                        return SizedBox(width: 10);
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Morning",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 150,
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 5,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return UnconstrainedBox(
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              children: [
                                Icon(Icons.timer),
                                SizedBox(width: 10),
                                Text("09:20 AM"),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Evening",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 150,
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 5,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return UnconstrainedBox(
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              children: [
                                Icon(Icons.timer),
                                SizedBox(width: 10),
                                Text("03:20 PM"),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  RoundedButton(
                    title: "Make an appointment",
                    onPressed: () async {
                      await model.makeAppointment(context);
                      // confirmAppointmentDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
