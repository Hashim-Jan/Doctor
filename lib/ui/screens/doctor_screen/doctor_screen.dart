import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_back_button.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_page_route.dart';
import 'package:doctors_de_peshawar/ui/screens/request_placement_screen/select_doctor_screen/select_doctor_screen.dart';
import 'package:flutter/material.dart';

class DoctorScreen extends StatelessWidget {
  // const DoctorScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors"),
        centerTitle: true,
        leading: CustomBackButton(),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoriesCard(
                  icon: "assets/icons/Nephronologist_icon.png",
                  title: "Nephronologist",
                  onPressed: () {
                    Navigator.push(
                        context, CustomPageRoute(page: SelectDoctorScreen()));
                  },
                ),
                CategoriesCard(
                  icon: "assets/icons/Cardiologist_icon.png",
                  title: "Cardiologist",
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoriesCard(
                  icon: "assets/icons/Gastroentero_logist_icon.png",
                  title: "Gastroenterologist",
                  onPressed: () {},
                ),
                CategoriesCard(
                  icon: "assets/icons/Neuronologist_icon.png",
                  title: "Neuronologist",
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoriesCard(
                  icon: "assets/icons/Pulmonologist_icon.png",
                  title: "Pulmonologist",
                  onPressed: () {},
                ),
                CategoriesCard(
                  icon: "assets/icons/psychiatrist_icon.png",
                  title: "Psychiatrist",
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoriesCard(
                  icon: "assets/icons/gynaecologist_icon.png",
                  title: "Gynaecologist",
                  onPressed: () {},
                ),
                CategoriesCard(
                  icon: "assets/icons/pedriatician_icon.png",
                  title: "Pedriatician",
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoriesCard(
                  icon: "assets/icons/generalphysician_icon.png",
                  title: "General physician",
                  onPressed: () {},
                ),
                CategoriesCard(
                  icon: "assets/icons/urologist_icon.png",
                  title: "Urologist",
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     CategoriesCard(
            //       icon: "assets/icons/Nephronologist_icon.png",
            //       title: "Nephronologist",
            //       onPressed: () {},
            //     ),
            //     CategoriesCard(
            //       icon: "assets/icons/Nephronologist_icon.png",
            //       title: "Nephronologist",
            //       onPressed: () {},
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  final icon;
  final title;
  final onPressed;

  CategoriesCard({this.icon, this.onPressed, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.47,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset("$icon", scale: 2),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "$title",
                    style: TextStyle(
                        color: blueColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
