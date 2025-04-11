import 'package:app/shared.dart';
import 'package:flutter/material.dart';

extension SnackbarExtension on BuildContext {
  void showSnackBar(String msg, {int duration = 4, SnackBarAction? action}) {
    ScaffoldMessenger.of(this)
        .showSnackBar(
          SnackBar(
            content: Text(msg),
            showCloseIcon: true,
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: duration),
            action: action,
          ),
        )
        .closed
        .then((value) {
          ScaffoldMessenger.of(rootNavigatorKey.currentContext!).removeCurrentSnackBar();
        });
  }
}
