import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/core/models/doctor.dart';
import 'package:doctors_de_peshawar/core/services/database_services.dart';
import 'package:doctors_de_peshawar/core/view_model/base_view_model.dart';

class SelectDoctorProvider extends BaseViewModel {
  List<Doctor> doctors = [];
  DatabaseServices _databaseServices = DatabaseServices();

  SelectDoctorProvider() {
    getAllDoctor();
  }

  getAllDoctor() async {
    setState(ViewState.busy);
    doctors = await _databaseServices.getAllDoctorsByCategories("category");
    setState(ViewState.idle);
  }
}
