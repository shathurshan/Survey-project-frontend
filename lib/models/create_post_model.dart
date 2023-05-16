import 'dart:convert';

CreatePostModel createPostModelFromJson(String str) =>
    CreatePostModel.fromJson(json.decode(str));

String createPostModelToJson(CreatePostModel data) => json.encode(data.toJson());

class CreatePostModel {
  String message;

  CreatePostModel({
    required this.message,
  });

  factory CreatePostModel.fromJson(Map<String, dynamic> json) => CreatePostModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
