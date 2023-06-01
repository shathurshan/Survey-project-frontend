import 'package:flutter/material.dart';
import 'package:survey_project_front_end/models/survey_response_model.dart';

class ViewResponseScreen extends StatelessWidget {
  static const routeName = '/userviewresponsescreen';
  final SureveyResponse? surveyResponseDetails;
  final String? userId;
  const ViewResponseScreen({
    super.key,
    this.surveyResponseDetails,
    this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surveyResponseDetails?.surveyId ?? ""),
        centerTitle: true,
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
              itemCount: surveyResponseDetails?.questions.length,
              itemBuilder: (context, index) {
                SureveyResponseQuestion? question =
                    surveyResponseDetails?.questions[index];
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
                          Text(question?.question ?? ""),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: question?.answers.length,
                        itemBuilder: (context, ind) {
                          SureveyResponseAnswer? answer =
                              question?.answers[ind];
                          return answer?.userIds.contains(userId) ?? false
                              ? Container(
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
                                    color: Colors.green,
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
                                      Text(
                                        answer?.answer ?? "",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container();
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
    );
  }
}
