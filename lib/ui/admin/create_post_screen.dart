import 'package:flutter/material.dart';
import 'package:survey_project_front_end/models/survey_post_model.dart';
import 'package:survey_project_front_end/models/user_model.dart';
import 'package:survey_project_front_end/service/api_manager.dart';
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
  final createPostFormKey = GlobalKey<FormState>();
  final _surveyNameController = TextEditingController();

  @override
  void dispose() {
    _surveyNameController.dispose();
    super.dispose();
  }

  void submitSurevy() {
    final isValid = createPostFormKey.currentState?.validate();
    if (isValid ?? false) {
      ApiManager().createPost(
        context,
        _surveyNameController.text,
        Question(
          question: "",
          answers: [],
        ),
      );
    }
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
                TextFormField(
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
                  validator: (value) {
                    if ((value ?? "").isEmpty) {
                      return "Please Enter the Survey Name";
                    } else {
                      return null;
                    }
                  },
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
        child: CustomButton(
          buttonHeight: 50,
          text: "ADD",
          onClick: submitSurevy,
          fontSize: 20,
          fontWeight: FontWeight.w800,
          buttonBackroundColor: Colors.blueGrey,
        ),
      ),
    );
  }
}
