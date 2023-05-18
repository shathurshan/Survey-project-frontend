// To parse this JSON data, do
//
//     final SureveyResponse = SureveyResponseFromJson(jsonString);

import 'dart:convert';

List<SureveyResponse> elcomeFromJson(String str) => List<SureveyResponse>.from(
    json.decode(str).map((x) => SureveyResponse.fromJson(x)));

String elcomeToJson(List<SureveyResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SureveyResponse {
  String id;
  String surveyName;
  List<SureveyResponseQuestion> questions;

  SureveyResponse({
    required this.id,
    required this.surveyName,
    required this.questions,
  });

  factory SureveyResponse.fromJson(Map<String, dynamic> json) =>
      SureveyResponse(
        id: json["id"],
        surveyName: json["surveyName"],
        questions: List<SureveyResponseQuestion>.from(
            json["questions"].map((x) => SureveyResponseQuestion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surveyName": surveyName,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class SureveyResponseQuestion {
  int id;
  String question;
  String answer;

  SureveyResponseQuestion({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory SureveyResponseQuestion.fromJson(Map<String, dynamic> json) =>
      SureveyResponseQuestion(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
      };
}
