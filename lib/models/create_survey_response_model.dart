import 'dart:convert';

CreateSurveyResponseModel createSurveyResponseModelFromJson(String str) =>
    CreateSurveyResponseModel.fromJson(json.decode(str));

String createSurveyResponseModelToJson(CreateSurveyResponseModel data) => json.encode(data.toJson());

class CreateSurveyResponseModel {
  String message;

  CreateSurveyResponseModel({
    required this.message,
  });

  factory CreateSurveyResponseModel.fromJson(Map<String, dynamic> json) => CreateSurveyResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
