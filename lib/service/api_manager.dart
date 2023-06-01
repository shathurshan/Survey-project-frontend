import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survey_project_front_end/models/signup_model.dart';
import 'package:survey_project_front_end/models/submit_survey_response_model.dart';
import 'package:survey_project_front_end/models/survey_post_model.dart';
import 'package:survey_project_front_end/models/survey_response_model.dart';
import 'package:survey_project_front_end/models/user_model.dart';
import 'package:survey_project_front_end/service/apis/api_urls.dart';
import 'package:survey_project_front_end/widgets/show_snackbar.dart';

class ApiManager {
  Future<CommonMessageResponseModel?> signUpUsers(
    BuildContext context,
    String? username,
    String? email,
    String? password,
    String? roles,
  ) async {
    http.Response response;
    CommonMessageResponseModel? signupModel;
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
        signupModel = CommonMessageResponseModel.fromJson(jsonMap);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            signupModel.message,
          ),
        );
      } else if (response.statusCode == 401) {
        // ignore: use_build_context_synchronously
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
    return signupModel;
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
        SharedPreferences preferences = await SharedPreferences.getInstance();
        var jsonSring = response.body;
        var jsonMap = json.decode(jsonSring);
        userModel = Users.fromJson(jsonMap);
        String? accessToken = userModel.token;
        preferences.setString("token", accessToken ?? "");
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            "Your sucessfully login to the App",
          ),
        );
      } else if (response.statusCode == 401) {
        // ignore: use_build_context_synchronously
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

  Future<void> logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  Future<List<dynamic>?> getAllSurveyPost(
    BuildContext context,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    List<SurveyPosts>? surveyPostModel;
    http.Response response;
    try {
      response = await http.get(
        ApiStrings.getPostsUrl,
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else if (response.statusCode == 401) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            "Unauthorized Access",
          ),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarToScreen(
          e.toString(),
        ),
      );
    }
    return surveyPostModel;
  }

  Future<CommonMessageResponseModel?> createPost(
    BuildContext context,
    String? surveyName,
    Question? questions,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    http.Response response;
    CommonMessageResponseModel? createPostModel;
    String body = json.encode({
      "surveyName": surveyName,
      "questions": [questions]
    });
    try {
      response = await http.post(
        ApiStrings.createPostUrl,
        headers: {
          "Accept": "*/*",
          "Content-Type": "application/json",
          "User-Agent": "PostmanRuntime/7.28.4",
          "Accept-Encoding": "gzip, deflate, br",
          "Connection": "keep-alive",
          "Authorization": "Bearer $token"
        },
        body: body,
        encoding: Encoding.getByName("utf-8"),
      );
      if (response.statusCode == 200) {
        var jsonSring = response.body;
        var jsonMap = json.decode(jsonSring);
        createPostModel = CommonMessageResponseModel.fromJson(jsonMap);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            createPostModel.message,
          ),
        );
      } else if (response.statusCode == 401) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            "Unauthorized Access",
          ),
        );
      } else if (response.statusCode == 400) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            "Error: Survey Name is already exist!",
          ),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarToScreen(
          e.toString(),
        ),
      );
    }
    return createPostModel;
  }

  Future<SurveyPosts?> getSurveyPostById(
    BuildContext context,
    String? postId,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    SurveyPosts? surveyPost;
    http.Response response;
    try {
      response = await http.get(
        Uri.parse(ApiStrings.getPostsById.replaceAll("id", postId ?? "")),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        surveyPost = SurveyPosts.fromJson(jsonResponse);
      } else if (response.statusCode == 401) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            "Unauthorized Access",
          ),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarToScreen(
          e.toString(),
        ),
      );
    }
    return surveyPost;
  }

  Future<List<dynamic>?> getAllSurveyResponse(
    BuildContext context,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    List<SureveyResponse>? surveyResponesModel;
    http.Response response;
    try {
      response = await http.get(
        ApiStrings.getSurveyResponseUrl,
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        return jsonResponse;
      } else if (response.statusCode == 401) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            "Unauthorized Access",
          ),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarToScreen(
          e.toString(),
        ),
      );
    }
    return surveyResponesModel;
  }

  Future<SureveyResponse?> getSurveyResponseById(
    BuildContext context,
    String? responseId,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    SureveyResponse? surveyResponse;
    http.Response response;
    try {
      response = await http.get(
        Uri.parse(ApiStrings.getSurveyResponseById
            .replaceAll("id", responseId ?? "")),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        surveyResponse = SureveyResponse.fromJson(jsonResponse);
      } else if (response.statusCode == 401) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            "Unauthorized Access",
          ),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarToScreen(
          e.toString(),
        ),
      );
    }
    return surveyResponse;
  }

  Future<CommonMessageResponseModel?> createSurveyResponse(
    BuildContext context,
    String? surveyName,
    List<SubmitsurveyQuestions>? questions,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    http.Response response;
    CommonMessageResponseModel? surveyResponse;
    String body = json.encode({
      "surveyName": surveyName,
      "questions": questions,
    });
    try {
      response = await http.post(
        ApiStrings.createResponseUrl,
        headers: {
          "Accept": "*/*",
          "Content-Type": "application/json",
          "User-Agent": "PostmanRuntime/7.28.4",
          "Accept-Encoding": "gzip, deflate, br",
          "Connection": "keep-alive",
          "Authorization": "Bearer $token"
        },
        body: body,
        encoding: Encoding.getByName("utf-8"),
      );
      if (response.statusCode == 200) {
        var jsonSring = response.body;
        var jsonMap = json.decode(jsonSring);
        surveyResponse = CommonMessageResponseModel.fromJson(jsonMap);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            surveyResponse.message,
          ),
        );
      } else if (response.statusCode == 401) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            "Unauthorized Access",
          ),
        );
      } else if (response.statusCode == 400) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            "Error: Survey Name is already exist!",
          ),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarToScreen(
          e.toString(),
        ),
      );
    }
    return surveyResponse;
  }

  Future<CommonMessageResponseModel?> deleteSurveyPostById(
    BuildContext context,
    String? postId,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    CommonMessageResponseModel? surveyPost;
    http.Response response;
    try {
      response = await http.delete(
        Uri.parse(
            ApiStrings.deletesurveyPostById.replaceAll("id", postId ?? "")),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            "The Post is Deleted Successfully",
          ),
        );
        return jsonResponse;
      } else if (response.statusCode == 401) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          showSnackBarToScreen(
            "Unauthorized Access",
          ),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBarToScreen(
          e.toString(),
        ),
      );
    }
    return surveyPost;
  }
}
