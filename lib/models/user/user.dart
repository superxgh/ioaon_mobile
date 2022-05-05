
class User {
  String? fullName;
  String? mobileNumber;
  String? email;
  String? password;
  dynamic googleData;
  dynamic facebookData;
  String? role;
  String? permissions;
  String? token;

  User({
    this.fullName,
    this.mobileNumber,
    this.email,
    this.password,
    this.googleData,
    this.facebookData,
    this.role,
    this.permissions,
    this.token
  });

  factory User.fromCreateUserByEmailMap(Map<String, dynamic> json) => User(
    fullName: json["fullName"],
    mobileNumber: json["mobileNumber"],
    email: json["email"],
    password: json["password"]
  );

  Map<String, dynamic> toCreateUserByEmailMap() => {
    "fullName": fullName,
    "mobileNumber": mobileNumber,
    "email": email,
    "password": password
  };

}
