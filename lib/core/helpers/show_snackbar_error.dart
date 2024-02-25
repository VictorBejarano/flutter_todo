import 'package:flutter/material.dart';

/// Visualiza el snackbar para errores
void showSnackBarError(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
  ));
}
