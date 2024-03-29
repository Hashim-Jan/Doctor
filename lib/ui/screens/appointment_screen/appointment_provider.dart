import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/core/models/appointment.dart';
import 'package:doctors_de_peshawar/core/services/auth_services.dart';
import 'package:doctors_de_peshawar/core/services/database_services.dart';
import 'package:doctors_de_peshawar/core/view_model/base_view_model.dart';
import 'package:doctors_de_peshawar/ui/locator.dart';

class AppointmentProvider extends BaseViewModel {
  List<Appointment> appointments = [];
  DatabaseServices _databaseServices = DatabaseServices();
  final currentUser = locator<AuthServices>();

  AppointmentProvider() {
    getMyAppointments();
  }

  getMyAppointments() async {
    setState(ViewState.busy);

    appointments =
        await _databaseServices.getMyAppointments(currentUser.appUser.userId!);

    setState(ViewState.idle);
  }
}
