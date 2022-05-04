import 'package:doctors_de_peshawar/core/services/auth_services.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerSingleton(AuthServices());
}
