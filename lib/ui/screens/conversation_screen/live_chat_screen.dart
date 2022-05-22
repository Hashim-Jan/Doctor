import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/core/constants/date_formates.dart';
import 'package:doctors_de_peshawar/core/constants/styles.dart';
import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/core/models/doctor.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_back_button.dart';
import 'package:doctors_de_peshawar/ui/screens/conversation_screen/live_chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class LiveChatScreen extends StatelessWidget {
  Doctor? doctor;
  LiveChatScreen({this.doctor});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LiveChatProvider(doctor!),
      child: Consumer<LiveChatProvider>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            appBar: AppBar(
              // leadingWidth: 2,

              title: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: doctor!.docName == null
                    ? CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/icons/user_icon.png"),
                      )
                    : CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/icons/user_icon.png"),
                      ),
                title: Text(
                  "${doctor!.docName}",
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
                    child: model.messages.isEmpty
                        ? Center(
                            child: Text("messages not found"),
                          )
                        : ListView.separated(
                            reverse: true,
                            itemCount: model.messages.length,
                            itemBuilder: (context, index) {
                              return Align(
                                alignment: model.messages[index].fromUserId ==
                                        model.currentUser.appUser.userId
                                    ? Alignment.topRight
                                    : Alignment.topLeft,
                                child: Padding(
                                  padding: model.messages[index].fromUserId ==
                                          model.currentUser.appUser.userId
                                      ? EdgeInsets.only(left: 25)
                                      : EdgeInsets.only(right: 25),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: model.messages[index].fromUserId ==
                                              model.currentUser.appUser.userId
                                          ? Colors.white
                                          : blueColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${model.messages[index].textMessage}",
                                          style: TextStyle(
                                            color: model.messages[index]
                                                        .fromUserId ==
                                                    model.currentUser.appUser
                                                        .userId
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "${onlyTime.format(model.messages[index].sendAt!)}",
                                          style: TextStyle(
                                            fontSize: 8,
                                            color: model.messages[index]
                                                        .fromUserId ==
                                                    model.currentUser.appUser
                                                        .userId
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, value) {
                              return SizedBox(height: 8);
                            },
                          ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          onChanged: (value) {
                            model.message.textMessage = value.trim();
                          },
                          decoration: searchStyle.copyWith(
                            hintText: "Message",
                          ),
                          controller: model.messageController,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          model.addNewMessage();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.send,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
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
