import 'package:flutter/material.dart';
import 'package:survey_project_front_end/models/survey_response_model.dart';
import 'package:survey_project_front_end/service/api_manager.dart';
import 'package:survey_project_front_end/ui/user/view_response_screen.dart';
import 'package:survey_project_front_end/widgets/survey_post_card.dart';

class ResponseDashbordScreen extends StatefulWidget {
  static const routeName = '/responsedashbordscreen';
  final List<dynamic>? responseData;
  final String? userId;
  const ResponseDashbordScreen({
    super.key,
    this.responseData,
    this.userId,
  });

  @override
  State<ResponseDashbordScreen> createState() => _ResponseDashbordScreenState();
}

class _ResponseDashbordScreenState extends State<ResponseDashbordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Response Dashbord"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
            top: 20.0,
            bottom: 20.0,
          ),
          child: ListView.builder(
            itemCount: widget.responseData?.length,
            itemBuilder: (context, index) {
              return SurveyPostCard(
                surveyName: widget.responseData?[index]["surveyId"],
                onClickCardFunction: () {
                  ApiManager()
                      .getSurveyResponseById(
                    context,
                    widget.responseData?[index]["id"],
                  )
                      .then(
                    (SureveyResponse? value) {
                      if (value != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ViewResponseScreen(
                                surveyResponseDetails: value,
                                userId: widget.userId,
                              );
                            },
                          ),
                        );
                      }
                    },
                  );
                },
                surveyId: widget.responseData?[index]["id"],
              );
            },
          ),
        ),
      ),
    );
  }
}
