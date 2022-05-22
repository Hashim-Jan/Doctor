import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctors_de_peshawar/core/models/appointment.dart';
import 'package:doctors_de_peshawar/core/models/appuser.dart';
import 'package:doctors_de_peshawar/core/models/doctor.dart';
import 'package:doctors_de_peshawar/core/models/medical_reecord.dart';
import 'package:doctors_de_peshawar/core/models/medicine.dart';
import 'package:doctors_de_peshawar/core/models/message.dart';

class DatabaseServices {
  final _ref = FirebaseFirestore.instance;
  registerUser(AppUser appUser) async {
    try {
      await _ref
          .collection("Patient")
          .doc(appUser.userId)
          .set(appUser.toJson());
    } catch (e) {
      print('Exception@registerPatient ===> $e');
    }
  }

  Future<AppUser> getUser(String id) async {
    try {
      final snapshot = await _ref.collection("Patient").doc(id).get();
      return AppUser.fromJson(snapshot.data(), snapshot.id);
    } catch (e) {
      print('Exception@getPatient ===> $e');
      return AppUser();
    }
  }

  Future<bool> updateUserProfile(AppUser appUser) async {
    try {
      await _ref
          .collection("Patient")
          .doc(appUser.userId)
          .update(appUser.toJson());
      return true;
    } catch (e) {
      print('Exception@updatePatient ===> $e');
      return false;
    }
  }

  /// ================================================ ///
  /// ============= Appointments ===================== ///
  /// ================================================ ///

  createNewAppointment(String id, Appointment appointment) async {
    try {
      await _ref
          .collection("Appointments")
          .doc(id)
          .collection("MyAppointments")
          .add(appointment.toJson());
      return true;
    } catch (e) {
      print("Exception@ CreateNewAppointment ==> $e");
      return false;
    }
  }

  ///
  /// Patient appointments
  ///
  getMyAppointments(String id) async {
    print("id==> $id");
    List<Appointment> list = [];
    try {
      final snapshot = await _ref
          .collection("Appointments")
          .doc(id)
          .collection("MyAppointments")
          .orderBy("appointmentAt", descending: true)
          .get();
      if (snapshot.docs.length > 0) {
        snapshot.docs.forEach((doc) {
          list.add(Appointment.fromJson(doc, doc.id));
        });
      } else {
        print('Appointments not found');
      }
    } catch (e) {
      print("Exception @ DatabaseServices/GetMyAppointment ==> $e");
    }
    return list;
  }

  /// ================================================ ///
  /// =================== Doctor ===================== ///
  /// ================================================ ///

  ///
  /// get all doctors
  ///
  getAllDoctorsByCategories(String category) async {
    List<Doctor> list = [];
    try {
      final snapshot = await _ref.collection("Doctors").get();
      if (snapshot.docs.length > 0) {
        snapshot.docs.forEach((doc) {
          list.add(Doctor.formJson(doc, doc.id));
        });
      } else {
        print('Doctor not found');
      }
    } catch (e) {
      print("Exception @ DatabaseServices/GetAllDoctors ==> $e");
    }
    return list;
  }

  /// ================================================ ///
  /// =============== Medical record ================= ///
  /// ================================================ ///

  ///
  /// get medical record
  ///
  getAllMedicalRecord(String id) async {
    List<MedicalRecord> list = [];
    try {
      final snapshot = await _ref
          .collection("MedicalRecord")
          .where("patientId", isEqualTo: id)
          .get();
      if (snapshot.docs.length > 0) {
        snapshot.docs.forEach((doc) {
          list.add(MedicalRecord.fromJson(doc, doc.id));
        });
      } else {
        print('Medical Record not found');
      }
    } catch (e) {
      print("Exception @ DatabaseServices/GetMedicalRecord ==> $e");
    }
    return list;
  }

  getAllMedicine(String id) async {
    List<Medicine> list = [];
    try {
      final snapshot = await _ref
          .collection("MedicalRecord")
          .doc(id)
          .collection('MyRecords')
          .get();
      if (snapshot.docs.length > 0) {
        snapshot.docs.forEach((doc) {
          list.add(Medicine.formJson(doc, doc.id));
        });
      } else {
        print('Medicine not found');
      }
    } catch (e) {
      print("Exception @ DatabaseServices/GetMedicine ==> $e");
    }
    return list;
  }

  /// ================================================= ///
  /// ================ chat =========================== ///
  /// ================================================= ///

  ///
  /// add new message
  ///
  addNewUserMessage(
      AppUser messageFrom, Doctor messageTo, Message message) async {
    try {
      ///
      /// From User message
      ///
      await _ref
          .collection("Conversations")
          .doc("${messageFrom.userId}")
          .collection("Chats")
          .doc("${messageTo.doctorId}")
          .collection("messages")
          .add(message.toJson());
      // await _ref
      //     .collection("Conversations")
      //     .doc("${fromConversation.userId}")
      //     .collection("Chats")
      //     .doc("${messageTo.serviceProivderId}")
      //     .set(messageTo.toJson());

      ///
      /// to user message
      ///
      await _ref
          .collection("Conversations")
          .doc("${messageTo.doctorId}")
          .collection("Chats")
          .doc("${messageFrom.userId}")
          .collection("messages")
          .add(message.toJson());
      // await _ref
      //     .collection("Conversations")
      //     .doc("${messageTo.serviceProivderId}")
      //     .collection("Chats")
      //     .doc("${fromConversation.userId}")
      //     .set(fromConversation.toJson());
    } catch (e) {
      print('Exception@DatabaseServices/addNewMessage ==> $e');
    }
  }

  ///
  /// get messages
  ///
  Stream<QuerySnapshot>? getRealTimeChat(
      String currentUserId, String toUserId) {
    print("Current User id ==> $currentUserId");
    print("to user id ==> $toUserId");
    try {
      Stream<QuerySnapshot> messageSnapshot = _ref
          .collection("Conversations")
          .doc(currentUserId)
          .collection("Chats")
          .doc(toUserId)
          .collection("messages")
          .orderBy('sendAt', descending: true)
          .snapshots();
      return messageSnapshot;
    } catch (e) {
      print('Exception@GetUserMessagesStream=>$e');
      return null;
    }
  }
}
