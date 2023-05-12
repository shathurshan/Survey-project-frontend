import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:survey_project_front_end/models/survey_post_model.dart';
import 'package:survey_project_front_end/service/apis/api_urls.dart';

class ApiManager {
  Future<SurveyPosts> getSurveyPost() async {
    var client = http.Client();
    var surveyPostModel;
    http.Response response;

    try {
      response = await http.get(ApiStrings.getPostsUrl);
      if (response.statusCode == 200) {
        var jsonSring = response.body;
        var jsonMap = json.decode(jsonSring);
        surveyPostModel = SurveyPosts.fromJson(jsonMap);
        print(surveyPostModel);
      }
    } catch (e) {
      print("error1234");
      print(e);
    }
    return surveyPostModel;
  }
}
