class ApiStrings {
  static const String ip = "192.168.1.100";
  static const String getPosts = "http://$ip:8080/api/survey/posts";
  static const String getPostsById = "http://$ip:8080/api/survey/posts/{{id}}";
  static const String updatePostById =
      "http://$ip:8080/api/survey/postupdate/{id}";
  static const String deletePostById =
      "http://$ip:8080/api/survey/postdelete/{id}";
  static const String createPost = "http://$ip:8080/api/survey/create";

  static var getPostsUrl = Uri.parse(getPosts);
}
