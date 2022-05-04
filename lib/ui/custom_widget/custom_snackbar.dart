import 'package:flutter/material.dart';

customSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('$message'),
    ),
  );
}
