import 'dart:convert';

List<SurveyPosts> surveyPostsFromJson(String str) => List<SurveyPosts>.from(
    json.decode(str).map((x) => SurveyPosts.fromJson(x)));

String surveyPostsToJson(List<SurveyPosts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SurveyPosts {
  String? id;
  String? surveyName;
  List<Question>? questions;

  SurveyPosts({
    required this.id,
    required this.surveyName,
    required this.questions,
  });

  SurveyPosts copyWith({
    String? id,
    String? surveyName,
    List<Question>? questions,
  }) {
    return SurveyPosts(
      id: id ?? this.id,
      surveyName: surveyName ?? this.surveyName,
      questions: questions ?? this.questions,
    );
  }

  factory SurveyPosts.fromJson(Map<String, dynamic> json) => SurveyPosts(
        id: json["id"],
        surveyName: json["surveyName"],
        questions: List<Question>.from(
          json["questions"].map(
            (x) => Question.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surveyName": surveyName,
        "questions": List<dynamic>.from(
          (questions ?? []).map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class Question {
  int? id;
  String? question;
  List<Answer>? answers;

  Question({
    this.id,
    required this.question,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        answers: List<Answer>.from(
          json["answers"].map(
            (x) => Answer.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answers": List<dynamic>.from(
          (answers ?? []).map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class Answer {
  int? id;
  String? answer;

  Answer({
    this.id,
    required this.answer,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "answer": answer,
      };
}
