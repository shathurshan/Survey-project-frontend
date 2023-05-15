import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:survey_project_front_end/models/survey_post_model.dart';
import 'package:survey_project_front_end/models/user_model.dart';
import 'package:survey_project_front_end/service/apis/api_urls.dart';
import 'package:survey_project_front_end/widgets/show_snackbar.dart';

class ApiManager {
  Future<String?> signUpUsers(
    BuildContext context,
    String? username,
    String? email,
    String? password,
    String? roles,
  ) async {
    http.Response response;
    String? message;
    String body = json.encode({
      "username": username,
      "email": email,
      "password": password,
      "roles": roles
    });
    try {
      response = await http.post(
        ApiStrings.userSignUp,
        headers: {
          "Accept": "*/*",
          "Content-Type": "application/json",
          "User-Agent": "PostmanRuntime/7.28.4",
          "Accept-Encoding": "gzip, deflate, br",
          "Connection": "keep-alive"
        },
        body: body,
        encoding: Encoding.getByName("utf-8"),
      );
      if (response.statusCode == 200) {
        var jsonSring = response.body;
        var jsonMap = json.decode(jsonSring);
        message = jsonMap;
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            message,
          ),
        );
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            "Unauthorized Access",
          ),
        );
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarToScreen(
          e.toString(),
        ),
      );
    }
    return message;
  }

  Future<Users?> signInUsers(
    BuildContext context,
    String? userName,
    String? password,
  ) async {
    Users? userModel;
    http.Response response;
    String body = json.encode({'username': userName, 'password': password});
    try {
      response = await http.post(
        ApiStrings.userSignin,
        headers: {
          "Accept": "*/*",
          "Content-Type": "application/json",
          "User-Agent": "PostmanRuntime/7.28.4",
          "Accept-Encoding": "gzip, deflate, br",
          "Connection": "keep-alive"
        },
        body: body,
        encoding: Encoding.getByName("utf-8"),
      );
      if (response.statusCode == 200) {
        var jsonSring = response.body;
        var jsonMap = json.decode(jsonSring);
        userModel = Users.fromJson(jsonMap);
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            "Your sucessfully login to the App",
          ),
        );
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            "Unauthorized Access",
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarToScreen(
          e.toString(),
        ),
      );
    }
    return userModel;
  }

  Future<SurveyPosts?> getSurveyPost(
    BuildContext context,
    String? type,
    String? token,
  ) async {
    SurveyPosts? surveyPostModel;
    http.Response response;
    try {
      response = await http.get(
        ApiStrings.getPostsUrl,
        headers: {
          "Authorization": "$type $token",
        },
      );
      if (response.statusCode == 200) {
        var jsonSring = response.body;
        var jsonMap = json.decode(jsonSring);
        surveyPostModel = SurveyPosts.fromJson(jsonMap[0]);
        print(surveyPostModel.surveyName);
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            "Unauthorized Access",
          ),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarToScreen(
          e.toString(),
        ),
      );
    }
    return surveyPostModel;
  }
}
