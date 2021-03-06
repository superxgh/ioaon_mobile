class Endpoints {
  Endpoints._();

  // base url
  // static const String baseUrl = "http://10.0.2.2:3000";
  static const String baseUrl = "http://127.0.0.1:3000";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // users
  static const String createUser = baseUrl + "/api/v1/users";
  static const String emailSignInUser = baseUrl + "/api/v1/users/emailsignin";
  static const String getUserByAuthToken = baseUrl + "/api/v1/users/authToken";

  // reference
  static const String getAccountTypes = baseUrl + "/referenceData/getAllSmallAccountType";
  static const String getAccountCodes = baseUrl + "/referenceData/getAllSmallAccountCode";

  // account
  static const String createAccountItem = baseUrl + "/accountData";
  static const String getAccountItemList = baseUrl + "/accountData";

  // booking endpoints
  static const String getPosts = baseUrl + "/posts";
}