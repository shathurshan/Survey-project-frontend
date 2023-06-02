// To parse this JSON data, do
//
//     final userSurveyResponseModel = userSurveyResponseModelFromJson(jsonString);

import 'dart:convert';

List<UserSurveyResponseModel> userSurveyResponseModelFromJson(String str) =>
    List<UserSurveyResponseModel>.from(
        json.decode(str).map((x) => UserSurveyResponseModel.fromJson(x)));

String userSurveyResponseModelToJson(List<UserSurveyResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserSurveyResponseModel {
  String id;
  String userId;
  List<String> surveyIds;

  UserSurveyResponseModel({
    required this.id,
    required this.userId,
    required this.surveyIds,
  });

  factory UserSurveyResponseModel.fromJson(Map<String, dynamic> json) =>
      UserSurveyResponseModel(
        id: json["id"],
        userId: json["userId"],
        surveyIds: List<String>.from(json["surveyIds"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "surveyIds": List<dynamic>.from(surveyIds.map((x) => x)),
      };
}
