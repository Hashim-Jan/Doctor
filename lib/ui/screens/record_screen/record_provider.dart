import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/core/models/medical_reecord.dart';
import 'package:doctors_de_peshawar/core/services/auth_services.dart';
import 'package:doctors_de_peshawar/core/services/database_services.dart';
import 'package:doctors_de_peshawar/core/view_model/base_view_model.dart';
import 'package:doctors_de_peshawar/ui/locator.dart';
import 'package:flutter/material.dart';

class RecordProvider extends BaseViewModel {
  List<MedicalRecord> medicalRecords = [];
  DatabaseServices _databaseServices = DatabaseServices();
  final currentUser = locator<AuthServices>();

  RecordProvider() {
    getMedicalRecord();
  }

  getMedicalRecord() async {
    setState(ViewState.busy);
    medicalRecords = await _databaseServices
        .getAllMedicalRecord(currentUser.appUser.userId!);
    setState(ViewState.idle);
  }
}
