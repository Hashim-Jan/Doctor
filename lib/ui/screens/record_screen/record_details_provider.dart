import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/core/models/medical_reecord.dart';
import 'package:doctors_de_peshawar/core/models/medicine.dart';
import 'package:doctors_de_peshawar/core/services/database_services.dart';
import 'package:doctors_de_peshawar/core/view_model/base_view_model.dart';

class RecordDetailsProvider extends BaseViewModel {
  MedicalRecord medicalRecord = MedicalRecord();
  DatabaseServices _databaseServices = DatabaseServices();
  List<Medicine> medicines = [];

  RecordDetailsProvider(MedicalRecord medicalRecord) {
    this.medicalRecord = medicalRecord;
    getMedicines();
  }

  getMedicines() async {
    setState(ViewState.busy);
    medicines =
        await _databaseServices.getAllMedicine(medicalRecord.medicalRecordId!);
    setState(ViewState.idle);
  }
}
