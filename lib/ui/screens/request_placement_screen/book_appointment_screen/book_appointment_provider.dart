import 'package:doctors_de_peshawar/core/view_model/base_view_model.dart';

class BookAppointmentProvider extends BaseViewModel {
  bool isForMe = true;
  bool isForSomeone = false;
  bool isMale = true;
  bool isFemale = false;

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
}
