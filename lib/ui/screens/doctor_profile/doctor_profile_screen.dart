import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_back_button.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_divider.dart';
import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatelessWidget {
  // const DoctorProfile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor Profile"),
        centerTitle: true,
        leading: CustomBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
          child: Column(
            children: [
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
                        "Dr. Robort Wethal",
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
                        "M.B.B.S | F.C.PS",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          Text(
                            "Hopkins Hospital, Mall road, US.",
                            maxLines: 1,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomDivider(),

              ///
              ///
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Experience"),
                        Text("6 years"),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Satisfication"),
                        Text("96%"),
                      ],
                    ),
                  ],
                ),
              ),
              CustomDivider(),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Reviews"),
                    Text("4.7"),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.59,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 35,
                                ),
                                title: Text(
                                  "Ahmad Ali",
                                  style: TextStyle(fontSize: 20),
                                ),
                                trailing: Text("4.0"),
                                subtitle: Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amber),
                                    Icon(Icons.star, color: Colors.amber),
                                    Icon(Icons.star, color: Colors.amber),
                                    Icon(Icons.star, color: Colors.amber),
                                    Icon(Icons.star_border,
                                        color: Colors.amber),
                                  ],
                                ),
                              ),

                              ///
                              ///body
                              ///
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr"),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
