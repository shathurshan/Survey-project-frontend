import 'package:flutter/material.dart';
import 'package:survey_project_front_end/models/submit_survey_post_model.dart';
import 'package:survey_project_front_end/models/user_model.dart';
import 'package:survey_project_front_end/widgets/custom_button.dart';

class CreatePostSceen extends StatefulWidget {
  static const routeName = '/createsurveypostscreen';
  final Users? userDetails;
  const CreatePostSceen({
    super.key,
    this.userDetails,
  });

  @override
  State<CreatePostSceen> createState() => _CreatePostSceenState();
}

class _CreatePostSceenState extends State<CreatePostSceen> {
  var i = 1;
  final createPostFormKey = GlobalKey<FormState>();
  final _surveyNameController = TextEditingController();
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();
  final List<SubmitSurveyPostQuestion>? questionList = [];
  final List<SubmitSurveyPostAnswer>? answerList = [];

  @override
  void dispose() {
    _surveyNameController.dispose();
    _questionController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Survey"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
            top: 20.0,
            bottom: 20.0,
          ),
          child: Form(
            key: createPostFormKey,
            child: Column(
              children: [
                (questionList ?? []).isEmpty
                    ? TextFormField(
                        controller: _surveyNameController,
                        decoration: const InputDecoration(
                          labelText: "Survey Name",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    : Container(),
                const SizedBox(
                  height: 20.0,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 35.0,
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _questionController,
                          decoration: const InputDecoration(
                            labelText: "Question",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: i,
                          itemBuilder: (context, index) {
                            return TextFormField(
                              controller: _answerController,
                              decoration: const InputDecoration(
                                labelText: "Answer",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomButton(
                          buttonHeight: 30,
                          buttonWidth: 80,
                          text: "Add Answer",
                          onClick: () {
                            setState(() {
                              i++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              buttonHeight: 50,
              text: "ADD",
              onClick: () {},
              fontSize: 20,
              fontWeight: FontWeight.w800,
              buttonBackroundColor: Colors.blueGrey,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: CustomButton(
                buttonHeight: 50,
                text: "POST",
                onClick: () {},
                fontSize: 20,
                fontWeight: FontWeight.w800,
                buttonBackroundColor: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
