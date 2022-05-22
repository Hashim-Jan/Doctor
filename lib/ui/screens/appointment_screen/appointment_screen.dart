import 'package:doctors_de_peshawar/core/constants/styles.dart';
import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_back_button.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_divider.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/rounded_buton.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/rounded_icon_button.dart';
import 'package:doctors_de_peshawar/ui/screens/appointment_screen/appointment_provider.dart';
import 'package:doctors_de_peshawar/ui/screens/request_placement_screen/book_appointment_screen/book_appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class AppointmentScreen extends StatelessWidget {
  // const AppointmentScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppointmentProvider(),
      child: Consumer<AppointmentProvider>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            appBar: AppBar(
              title: Text("My appointments"),
              centerTitle: true,
              leading: CustomBackButton(),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {},
                    decoration: searchStyle,
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: model.appointments.isEmpty
                        ? Center(
                            child: Text("Appointment not found"),
                          )
                        : ListView.builder(
                            itemCount: model.appointments.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 0),
                                  child: ExpansionTile(
                                    // expandedAlignment: Alignment.topLeft,
                                    tilePadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),

                                    childrenPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    leading: CircleAvatar(
                                        // radius: 60,
                                        ),
                                    title: Text("Dr. Khan"),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Cardiologist"),
                                        Text("M.B.B.S | F.C.PS"),
                                      ],
                                    ),
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: RoundedIconButton(
                                          title: "Chat",
                                          onTap: () {},
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.location_on),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              "Hopkins Hospital, Mall road, US.",
                                            ),
                                          ),
                                        ],
                                      ),
                                      CustomDivider(),
                                      Row(
                                        children: [
                                          Icon(Icons.timer),
                                          SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("02 December 2022"),
                                              Text("3:00 PM")
                                            ],
                                          ),
                                        ],
                                      ),
                                      CustomDivider(),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.star, color: Colors.amber),
                                          Icon(Icons.star, color: Colors.amber),
                                          Icon(Icons.star, color: Colors.amber),
                                          Icon(Icons.star, color: Colors.amber),
                                          Icon(Icons.star, color: Colors.amber),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Card(
                                        child: TextFormField(
                                          maxLines: 5,
                                          decoration: searchStyle.copyWith(
                                            hintText: "Write your feedback",
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 100),
                                        child: RoundedButton(title: "Submit"),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
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
