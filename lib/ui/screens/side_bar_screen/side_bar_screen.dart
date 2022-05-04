import 'package:doctors_de_peshawar/ui/custom_widget/custom_divider.dart';
import 'package:doctors_de_peshawar/ui/screens/side_bar_screen/side_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SidebarProvider(),
      child: Consumer<SidebarProvider>(
        builder: (context, model, child) => Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                margin: EdgeInsets.all(0),
                currentAccountPicture:
                    model.currentUser.appUser.userImageUrl == null
                        ? CircleAvatar(
                            radius: 60,
                          )
                        : CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                "${model.currentUser.appUser.userImageUrl}"),
                          ),
                accountName: Text("${model.currentUser.appUser.userName}"),
                accountEmail: Text("${model.currentUser.appUser.email}"),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("About Us"),
                      onTap: () {},
                    ),
                    CustomDivider(),
                    ListTile(
                      leading: Icon(Icons.help),
                      title: Text("Help"),
                      onTap: () {},
                    ),
                    CustomDivider(),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("Logout"),
                      onTap: () {
                        model.logoutUser(context);
                      },
                    ),
                    CustomDivider(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
