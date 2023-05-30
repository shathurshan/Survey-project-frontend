// To parse this JSON data, do
//
//     final submitSurveyPost = submitSurveyPostFromJson(jsonString);

import 'dart:convert';

SubmitSurveyPost submitSurveyPostFromJson(String str) =>
    SubmitSurveyPost.fromJson(json.decode(str));

String submitSurveyPostToJson(SubmitSurveyPost data) =>
    json.encode(data.toJson());

class SubmitSurveyPost {
  String? surveyName;
  List<SubmitSurveyPostQuestion>? questions;

  SubmitSurveyPost({
    required this.surveyName,
    required this.questions,
  });

  factory SubmitSurveyPost.fromJson(Map<String, dynamic> json) =>
      SubmitSurveyPost(
        surveyName: json["surveyName"],
        questions: List<SubmitSurveyPostQuestion>.from(
            json["questions"].map((x) => SubmitSurveyPostQuestion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "surveyName": surveyName,
        "questions":
            List<dynamic>.from((questions ?? []).map((x) => x.toJson())),
      };
}

class SubmitSurveyPostQuestion {
  String? question;
  List<SubmitSurveyPostAnswer>? answers;

  SubmitSurveyPostQuestion({
    required this.question,
    required this.answers,
  });

  factory SubmitSurveyPostQuestion.fromJson(Map<String, dynamic> json) =>
      SubmitSurveyPostQuestion(
        question: json["question"],
        answers: List<SubmitSurveyPostAnswer>.from(
            json["answers"].map((x) => SubmitSurveyPostAnswer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answers": List<dynamic>.from((answers ?? []).map((x) => x.toJson())),
      };
}

class SubmitSurveyPostAnswer {
  String? answer;

  SubmitSurveyPostAnswer({
    required this.answer,
  });

  factory SubmitSurveyPostAnswer.fromJson(Map<String, dynamic> json) =>
      SubmitSurveyPostAnswer(
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
      };
}
