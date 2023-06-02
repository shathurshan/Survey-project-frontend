// To parse this JSON data, do
//
//     final submitSurveyResponseModel = submitSurveyResponseModelFromJson(jsonString);

import 'dart:convert';

SubmitSurveyResponseModel submitSurveyResponseModelFromJson(String str) =>
    SubmitSurveyResponseModel.fromJson(json.decode(str));

String submitSurveyResponseModelToJson(SubmitSurveyResponseModel data) =>
    json.encode(data.toJson());

class SubmitSurveyResponseModel {
  String? surveyId;
  List<SubmitSurveyQuestion>? questions;

  SubmitSurveyResponseModel({
    required this.surveyId,
    required this.questions,
  });

  SubmitSurveyResponseModel copyWith({
    String? surveyId,
    List<SubmitSurveyQuestion>? questions,
  }) =>
      SubmitSurveyResponseModel(
        surveyId: surveyId ?? this.surveyId,
        questions: questions ?? this.questions,
      );

  factory SubmitSurveyResponseModel.fromJson(Map<String, dynamic> json) =>
      SubmitSurveyResponseModel(
        surveyId: json["surveyId"],
        questions: List<SubmitSurveyQuestion>.from(
            json["questions"].map((x) => SubmitSurveyQuestion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "surveyId": surveyId,
        "questions":
            List<dynamic>.from((questions ?? []).map((x) => x.toJson())),
      };
}

class SubmitSurveyQuestion {
  String? question;
  List<SubmitSurveyAnswer>? answers;

  SubmitSurveyQuestion({
    required this.question,
    required this.answers,
  });

  SubmitSurveyQuestion copyWith({
    String? question,
    List<SubmitSurveyAnswer>? answers,
  }) =>
      SubmitSurveyQuestion(
        question: question ?? this.question,
        answers: answers ?? this.answers,
      );

  factory SubmitSurveyQuestion.fromJson(Map<String, dynamic> json) =>
      SubmitSurveyQuestion(
        question: json["question"],
        answers: List<SubmitSurveyAnswer>.from(
            json["answers"].map((x) => SubmitSurveyAnswer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answers": List<dynamic>.from((answers ?? []).map((x) => x.toJson())),
      };
}

class SubmitSurveyAnswer {
  String? answer;
  List<String>? userIds;

  SubmitSurveyAnswer({
    required this.answer,
    required this.userIds,
  });

  SubmitSurveyAnswer copyWith({
    String? answer,
    List<String>? userIds,
  }) =>
      SubmitSurveyAnswer(
        answer: answer ?? this.answer,
        userIds: userIds ?? this.userIds,
      );

  factory SubmitSurveyAnswer.fromJson(Map<String, dynamic> json) =>
      SubmitSurveyAnswer(
        answer: json["answer"],
        userIds: List<String>.from(json["userIds"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "userIds": List<dynamic>.from((userIds ?? []).map((x) => x)),
      };
}
