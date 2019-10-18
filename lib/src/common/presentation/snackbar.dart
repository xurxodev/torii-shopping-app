import 'package:flutter/material.dart';

void showSnackBarPostFrame(BuildContext context, String message) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final snackBar =
        SnackBar(backgroundColor: Colors.blue, content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  });
}
