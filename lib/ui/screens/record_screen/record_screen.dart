import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/core/constants/styles.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_back_button.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_page_route.dart';
import 'package:doctors_de_peshawar/ui/screens/record_screen/record_details_screen.dart';
import 'package:flutter/material.dart';

class RecordScreen extends StatelessWidget {
  // const RecordScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (context, val) {
                  return SizedBox(height: 6);
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CustomPageRoute(page: RecordDetailsScreen()),
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
                              "22 \nJan \n2022",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: blueColor,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                    "Dr Iqra",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Container(
                                color: blueColor,
                                height: 1,
                                width: MediaQuery.of(context).size.width * 0.7,
                              ),
                              SizedBox(height: 10),
                              Text("Appointment for"),
                              SizedBox(height: 3),
                              Text(
                                "Salman Ahmad",
                                style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
