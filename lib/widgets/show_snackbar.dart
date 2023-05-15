import 'package:flutter/material.dart';

SnackBar showSnackBarToScreen(String? content) {
  final snackBar = SnackBar(
    content: Text(content ?? "Error Message"),
    duration: const Duration(
      seconds: 10,
    ),
  );
  return snackBar;
}
