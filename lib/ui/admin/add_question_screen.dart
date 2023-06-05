import 'package:flutter/material.dart';
import 'package:survey_project_front_end/models/survey_post_model.dart';
import 'package:survey_project_front_end/models/user_model.dart';
import 'package:survey_project_front_end/service/api_manager.dart';
import 'package:survey_project_front_end/ui/user/user_dashbord_screen.dart';
import 'package:survey_project_front_end/widgets/custom_button.dart';

// ignore: must_be_immutable
class CreateQuestionAndAnswerScreen extends StatefulWidget {
  static const routeName = '/addquestionandanswerscreen';
  SurveyPosts? survey;
  Users? users;
  CreateQuestionAndAnswerScreen({
    super.key,
    this.survey,
    this.users,
  });

  @override
  State<CreateQuestionAndAnswerScreen> createState() =>
      _CreateQuestionAndAnswerScreenState();
}

class _CreateQuestionAndAnswerScreenState
    extends State<CreateQuestionAndAnswerScreen> {
  final _addQuestionFormKey = GlobalKey<FormState>();
  final _textQuestionController = TextEditingController();
  final List<Answer> _answers = [];

  void _addAnswer() {
    setState(() {
      _answers.add(
        Answer(
          answer: "",
        ),
      );
    });
  }

  void _deleteAnswer(int? index) {
    setState(() {
      _answers.removeAt(index ?? 0);
    });
  }

  void _updateAnswer(int? index, String? value) {
    if (value != null) {
      setState(() {
        _answers[index ?? 0].answer = value;
      });
    }
  }

  void _submitForm() async {
    final isValid = _addQuestionFormKey.currentState?.validate();
    if (isValid ?? false) {
      final question = Question(
        question: _textQuestionController.text,
        answers: _answers,
      );
      final survey = widget.survey?.copyWith(
          questions: [...(widget.survey?.questions ?? []), question]);
      ApiManager()
          .updateSurveyPost(
        context,
        survey?.id,
        survey,
      )
          .then(
        (SurveyPosts? value) {
          if (value != null) {
            Navigator.pushNamed(
              context,
              UserDashbordScreen.routeName,
            );
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add The Survey Questions"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            20,
          ),
          child: Form(
            key: _addQuestionFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _textQuestionController,
                  decoration: const InputDecoration(
                    labelText: "Question",
                    hintText: "Enter Question",
                  ),
                  validator: (value) {
                    if ((value ?? "").isEmpty) {
                      return "Please Enter the Question";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Answers"),
                ..._answers.asMap().entries.map(
                  (entryValue) {
                    final index = entryValue.key;
                    final answer = entryValue.value.answer;
                    return Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            initialValue: answer,
                            decoration: InputDecoration(
                              hintText: "Answer ${index + 1}",
                            ),
                            validator: (value) {
                              if ((value ?? "").isEmpty) {
                                return "Please Enter the Answer";
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) {
                              _updateAnswer(index, value);
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteAnswer(index),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: CustomButton(
                    onClick: _addAnswer,
                    text: "Add Answer",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: CustomButton(
                    onClick: _submitForm,
                    text: "Create Question",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
