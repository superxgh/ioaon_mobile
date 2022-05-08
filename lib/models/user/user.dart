
class User {
  String? fullName;
  String? mobileNumber;
  String? email;
  String? password;
  dynamic googleData;
  dynamic facebookData;
  String? role;
  String? permissions;
  String? authToken;

  User({
    this.fullName,
    this.mobileNumber,
    this.email,
    this.password,
    this.googleData,
    this.facebookData,
    this.role,
    this.permissions,
    this.authToken
  });

  factory User.empty() =>
      User(
          fullName: '',
          mobileNumber: '',
          email: '',
          googleData: null,
          facebookData: null,
          role: '',
          permissions: '',
          authToken: ''
      );

  factory User.fromBackEndUser(Map<String, dynamic> json) =>
      User(
          fullName: json["fullName"],
          mobileNumber: json["mobileNumber"],
          email: json["email"],
          googleData: json["googleData"],
          facebookData: json["facebookData"],
          role: json["role"],
          permissions: json["permissions"],
          authToken: json["authToken"]
      );

  factory User.fromCreateUserByEmailMap(Map<String, dynamic> json) =>
      User(
          fullName: json["fullName"],
          mobileNumber: json["mobileNumber"],
          email: json["email"],
          password: json["password"]
      );

  Map<String, dynamic> toCreateUserByEmailMap() =>
      {
        "fullName": fullName,
        "mobileNumber": mobileNumber,
        "email": email,
        "password": password
      };

  @override
  String toString() => '''
  
  User {
    fullName: $fullName,
    mobileNumber: $mobileNumber,
    email: $email,
    password: $password,
    googleData: $googleData,
    facebookData: $facebookData,
    role: $role,
    permissions: $permissions,
    authToken: $authToken
  }
''';

}
