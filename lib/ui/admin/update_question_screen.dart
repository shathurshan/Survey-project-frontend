import 'package:flutter/material.dart';
import 'package:survey_project_front_end/models/survey_post_model.dart';

class UpdateSurveyQuestionScreen extends StatefulWidget {
  final Question? question;
  const UpdateSurveyQuestionScreen({
    super.key,
    this.question,
  });

  @override
  State<UpdateSurveyQuestionScreen> createState() =>
      _UpdateSurveyQuestionScreenState();
}

class _UpdateSurveyQuestionScreenState
    extends State<UpdateSurveyQuestionScreen> {
  var questionTextController = TextEditingController();
  List<Answer>? _options = [];
  @override
  void initState() {
    super.initState();
    questionTextController =
        TextEditingController(text: widget.question?.question);
    _options = List<Answer>.from(widget.question?.answers ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.question?.question ?? ""),
      ),
    );
  }
}
