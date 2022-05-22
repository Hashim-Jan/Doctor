import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/core/constants/date_formates.dart';
import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/core/models/medical_reecord.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_back_button.dart';
import 'package:doctors_de_peshawar/ui/screens/record_screen/record_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class RecordDetailsScreen extends StatelessWidget {
  MedicalRecord? medicalRecord;
  RecordDetailsScreen({this.medicalRecord});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecordDetailsProvider(medicalRecord!),
      child: Consumer<RecordDetailsProvider>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Medical Records"),
              centerTitle: true,
              leading: CustomBackButton(),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Doctor"),
                    SizedBox(height: 3),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          "${medicalRecord!.doctorName!}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Patient"),
                    SizedBox(height: 3),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          "${medicalRecord!.patientName!}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Problem"),
                    SizedBox(height: 3),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          "${medicalRecord!.problem!}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Date and time"),
                    SizedBox(height: 3),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          "${dateAndTime.format(medicalRecord!.addedAt!)}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("MEDICINES"),
                    SizedBox(height: 5),
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.45,
                      child: model.medicines.isEmpty
                          ? Center(
                              child: Text("Medicine not found"),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: model.medicines.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${model.medicines[index].medicineName}",
                                          style: TextStyle(
                                              color: blueColor,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          "${model.medicines[index].instruction}",
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, val) {
                                return SizedBox(height: 3);
                              },
                            ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Precautions",
                      style: TextStyle(
                        color: blueColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      child: Text("${medicalRecord!.precaution!}"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
