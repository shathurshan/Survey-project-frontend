import 'package:flutter/material.dart';
import 'package:survey_project_front_end/models/survey_post_model.dart';
import 'package:survey_project_front_end/widgets/custom_button.dart';

class QuestionAnswerDashbordScreen extends StatefulWidget {
  static const routeName = '/questionanswerdashbordscreen';
  final SurveyPosts? surveyPosts;
  const QuestionAnswerDashbordScreen({
    super.key,
    this.surveyPosts,
  });

  @override
  State<QuestionAnswerDashbordScreen> createState() =>
      _QuestionAnswerDashbordScreenState();
}

class _QuestionAnswerDashbordScreenState
    extends State<QuestionAnswerDashbordScreen> {
  String? selectedAnswer;
  Color? backgroundColor = Colors.white;
  bool? isSelected = false;
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
          child: SingleChildScrollView(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.surveyPosts?.questions?.length,
              itemBuilder: (context, index) {
                Question? surveyQution = widget.surveyPosts?.questions?[index];
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 10.0,
                    right: 10.0,
                    bottom: 20.0,
                  ),
                  margin: const EdgeInsets.only(
                    bottom: 10.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${(index + 1)}. "),
                          Text(surveyQution?.question ?? ""),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: surveyQution?.answers?.length,
                        itemBuilder: (context, index) {
                          Answer? surveyQutionAnswer =
                              surveyQution?.answers?[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = true;
                                selectedAnswer = surveyQutionAnswer?.answer;
                                backgroundColor = (isSelected ?? false)
                                    ? Colors.green
                                    : Colors.white;
                              });
                              print(surveyQutionAnswer?.answer);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                top: 20.0,
                                left: 10.0,
                                right: 10.0,
                                bottom: 20.0,
                              ),
                              margin: const EdgeInsets.only(
                                bottom: 10.0,
                              ),
                              decoration: BoxDecoration(
                                color: backgroundColor ?? Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(surveyQutionAnswer?.answer ?? ""),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomButton(
        buttonHeight: 70,
        text: "Submit",
        fontSize: 40,
        fontWeight: FontWeight.w800,
        buttonBackroundColor: Colors.blueGrey,
      ),
    );
  }
}
