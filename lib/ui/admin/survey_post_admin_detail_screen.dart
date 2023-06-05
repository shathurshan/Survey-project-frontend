import 'package:flutter/material.dart';
import 'package:survey_project_front_end/models/survey_post_model.dart';
import 'package:survey_project_front_end/models/user_model.dart';
import 'package:survey_project_front_end/service/api_manager.dart';
import 'package:survey_project_front_end/ui/admin/add_Question_screen.dart';
import 'package:survey_project_front_end/ui/admin/update_question_screen.dart';
import 'package:survey_project_front_end/ui/user/user_dashbord_screen.dart';

class SurveyPostAdminDetailScreen extends StatefulWidget {
  static const routeName = '/surveypostAdmincontrolerscreen';
  final SurveyPosts? surveyPosts;
  final Users? userDetails;
  const SurveyPostAdminDetailScreen({
    super.key,
    this.surveyPosts,
    this.userDetails,
  });

  @override
  State<SurveyPostAdminDetailScreen> createState() =>
      _SurveyPostAdminDetailScreenState();
}

class _SurveyPostAdminDetailScreenState
    extends State<SurveyPostAdminDetailScreen> {
  void _editQuestion(Question question) {
    // Navigate to the question edit screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return UpdateSurveyQuestionScreen(
            question: question,
          );
        },
      ),
    );
    // Pass the question object to the screen
    // Update the survey object with the edited question
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.surveyPosts?.surveyName ?? "",
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'edit',
                child: Text('Edit'),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Text('Delete'),
              ),
            ],
            onSelected: (value) {
              if (value == 'edit') {
              } else if (value == 'delete') {
                ApiManager()
                    .deleteSurveyPostById(
                  context,
                  widget.surveyPosts?.id,
                )
                    .then(
                  (responseValue) {
                    if (responseValue != null) {
                      Navigator.pushNamed(
                        context,
                        UserDashbordScreen.routeName,
                      );
                    }
                  },
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
              ),
              child: Text(
                'Questions List',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...(widget.surveyPosts?.questions ?? [])
                .map((Question? questionList) {
              if (questionList?.question != null) {
                Question? newQuestion = questionList;
              }
              return questionList != null &&
                      (questionList.question?.isNotEmpty ?? false)
                  ? Card(
                      margin: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          _editQuestion((questionList));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 300,
                                    margin: const EdgeInsets.only(
                                      right: 5,
                                      left: 10,
                                    ),
                                    child: Text(
                                      questionList.question ??
                                          "Need To Add Questions",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.delete,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                                width: 20,
                              ),
                              ...(questionList.answers ?? [])
                                  .map((Answer? answerList) {
                                return Padding(
                                  padding: const EdgeInsets.all(
                                    4.0,
                                  ),
                                  child: Text(
                                    answerList?.answer ?? "",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container();
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CreateQuestionAndAnswerScreen(
                  survey: widget.surveyPosts,
                );
              },
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
