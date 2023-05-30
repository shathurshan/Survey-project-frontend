import 'package:flutter/material.dart';
import 'package:survey_project_front_end/models/survey_post_model.dart';
import 'package:survey_project_front_end/models/user_model.dart';

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
                print("edit");
              } else if (value == 'delete') {
                print("delete");
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Text("survey detail page"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          print("need to add the questions here");
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
