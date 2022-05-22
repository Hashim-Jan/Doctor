import 'package:doctors_de_peshawar/core/constants/colors.dart';
import 'package:doctors_de_peshawar/core/enums/view_state.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_back_button.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_divider.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/custom_page_route.dart';
import 'package:doctors_de_peshawar/ui/custom_widget/doctor_card.dart';
import 'package:doctors_de_peshawar/ui/screens/conversation_screen/live_chat_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/doctor_profile/doctor_profile_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/request_placement_screen/book_appointment_screen/book_appointment_screen.dart';
import 'package:doctors_de_peshawar/ui/screens/request_placement_screen/select_doctor_screen/select_doctor_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SelectDoctorScreen extends StatelessWidget {
  // const SelectDoctorScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectDoctorProvider(),
      child: Consumer<SelectDoctorProvider>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Doctors"),
              centerTitle: true,
              leading: CustomBackButton(),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: model.doctors.length,
                      itemBuilder: (context, index) {
                        return DoctorCard(
                          doctor: model.doctors[index],
                          chat: () => Navigator.push(
                            context,
                            CustomPageRoute(
                              page: LiveChatScreen(
                                doctor: model.doctors[index],
                              ),
                            ),
                          ),
                          bookAppointment: () => Navigator.push(
                            context,
                            CustomPageRoute(
                              page: BookingAppointmentScreen(
                                doctor: model.doctors[index],
                              ),
                            ),
                          ),
                          viewProfile: () => Navigator.push(
                            context,
                            CustomPageRoute(
                              page: DoctorProfileScreen(),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, val) {
                        return SizedBox(height: 10);
                      },
                    ),
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
