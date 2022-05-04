import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_back_button.dart';
import 'package:flutter/material.dart';

class RecordDetailsScreen extends StatelessWidget {
  // const RecordDetailsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Dr. Iqra",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                    "Salman Ahmad",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                    "Stomach",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                    "12/01/2022  01:30 AM",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text("MEDICINES"),
              SizedBox(height: 5),
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                child: ListView.separated(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Penadol",
                              style: TextStyle(
                                  color: blueColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 2),
                            Text(
                                "1/2 mg Morning before meal, 1/2 mg evening after meal     "),
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
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet.Lorem ipsum dolor sit amet, consectetur "),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
