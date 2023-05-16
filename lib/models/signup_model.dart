import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  String message;

  SignUpModel({
    required this.message,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
