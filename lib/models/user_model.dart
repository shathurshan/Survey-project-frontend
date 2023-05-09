
import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  String? token;
  String? type;
  String? id;
  String? username;
  String? email;
  String? roles;

  Users({
    required this.token,
    required this.type,
    required this.id,
    required this.username,
    required this.email,
    required this.roles,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        token: json["token"],
        type: json["type"],
        id: json["id"],
        username: json["username"],
        email: json["email"],
        roles: json["roles"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "type": type,
        "id": id,
        "username": username,
        "email": email,
        "roles": roles,
      };
}
