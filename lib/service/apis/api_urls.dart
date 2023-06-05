class ApiStrings {
  static const String ip = "192.168.1.101";
  static const String getPosts = "http://$ip:8080/api/survey/posts";
  static const String getPostsById = "http://$ip:8080/api/survey/posts/id";
  static const String updatePostById =
      "http://$ip:8080/api/survey/postupdate/id";
  static const String deletePostById =
      "http://$ip:8080/api/survey/postdelete/{id}";
  static const String createPost = "http://$ip:8080/api/survey/create";
  static const String signIn = "http://$ip:8080/api/auth/signin";
  static const String signUp = "http://$ip:8080/api/auth/signup";
  static const String getSurveyResponse = "http://$ip:8080/api/response/posts";
  static const String getSurveyResponseById =
      "http://$ip:8080/api/response/posts/id";
  static const String createSurveyResponse =
      "http://$ip:8080/api/response/create";
  static const String deletesurveyPostById =
      "http://$ip:8080/api/survey/postdelete/id";
  static const String getAllUserSurveyResponse =
      "http://$ip:8080/api/userSurveyResponse/getAll";

  static var getPostsUrl = Uri.parse(getPosts);
  static var userSignin = Uri.parse(signIn);
  static var userSignUp = Uri.parse(signUp);
  static var createPostUrl = Uri.parse(createPost);
  static var getPostByIdUrl = Uri.parse(getPostsById);
  static var getSurveyResponseUrl = Uri.parse(getSurveyResponse);
  static var getSurveyResponseByIdUrl = Uri.parse(getSurveyResponseById);
  static var createResponseUrl = Uri.parse(createSurveyResponse);
  static var getAllSurveyResponseUrl = Uri.parse(getAllUserSurveyResponse);
}
