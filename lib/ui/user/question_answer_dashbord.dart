import 'package:flutter/material.dart';
import 'package:survey_project_front_end/models/submit_survey_response_model.dart';
import 'package:survey_project_front_end/models/survey_post_model.dart';
import 'package:survey_project_front_end/service/api_manager.dart';
import 'package:survey_project_front_end/ui/user/user_dashbord_screen.dart';
import 'package:survey_project_front_end/widgets/custom_button.dart';

class QuestionAnswerDashbordScreen extends StatefulWidget {
  static const routeName = '/questionanswerdashbordscreen';
  final SurveyPosts? surveyPosts;
  final String? surveyName;
  final String? type;
  final String? token;
  const QuestionAnswerDashbordScreen({
    super.key,
    this.surveyPosts,
    this.surveyName,
    this.token,
    this.type,
  });

  @override
  State<QuestionAnswerDashbordScreen> createState() =>
      _QuestionAnswerDashbordScreenState();
}

class _QuestionAnswerDashbordScreenState
    extends State<QuestionAnswerDashbordScreen> {
  var _questionIndex = 0;
  String? buttonText = "Next Questions";
  String? selectedAnswer;
  String? answeredQuestion;
  List<SubmitsurveyQuestions>? questionList = [];

  void _answerQuestion() {
    _questionIndex = _questionIndex + 1;
    if (_questionIndex < (widget.surveyPosts?.questions?.length ?? 1)) {
      setState(() {
        buttonText = "Next Questions";
      });
    } else {
      setState(() {
        buttonText = "Submit";
      });
    }
    setState(() {
      questionList?.add(
        SubmitsurveyQuestions(
          question: answeredQuestion ?? "",
          answer: selectedAnswer ?? "",
        ),
      );
    });
  }

  void addingToQuestionList(String answer) {
    setState(() {
      selectedAnswer = answer;
      answeredQuestion =
          _questionIndex <= (widget.surveyPosts?.questions?.length ?? 1)
              ? (widget.surveyPosts?.questions ?? [])[_questionIndex].question
              : "";
    });
  }

  void submitSurveyAnswers() {
    ApiManager().createSurveyResponse(
      context,
      SubmitSurveyResponse(
        surveyName: widget.surveyName ?? "",
        questions: questionList ?? [],
      ),
      widget.type,
      widget.token,
    );
    Navigator.of(context).pushNamed(
      UserDashbordScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surveyPosts?.surveyName ?? ""),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
            bottom: 10.0,
            right: 25.0,
            left: 25.0,
          ),
          child: _questionIndex < (widget.surveyPosts?.questions?.length ?? 1)
              ? Column(
                  children: [
                    question(
                      context,
                      widget.surveyPosts?.questions?[_questionIndex].question
                          .toString(),
                    ), //Question
                    ...(widget.surveyPosts?.questions?[_questionIndex]
                                .answers ??
                            [])
                        .map(
                      (Answer? answersList) {
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () =>
                                addingToQuestionList(answersList?.answer ?? ""),
                            style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(
                                    const TextStyle(color: Colors.white)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green)),
                            child: Text(
                              answersList?.answer ?? "",
                            ),
                          ),
                        );
                      },
                    ).toList()
                  ],
                ) //Quiz
              : const Center(
                  child: Text("Thanks for answering the questions"),
                ),
        ),
      ),
      bottomNavigationBar: CustomButton(
        buttonHeight: 70,
        text: buttonText ?? "submit",
        fontSize: 40,
        fontWeight: FontWeight.w800,
        buttonBackroundColor: Colors.blueGrey,
        onClick: buttonText == "Submit" ? submitSurveyAnswers : _answerQuestion,
      ),
    );
  }

  Widget question(
    BuildContext context,
    String? questionText,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText ?? "",
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ), //Text
    ); //Container
  }
}
