// To parse this JSON data, do
//
//     final sureveyResponse = sureveyResponseFromJson(jsonString);

import 'dart:convert';

SureveyResponse sureveyResponseFromJson(String str) => SureveyResponse.fromJson(json.decode(str));

String sureveyResponseToJson(SureveyResponse data) => json.encode(data.toJson());

class SureveyResponse {
    String id;
    String surveyId;
    List<SureveyResponseQuestion> questions;

    SureveyResponse({
        required this.id,
        required this.surveyId,
        required this.questions,
    });

    SureveyResponse copyWith({
        String? id,
        String? surveyId,
        List<SureveyResponseQuestion>? questions,
    }) => 
        SureveyResponse(
            id: id ?? this.id,
            surveyId: surveyId ?? this.surveyId,
            questions: questions ?? this.questions,
        );

    factory SureveyResponse.fromJson(Map<String, dynamic> json) => SureveyResponse(
        id: json["id"],
        surveyId: json["surveyId"],
        questions: List<SureveyResponseQuestion>.from(json["questions"].map((x) => SureveyResponseQuestion.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "surveyId": surveyId,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
    };
}

class SureveyResponseQuestion {
    int id;
    String question;
    List<SureveyResponseAnswer> answers;

    SureveyResponseQuestion({
        required this.id,
        required this.question,
        required this.answers,
    });

    SureveyResponseQuestion copyWith({
        int? id,
        String? question,
        List<SureveyResponseAnswer>? answers,
    }) => 
        SureveyResponseQuestion(
            id: id ?? this.id,
            question: question ?? this.question,
            answers: answers ?? this.answers,
        );

    factory SureveyResponseQuestion.fromJson(Map<String, dynamic> json) => SureveyResponseQuestion(
        id: json["id"],
        question: json["question"],
        answers: List<SureveyResponseAnswer>.from(json["answers"].map((x) => SureveyResponseAnswer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
    };
}

class SureveyResponseAnswer {
    int id;
    String answer;
    List<String> userIds;

    SureveyResponseAnswer({
        required this.id,
        required this.answer,
        required this.userIds,
    });

    SureveyResponseAnswer copyWith({
        int? id,
        String? answer,
        List<String>? userIds,
    }) => 
        SureveyResponseAnswer(
            id: id ?? this.id,
            answer: answer ?? this.answer,
            userIds: userIds ?? this.userIds,
        );

    factory SureveyResponseAnswer.fromJson(Map<String, dynamic> json) => SureveyResponseAnswer(
        id: json["id"],
        answer: json["answer"],
        userIds: List<String>.from(json["userIds"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "answer": answer,
        "userIds": List<dynamic>.from(userIds.map((x) => x)),
    };
}
