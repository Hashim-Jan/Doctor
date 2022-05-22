import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/core/constants/date_formates.dart';
import 'package:doctors_de_peshawar/core/constants/styles.dart';
import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_back_button.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_page_route.dart';
import 'package:doctors_de_peshawar/ui/screens/record_screen/record_details_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/record_screen/record_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class RecordScreen extends StatelessWidget {
  // const RecordScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecordProvider(),
      child: Consumer<RecordProvider>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Medical Records"),
              centerTitle: true,
              leading: CustomBackButton(),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (keyword) {},
                    decoration: searchStyle,
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: model.medicalRecords.isEmpty
                        ? Center(
                            child: Text("Medical record not found"),
                          )
                        : ListView.separated(
                            itemCount: model.medicalRecords.length,
                            separatorBuilder: (context, val) {
                              return SizedBox(height: 6);
                            },
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CustomPageRoute(
                                      page: RecordDetailsScreen(
                                        medicalRecord:
                                            model.medicalRecords[index],
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 20),
                                        decoration: BoxDecoration(
                                          color: blueColor.withOpacity(0.4),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                        child: Text(
                                          "${model.medicalRecords[index].addedAt!.day} \n${onlyMonth.format(model.medicalRecords[index].addedAt!)} \n${model.medicalRecords[index].addedAt!.year}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: blueColor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            // mainAxisAlignment: MainAxisAlignment.center,
                                            // crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color: blueColor,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "${model.medicalRecords[index].doctorName}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                            color: blueColor,
                                            height: 1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                          ),
                                          SizedBox(height: 10),
                                          Text("Appointment for"),
                                          SizedBox(height: 3),
                                          Text(
                                            "${model.medicalRecords[index].patientName}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
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
