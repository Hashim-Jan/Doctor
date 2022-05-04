import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/core/constants/styles.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_back_button.dart';
import 'package:flutter/material.dart';

class LiveChatScreen extends StatelessWidget {
  // const LiveChatScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 2,
        title: ListTile(
          leading: CircleAvatar(),
          title: Text(
            "Dr. Robort Wethal",
            maxLines: 1,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: CustomBackButton(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Align(
                    alignment:
                        index == 1 ? Alignment.topRight : Alignment.topLeft,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: index == 1 ? Colors.white : blueColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Hello",
                        style: TextStyle(
                            color: index == 1 ? Colors.black : Colors.white),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, value) {
                  return SizedBox(height: 8);
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {},
                    decoration: searchStyle.copyWith(
                      hintText: "Message",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.send,
                    size: 35,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
