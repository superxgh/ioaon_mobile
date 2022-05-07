class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://10.0.2.2:3000";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // users
  static const String createUser = baseUrl + "/users";
  static const String emailSignInUser = baseUrl + "/users/emailsignin";

  // booking endpoints
  static const String getPosts = baseUrl + "/posts";
}