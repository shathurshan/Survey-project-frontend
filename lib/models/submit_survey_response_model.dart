import 'dart:convert';

SubmitSurveyResponse submitSurveyResponseFromJson(String str) =>
    SubmitSurveyResponse.fromJson(json.decode(str));

String submitSurveyResponseToJson(SubmitSurveyResponse data) =>
    json.encode(data.toJson());

class SubmitSurveyResponse {
  String surveyName;
  List<SubmitsurveyQuestions> questions;

  SubmitSurveyResponse({
    required this.surveyName,
    required this.questions,
  });

  factory SubmitSurveyResponse.fromJson(Map<String, dynamic> json) =>
      SubmitSurveyResponse(
        surveyName: json["surveyName"],
        questions: List<SubmitsurveyQuestions>.from(
          json["questions"].map(
            (x) => SubmitsurveyQuestions.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "surveyName": surveyName,
        "questions": List<dynamic>.from(
          questions.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class SubmitsurveyQuestions {
  String question;
  String answer;

  SubmitsurveyQuestions({
    required this.question,
    required this.answer,
  });

  factory SubmitsurveyQuestions.fromJson(Map<String, dynamic> json) =>
      SubmitsurveyQuestions(
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
      };
}
