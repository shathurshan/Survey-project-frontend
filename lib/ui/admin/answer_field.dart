import 'package:flutter/material.dart';

class CreatePostAnswerField extends StatefulWidget {
  final int? answerNumber;
  final Function(String)? callback;
  const CreatePostAnswerField({
    super.key,
    this.answerNumber,
    this.callback,
  });

  @override
  State<CreatePostAnswerField> createState() => _CreatePostAnswerFieldState();
}

class _CreatePostAnswerFieldState extends State<CreatePostAnswerField> {
  final _surveyQuestionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: TextField(
        controller: _surveyQuestionController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: "Answer ${widget.answerNumber}",
          labelStyle: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        onChanged: (value) {
          widget.callback != null ? (value) : ("");
          setState(() {
            _surveyQuestionController.text = value;
          });
        },
      ),
    );
  }
}
