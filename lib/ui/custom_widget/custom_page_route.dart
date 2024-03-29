import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;

  CustomPageRoute({required this.page})
      : super(
          transitionDuration: Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => page,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
