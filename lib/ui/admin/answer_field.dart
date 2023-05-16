import 'package:flutter/material.dart';

class CreatePostAnswerField extends StatelessWidget {
  final int? answerNumber;
  const CreatePostAnswerField({
    super.key,
    this.answerNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: "Answer $answerNumber",
          labelStyle: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
