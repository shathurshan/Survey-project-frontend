import 'package:flutter/material.dart';

class ConfirmDialogBox extends StatelessWidget {
  final Function()? onConfirm;
  final String? buttonText;
  final String? textButtonText;
  final String? message;
  const ConfirmDialogBox({
    super.key,
    required this.message,
    required this.onConfirm,
    required this.textButtonText,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Confirm $buttonText'),
      content: Text(message ?? "Add ome Content"),
      actions: [
        TextButton(
          child: const Text(
            "Cancel",
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          child: Text(
            buttonText ?? "Add Some Operation",
          ),
        ),
      ],
    );
  }
}
