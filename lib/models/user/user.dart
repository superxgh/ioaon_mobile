
class User {
  String? _fullName;
  String? _mobileNumber;
  String? _email;
  String? _password;
  dynamic _googleData;
  dynamic _facebookData;
  String? _role;
  String? _permissions;
  String? _authToken;

  User({
    String? fullName,
    String? mobileNumber,
    String? email,
    String? password,
    dynamic googleData,
    dynamic facebookData,
    String? role,
    String? permissions,
    String? authToken,
  })  : _fullName = fullName,
        _mobileNumber = mobileNumber,
        _email = email,
        _googleData = googleData,
        _facebookData = facebookData,
        _role = role,
        _permissions = permissions,
        _authToken = authToken;

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

  dynamic toCreateUserByEmailMap() =>
      {
        "fullName": _fullName,
        "mobileNumber": _mobileNumber,
        "email": _email,
        "password": _password
      };

  @override
  String toString() {
    return 'User{fullName: $_fullName, mobileNumber: $_mobileNumber, email: $_email, password: $_password, googleData: $_googleData, facebookData: $_facebookData, role: $_role, permissions: $_permissions, authToken: $_authToken}';
  }

  String? get fullName => _fullName;

  String? get authToken => _authToken;

  String? get permissions => _permissions;

  String? get role => _role;

  dynamic get facebookData => _facebookData;

  dynamic get googleData => _googleData;

  String? get password => _password;

  String? get email => _email;

  String? get mobileNumber => _mobileNumber;
}
