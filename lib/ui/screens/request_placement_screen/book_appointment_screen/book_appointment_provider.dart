import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/core/models/appointment.dart';
import 'package:doctors_de_peshawar/core/models/appuser.dart';
import 'package:doctors_de_peshawar/core/models/doctor.dart';
import 'package:doctors_de_peshawar/core/services/auth_services.dart';
import 'package:doctors_de_peshawar/core/services/database_services.dart';
import 'package:doctors_de_peshawar/core/view_model/base_view_model.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/confirm_appointment_dialog.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_page_route.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/error_appointment_dialog.dart';
import 'package:doctors_de_peshawar/ui/locator.dart';
import 'package:doctors_de_peshawar/ui/screens/dashboard_screen/dashboard_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/request_placement_screen/select_appointment_date_screen/select_appointment_date_screen.dart';
import 'package:flutter/material.dart';

class BookAppointmentProvider extends BaseViewModel {
  bool isForMe = true;
  bool isForSomeone = false;
  bool isMale = true;
  bool isFemale = false;
  final formKey = GlobalKey<FormState>();
  Appointment appointment = Appointment();
  bool isDateSelected = true;
  Doctor doctor = Doctor();
  final currentUser = locator<AuthServices>();
  DatabaseServices _databaseServices = DatabaseServices();
  bool isAppointmentBooked = false;

  bookAppointmentForPatient() {
    if (isForMe) {
      isForSomeone = true;
      isForMe = false;
    } else if (isForSomeone) {
      isForMe = true;
      isForSomeone = false;
    }
    notifyListeners();
  }

  selectGender() {
    if (isMale) {
      isFemale = true;
      isMale = false;
    } else if (isFemale) {
      isMale = true;
      isFemale = false;
    }
    notifyListeners();
  }

  ///
  ///
  ///
  makeAppointment(BuildContext context) async {
    print(doctor.docName);
    appointment.appointmentAt = DateTime.now();
    appointment.appointmentDay = DateTime.now();
    appointment.appointmentFor = !isForMe ? "someone" : "me";

    appointment.appointmentTime = '2:30 PM';
    appointment.doctorId = "abc";
    appointment.doctorName = doctor.docName;
    appointment.gender = isMale ? "Male" : "Female";
    appointment.patientName =
        isForMe ? appointment.appointmentFor : currentUser.appUser.userName;
    appointment.patientId = currentUser.appUser.userId;

    setState(ViewState.busy);
    isAppointmentBooked = await _databaseServices.createNewAppointment(
        currentUser.appUser.userId!, appointment);
    setState(ViewState.idle);
    if (isAppointmentBooked) {
      Navigator.pushAndRemoveUntil(
          context, CustomPageRoute(page: DashboardScreen()), (route) => false);
      confirmAppointmentDialog(context);
    } else {
      errorAppointmentDialog(context);
    }
  }

  ///
  /// move to next screen
  ///
  moveToNextScreen(BuildContext context, Doctor doctor) {
    if (formKey.currentState!.validate()) {
      this.doctor = doctor;
      if (isFemale || isForMe) {
        Navigator.push(
          context,
          CustomPageRoute(
            page: SelectAppointmentDateScreen(),
          ),
        );
      }
    }
  }
}
