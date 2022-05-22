import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/core/models/doctor.dart';
import 'package:doctors_de_peshawar/core/models/message.dart';
import 'package:doctors_de_peshawar/core/services/auth_services.dart';
import 'package:doctors_de_peshawar/core/services/database_services.dart';
import 'package:doctors_de_peshawar/core/view_model/base_view_model.dart';
import 'package:doctors_de_peshawar/ui/locator.dart';
import 'package:flutter/material.dart';

class LiveChatProvider extends BaseViewModel {
  var showPersistantBottomSheetCallBack;
  Message message = Message();
  Doctor doctor = Doctor();
  final currentUser = locator<AuthServices>();
  TextEditingController messageController = TextEditingController();
  DatabaseServices _databaseServices = DatabaseServices();
  Stream<QuerySnapshot>? getMessageStream;
  List<Message> messages = [];

  LiveChatProvider(Doctor doctor) {
    this.doctor = doctor;
    print("Chat provider called");
    getAllMessages(doctor.doctorId!);
  }

  ///
  /// add new message
  ///
  addNewMessage() async {
    if (message.textMessage != null) {
      message.fromUserId = currentUser.appUser.userId;
      message.toUserId = doctor.doctorId;
      message.sendAt = DateTime.now();

      _databaseServices.addNewUserMessage(currentUser.appUser, doctor, message);
      messageController.clear();
      message = Message();
    }
  }

  ///
  /// get messages
  ///
  getAllMessages(String toUserId) async {
    print("ToUserId => $toUserId");
    setState(ViewState.busy);
    getMessageStream = _databaseServices.getRealTimeChat(
        currentUser.appUser.userId!, toUserId);
    getMessageStream!.listen(
      (event) {
        messages = [];
        if (event.docs.length > 0) {
          event.docs.forEach((element) {
            messages.add(Message.fromJson(element.data(), element.id));
            notifyListeners();
            print('Message from stream');
            print('Messages length ${messages.length}');
          });
          notifyListeners();
        } else {
          messages = [];
          notifyListeners();
        }
      },
    );
    setState(ViewState.idle);
  }
}
