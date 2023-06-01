// To parse this JSON data, do
//
//     final sureveyResponse = sureveyResponseFromJson(jsonString);

import 'dart:convert';

SureveyResponse sureveyResponseFromJson(String str) => SureveyResponse.fromJson(json.decode(str));

String sureveyResponseToJson(SureveyResponse data) => json.encode(data.toJson());

class SureveyResponse {
    String surveyId;
    List<String> userId;
    List<SureveyResponseQuestion> questions;

    SureveyResponse({
        required this.surveyId,
        required this.userId,
        required this.questions,
    });

    SureveyResponse copyWith({
        String? surveyId,
        List<String>? userId,
        List<SureveyResponseQuestion>? questions,
    }) => 
        SureveyResponse(
            surveyId: surveyId ?? this.surveyId,
            userId: userId ?? this.userId,
            questions: questions ?? this.questions,
        );

    factory SureveyResponse.fromJson(Map<String, dynamic> json) => SureveyResponse(
        surveyId: json["surveyId"],
        userId: List<String>.from(json["userId"].map((x) => x)),
        questions: List<SureveyResponseQuestion>.from(json["questions"].map((x) => SureveyResponseQuestion.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "surveyId": surveyId,
        "userId": List<dynamic>.from(userId.map((x) => x)),
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
    };
}

class SureveyResponseQuestion {
    String question;
    List<SureveyResponseAnswer> answers;

    SureveyResponseQuestion({
        required this.question,
        required this.answers,
    });

    SureveyResponseQuestion copyWith({
        String? question,
        List<SureveyResponseAnswer>? answers,
    }) => 
        SureveyResponseQuestion(
            question: question ?? this.question,
            answers: answers ?? this.answers,
        );

    factory SureveyResponseQuestion.fromJson(Map<String, dynamic> json) => SureveyResponseQuestion(
        question: json["question"],
        answers: List<SureveyResponseAnswer>.from(json["answers"].map((x) => SureveyResponseAnswer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
    };
}

class SureveyResponseAnswer {
    String answer;
    List<String> userIds;

    SureveyResponseAnswer({
        required this.answer,
        required this.userIds,
    });

    SureveyResponseAnswer copyWith({
        String? answer,
        List<String>? userIds,
    }) => 
        SureveyResponseAnswer(
            answer: answer ?? this.answer,
            userIds: userIds ?? this.userIds,
        );

    factory SureveyResponseAnswer.fromJson(Map<String, dynamic> json) => SureveyResponseAnswer(
        answer: json["answer"],
        userIds: List<String>.from(json["userIds"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "userIds": List<dynamic>.from(userIds.map((x) => x)),
    };
}
