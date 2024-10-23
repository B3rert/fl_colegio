import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackBar = SnackBar(
      elevation: 0.01,
      content: Text(
        message,
      ),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
