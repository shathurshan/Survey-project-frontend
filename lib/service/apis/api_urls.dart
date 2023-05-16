class ApiStrings {
  static const String ip = "192.168.85.56";
  static const String getPosts = "http://$ip:8080/api/survey/posts";
  static const String getPostsById = "http://$ip:8080/api/survey/posts/{{id}}";
  static const String updatePostById =
      "http://$ip:8080/api/survey/postupdate/{id}";
  static const String deletePostById =
      "http://$ip:8080/api/survey/postdelete/{id}";
  static const String createPost = "http://$ip:8080/api/survey/create";
  static const String signIn = "http://$ip:8080/api/auth/signin";
  static const String signUp = "http://$ip:8080/api/auth/signup";

  static var getPostsUrl = Uri.parse(getPosts);
  static var userSignin = Uri.parse(signIn);
  static var userSignUp = Uri.parse(signUp);
  static var createPostUrl = Uri.parse(createPost);
}
