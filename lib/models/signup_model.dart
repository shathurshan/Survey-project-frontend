import 'dart:convert';

CommonMessageResponseModel commonMessageResponseModelFromJson(String str) =>
    CommonMessageResponseModel.fromJson(json.decode(str));

String commonMessageResponseModelToJson(CommonMessageResponseModel data) => json.encode(data.toJson());

class CommonMessageResponseModel {
  String message;

  CommonMessageResponseModel({
    required this.message,
  });

  factory CommonMessageResponseModel.fromJson(Map<String, dynamic> json) => CommonMessageResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
